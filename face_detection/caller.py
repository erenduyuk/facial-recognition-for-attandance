from model import FaceRecognizer
import sys

lectureid = sys.argv[1]

face_recognizer = FaceRecognizer(lectureID=lectureid)
face_recognizer.start_recognition()