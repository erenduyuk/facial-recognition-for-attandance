import cv2
import numpy as np
import os
from PIL import Image

# Define the path to the dataset
dataset_path = "./photos/"

# Initialize lists to store training data and labels
Training_Data = []
Labels = []

# Iterate through each folder (person) in the dataset
for label, person_folder in enumerate(os.listdir(dataset_path)):
    if person_folder.startswith("."):
        continue
    print(f"Processing {person_folder} and its label is {label}")
    for image_file in os.listdir(os.path.join(dataset_path, person_folder)):
        # Load the image
        image_path = os.path.join(dataset_path, person_folder, image_file)
        image = Image.open(image_path).convert("L")  # Convert the image to grayscale
        image = image.resize((800, 800))
        # Append the image to training data and its corresponding label
        #image = cv2.resize(image, (600, 600))
        Training_Data.append(np.asarray(image, dtype=np.uint8))
        Labels.append(label)

print(Labels)
# Convert lists to numpy arrays
Labels = np.asarray(Labels, dtype=np.int32)

# Create and train the face recognition model
model = cv2.face.LBPHFaceRecognizer_create()
#model = cv2.face.EigenFaceRecognizer_create()
#model = cv2.face.FisherFaceRecognizer_create()
model.train(np.asarray(Training_Data), np.asarray(Labels))
print("Model Training Complete!!!!!")
model.save("face_recognizer.xml")