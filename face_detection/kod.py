import cv2
import numpy as np
import os
from PIL import Image

model = cv2.face_LBPHFaceRecognizer.create()
model.read("face_recognizer.xml")

# Load the trained model for face detection
face_classifier = cv2.CascadeClassifier("haarcascade_frontalface_default.xml")
confidences =[]
count_tolga = 0
count_kadriye = 0
# Define a function to detect faces and recognize them
def face_detector(img, size=0.75):
    count = 0
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    faces = face_classifier.detectMultiScale(gray, 1.2, 5)
    for (x, y, w, h) in faces:
        # Extract the region of interest (face) from the image
        roi = gray[y:y+h, x:x+w]
        roi = cv2.resize(roi, (600, 600))
        # Predict the label and confidence for the face
        label, confidence = model.predict(roi)
        # Display the name of the person if confidence is high enough
        if count%100==0:
            if confidence < 100:
                label_text = f"Person {label}"  # Assuming each label corresponds to a person
                if label+1==1:
                    global count_tolga
                    count_tolga+=1
                else:
                    global count_kadriye
                    count_kadriye+=1
                cv2.putText(img, label_text, (x, y-20), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 0), 2)
                cv2.putText(img, f"Confidence: {round(confidence, 2)}", (x, y-50), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 0), 2)
                confidences.append(confidence)
            # Draw a rectangle around the detected face
            else:
                cv2.putText(img, "Not A Person!", (x, y-20), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 0, 0), 2)
            cv2.rectangle(img, (x, y), (x+w, y+h), (255, 0, 0), 2)
        count+=1
    return img

# Start the webcam
cam = cv2.VideoCapture(0)

while True:
    ret, frame = cam.read()
    if not ret:
        break
    frame = face_detector(frame)

    cv2.imshow("Face Recognition", frame)
    if cv2.waitKey(1) == ord('q'):  # If 'q' is pressed, exit the loop
        break

print(f"Avg confidence: {sum(confidences)/len(confidences)}")
print(f"Max confidence: {max(confidences)}")

if count_tolga>count_kadriye:
    print("Sen Tolga'sın")
else:   
    print("Sen Kadriye'sin")

cam.release() 
cv2.destroyAllWindows()