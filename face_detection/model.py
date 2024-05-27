import cv2
import numpy as np
import os
import time
import sqlite3


class FaceRecognizer:
    def __init__(self):
        self.model = cv2.face.LBPHFaceRecognizer_create()
        self.model.read("face_recognizer.xml")

        self.face_classifier = cv2.CascadeClassifier("haarcascade_frontalface_default.xml")
        self.confidences = []
        self.count_tolga = 0
        self.count_ufuk = 0
        self.count_eren = 0

    def face_detector(self, img, size=0.75):
        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
        faces = self.face_classifier.detectMultiScale(gray, 1.2, 5)
        for (x, y, w, h) in faces:
            roi = gray[y:y+h, x:x+w]
            roi = cv2.resize(roi, (600, 600))
            label, confidence = self.model.predict(roi)
            if confidence < 50:
                label_text = f"Person {label}"  # Assuming each label corresponds to a person
                if label == 1:
                    self.count_ufuk += 1
                    label_text += ": Ufuk"
                else:
                    self.count_tolga += 1
                    label_text += ": Tolga"
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
        cam = cv2.VideoCapture(0)
        start_time = time.time()
        log_interval = 10  # in seconds

        while True:
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
                if self.count_tolga > self.count_ufuk:
                    print("Sen Tolga'sun")
                else:
                    print("Sen Ufuk'sın")
                self.confidences = []  # Reset confidence list for next interval
                self.count_tolga = 0  # Reset counters for next interval
                self.count_ufuk = 0

        cam.release()
        cv2.destroyAllWindows()