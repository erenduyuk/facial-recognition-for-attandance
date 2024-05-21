import psycopg2
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import List
from psycopg2 import sql

app = FastAPI()

DATABASE_CONFIG = {
    'dbname': 'postgres',
    'user': 'admindb',
    'password': 'facialdb1.',
    'host': 'facialdb.postgres.database.azure.com',
    'port': '5432'
}

def get_db_connection():
    return psycopg2.connect(**DATABASE_CONFIG)

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

@app.get("/checkLogin")
async def check_login(userID: str, userPassword: str):
    try:
        conn = get_db_connection()
    except Exception as e:
        print(f"Database connection error: {e}")
        raise HTTPException(status_code=500, detail="Veritabanı bağlantı hatası")
    
    try:
        with conn.cursor() as cursor:
            query = sql.SQL("SELECT * FROM Users WHERE userID = %s AND userPassword = %s")
            cursor.execute(query, (userID, userPassword))
            user_record = cursor.fetchone()
        
        if user_record:
            return {"status": "success", "message": "Giriş başarılı"}
        else:
            return {"status": "fail", "message": "Kullanıcı adı veya şifre yanlış"}
    except Exception as e:
        print(f"Error during login check: {e}")
        raise HTTPException(status_code=500, detail="Sunucu hatası")
    finally:
        conn.close()

@app.get("/getCurrentAttendance/{lecture_id}")
async def get_current_attendance(lecture_id: int):
    try:
        conn = get_db_connection()
    except Exception as e:
        print(f"Database connection error: {e}")
        raise HTTPException(status_code=500, detail="Veritabanı bağlantı hatası")
    
    try:
        with conn.cursor() as cursor:
            query = sql.SQL("SELECT * FROM Attendance WHERE lectureID = %s")
            cursor.execute(query, (lecture_id,))
            attendance_records = cursor.fetchall()
        
        if attendance_records:
            return {"status": "success", "attendance": attendance_records}
        else:
            return {"status": "fail", "message": "Mevcut yoklama bulunamadı"}
    except Exception as e:
        print(f"Error during attendance retrieval: {e}")
        raise HTTPException(status_code=500, detail="Sunucu hatası")
    finally:
        conn.close()

@app.get("/getPreviousLectures/{user_id}")
async def get_previous_lectures(user_id: str):
    try:
        conn = get_db_connection()
    except Exception as e:
        print(f"Database connection error: {e}")
        raise HTTPException(status_code=500, detail="Veritabanı bağlantı hatası")
    
    try:
        with conn.cursor() as cursor:
            query = sql.SQL("""
                SELECT Lecture.lectureID, Lecture.date 
                FROM Lecture 
                JOIN Lecturer ON Lecture.lectureID = Lecturer.lectureID 
                WHERE Lecturer.userID = %s
            """)
            cursor.execute(query, (user_id,))
            lectures = cursor.fetchall()
        
        if lectures:
            return {"status": "success", "lectures": lectures}
        else:
            return {"status": "fail", "message": "Önceki dersler bulunamadı"}
    except Exception as e:
        print(f"Error during lecture retrieval: {e}")
        raise HTTPException(status_code=500, detail="Sunucu hatası")
    finally:
        conn.close()

@app.post("/startRecognition")
async def start_recognition():
    # Recognition başlatma işlemi burada gerçekleştirilecek
    # Bu örnekte sadece başarılı bir dönüş sağlanıyor
    return {"status": "success", "message": "Yüz tanıma başlatıldı"}

@app.post("/stopRecognition")
async def stop_recognition():
    # Recognition durdurma işlemi burada gerçekleştirilecek
    # Bu örnekte sadece başarılı bir dönüş sağlanıyor
    return {"status": "success", "message": "Yüz tanıma durduruldu"}

@app.get("/getAttendances/{student_id}")
async def get_attendances(student_id: str):
    try:
        conn = get_db_connection()
    except Exception as e:
        print(f"Database connection error: {e}")
        raise HTTPException(status_code=500, detail="Veritabanı bağlantı hatası")
    
    try:
        with conn.cursor() as cursor:
            query = sql.SQL("SELECT * FROM Attendance WHERE studentID = %s")
            cursor.execute(query, (student_id,))
            attendances = cursor.fetchall()
        
        if attendances:
            return {"status": "success", "attendances": attendances}
        else:
            return {"status": "fail", "message": "Yoklamalar bulunamadı"}
    except Exception as e:
        print(f"Error during attendance retrieval: {e}")
        raise HTTPException(status_code=500, detail="Sunucu hatası")
    finally:
        conn.close()
