import os
import sys

sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..', 'face_detection')))
from model import FaceRecognizer 

model = FaceRecognizer()
model.start_recognition()
