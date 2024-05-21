from pydantic import BaseModel
from typing import List

class User(BaseModel):
    userID: str
    userPassword: str

class Lecture(BaseModel):
    lectureID: int
    date: str

class Attendance(BaseModel):
    studentID: str
    lectureID: int
    time: str
    isHere: bool

class Student(BaseModel):
    studentID: str
