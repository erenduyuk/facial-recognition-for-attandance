import cv2
import numpy as np
import os
import time
import sqlite3

# Connect to the database
conn = sqlite3.connect('face_logs.db')
c = conn.cursor()

# Create a table to store face recognition logs
c.execute('''CREATE TABLE IF NOT EXISTS face_logs
             (id INTEGER PRIMARY KEY AUTOINCREMENT,
              name TEXT,
              confidence REAL,
              timestamp DATETIME DEFAULT CURRENT_TIMESTAMP)''')
conn.commit()

model = cv2.face.LBPHFaceRecognizer_create()
model.read("face_recognizer.xml")

# Load the trained model for face detection
face_classifier = cv2.CascadeClassifier("haarcascade_frontalface_default.xml")
confidences = []
count_tolga = 0
count_ufuk = 0

# Define a function to detect faces and recognize them
def face_detector(img, size=0.75):
    global count_tolga, count_ufuk
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    faces = face_classifier.detectMultiScale(gray, 1.2, 5)
    for (x, y, w, h) in faces:
        # Extract the region of interest (face) from the image
        roi = gray[y:y+h, x:x+w]
        roi = cv2.resize(roi, (600, 600))
        # Predict the label and confidence for the face
        label, confidence = model.predict(roi)
        # Display the name of the person if confidence is high enough
        if confidence < 100:
            label_text = f"Person {label}"  # Assuming each label corresponds to a person
            if label == 1:
                count_ufuk += 1
                label_text += ": Ufuk"
            else:
                count_tolga += 1
                label_text += ": Tolga"
            cv2.putText(img, label_text, (x, y-20), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 0), 2)
            cv2.putText(img, f"Confidence: {round(confidence, 2)}", (x, y-50), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 0), 2)
            confidences.append(confidence)
            # Insert the log into the database
            if confidence < 50:
                c.execute("INSERT INTO face_logs (name, confidence) VALUES (?, ?)", (label_text, confidence))
            conn.commit()
        else:
            cv2.putText(img, "Not A Person!", (x, y-20), cv2.FONT_HERSHEY_SIMPLEX, 1, (255, 0, 0), 2)
        # Draw a rectangle around the detected face
        cv2.rectangle(img, (x, y), (x+w, y+h), (255, 0, 0), 2)
    return img

# Start the webcam
cam = cv2.VideoCapture(0)

start_time = time.time()
log_interval = 10  # in seconds

while True:
    ret, frame = cam.read()
    if not ret:
        break
    frame = face_detector(frame)

    cv2.imshow("Face Recognition", frame)
    if cv2.waitKey(1) == ord('q'):  # If 'q' is pressed, exit the loop
        break

    # Check if it's time to log
    if time.time() - start_time >= log_interval:
        start_time = time.time()
        print(f"Avg confidence: {sum(confidences)/len(confidences)}")
        print(f"Max confidence: {max(confidences)}")
        if count_tolga > count_ufuk:
            print("Sen Tolga'sın")
        else:   
            print("Sen Ufuk'sun")
        count_tolga = 0
        count_ufuk = 0

# Release the webcam and close all windows
cam.release() 
cv2.destroyAllWindows()

# Close the database connection
conn.close()
