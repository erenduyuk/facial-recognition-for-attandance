import cv2
import numpy as np
import os
import time
import requests
import signal

running = True

def signal_handler(sig, frame):
    global running
    running = False
    print('Stopping face recognition...')

signal.signal(signal.SIGINT, signal_handler)
signal.signal(signal.SIGTERM, signal_handler)


class FaceRecognizer:
    def __init__(self, lectureID):

        self.lectureID = lectureID
        self.model = cv2.face.LBPHFaceRecognizer_create()
        self.model.read("face_recognizer.xml")

        self.face_classifier = cv2.CascadeClassifier("haarcascade_frontalface_default.xml")
        self.confidences = []
        self.count_tolga = 0
        self.count_ufuk = 0
        self.count_eren = 0

    def face_detector(self, img, size=0.75):
        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
        faces = self.face_classifier.detectMultiScale(gray, 1.5, 5)
        for (x, y, w, h) in faces:
            roi = gray[y:y+h, x:x+w]
            roi = cv2.resize(roi, (800, 800))
            label, confidence = self.model.predict(roi)
            if confidence < 50:
                label_text = f"Person {label}"  # Assuming each label corresponds to a person
                if label == 1:
                    self.count_ufuk += 1
                    label_text += ": Ufuk"
                elif label == 2:
                    self.count_tolga += 1
                    label_text += ": Tolga"
                elif label == 3:
                    self.count_eren += 1
                    label_text += ": Eren"
                cv2.putText(img, label_text, (x, y-20), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 0), 2)
                cv2.putText(img, f"Confidence: {round(confidence, 2)}", (x, y-50), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 0), 2)
                self.confidences.append(confidence)
                if confidence < 30:
                    print("Log: ", label_text, round(confidence, 2))
            else:
                cv2.putText(img, "Not A Person!", (x, y-20), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 0, 0), 2)
            cv2.rectangle(img, (x, y), (x+w, y+h), (255, 0, 0), 2)
        return img

    def start_recognition(self):
        global running
        global cam
        cam = cv2.VideoCapture(0)
        start_time = time.time()
        log_interval = 10  # in seconds

        while running:
            ret, frame = cam.read()
            if not ret:
                break
            frame = self.face_detector(frame)

            cv2.imshow("Face Recognition", frame)
            if cv2.waitKey(1) == ord('q'):  # If 'q' is pressed, exit the loop
                break

            # Check if it's time to log
            if time.time() - start_time >= log_interval:
                start_time = time.time()
                print(f"Avg confidence: {sum(self.confidences)/len(self.confidences)}")
                print(f"Max confidence: {max(self.confidences)}")
                ugtt = self.count_ufuk > self.count_tolga
                egtu = self.count_eren > self.count_ufuk
                tgte = self.count_tolga > self.count_eren
                if tgte and (not ugtt):
                    mark_attendance("o1", self.lectureID)
                    print("Sen Tolga'sın")
                elif tgte and ugtt:
                    mark_attendance("o2", self.lectureID)
                    print("Sen Ufuk'sun")
                elif egtu and (not tgte):
                    mark_attendance("o3", self.lectureID)
                    print("Sen Eren'sin")
                self.confidences = []  # Reset confidence list for next interval
                self.count_tolga = 0  # Reset counters for next interval
                self.count_ufuk = 0
                self.count_eren = 0
 
        
    

    def stop_attendance(self):
        global cam
        cam.release()
        cv2.destroyAllWindows()


def mark_attendance(studentID, lectureID):

    url = "https://b922-95-70-138-229.ngrok-free.app/markAttendance"

    params = {
        "studentID": studentID,
        "lectureID": lectureID
    }

    try:
        response = requests.get(url, params=params)
        response.raise_for_status()  # Raise an HTTPError for bad responses (4xx or 5xx)
        
        # If the request was successful, the response's JSON content can be accessed
        data = response.json()
        print("Response:", data)
        return data
    except requests.exceptions.HTTPError as errh:
        print ("HTTP Error:", errh)
    except requests.exceptions.ConnectionError as errc:
        print ("Error Connecting:", errc)
    except requests.exceptions.Timeout as errt:
        print ("Timeout Error:", errt)
    except requests.exceptions.RequestException as err:
        print ("An error occurred:", err)