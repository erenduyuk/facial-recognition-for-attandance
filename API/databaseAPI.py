import psycopg2
import asyncio
from fastapi import FastAPI, HTTPException, BackgroundTasks
from pydantic import BaseModel
from typing import List
from psycopg2 import sql
from pyngrok import ngrok
import nest_asyncio
import uvicorn
import sys
import os
import subprocess


# sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..', 'face_detection')))
# from model import FaceRecognizer 

script_path = os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "face_detection", "caller.py"))

idd = "idd"

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
    lectureID: str
    date: str
    
class CreateLecture(BaseModel):
    lectureid: str
    date: str
    lecturerid: str
    lecturename: str = None

class Attendance(BaseModel):
    studentID: str
    lectureID: str
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
            query = sql.SQL("SELECT * FROM users WHERE userid = %s AND userpassword = %s")
            cursor.execute(query, (userID, userPassword))
            user_record = cursor.fetchone()
        
        if user_record:
            if userID.startswith('a'):
                return {"status": "success", "message": "Lecturer"}
            elif userID.startswith('o'):
                return {"status": "success", "message": "Student"}
            else:
                return {"status": "success", "message": "Giriş başarılı"}
        else:
            return {"status": "fail", "message": "Kullanıcı adı veya şifre yanlış"}
    except Exception as e:
        print(f"Error during login check: {e}")
        raise HTTPException(status_code=500, detail="Sunucu hatası")
    finally:
        conn.close()

@app.get("/getCurrentAttendance/{lecture_id}")
async def get_current_attendance(lecture_id: str):
    try:
        conn = get_db_connection()
    except Exception as e:
        print(f"Database connection error: {e}")
        raise HTTPException(status_code=500, detail="Veritabanı bağlantı hatası")
    
    try:
        with conn.cursor() as cursor:
            query = sql.SQL("SELECT * FROM attendance WHERE lectureid = %s")
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
                SELECT *
                FROM lecture 
                
                WHERE lecturerid = %s
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

#PreviousAttendance page için
# @app.get("/getAttendanceByLecture/{lecture_id}")
# async def get_attendance_by_lecture(lecture_id: str):
#     try:
#         conn = get_db_connection()
#     except Exception as e:
#         print(f"Database connection error: {e}")
#         raise HTTPException(status_code=500, detail="Veritabanı bağlantı hatası")

#     try:
#         with conn.cursor() as cursor:
#             query = sql.SQL("""
#                 SELECT studentid, time, ishere
#                 FROM attendance
#                 WHERE lectureid = %s
#             """)
#             cursor.execute(query, (lecture_id,))
#             attendance_records = cursor.fetchall()

#         if attendance_records:
#             return {"status": "success", "attendance": attendance_records}
#         else:
#             return {"status": "fail", "message": "Yoklamalar bulunamadı"}
#     except Exception as e:
#         print(f"Error during attendance retrieval: {e}")
#         raise HTTPException(status_code=500, detail="Sunucu hatası")
#     finally:
#         conn.close()

#PreviousLectureAttendance page için
@app.get("/getAttendanceByLecturerAndLecture/")
async def get_attendance_by_lecturer_and_lecture(lecturer_id: str, lecture_name: str):
    try:
        conn = get_db_connection()
    except Exception as e:
        print(f"Database connection error: {e}")
        raise HTTPException(status_code=500, detail="Veritabanı bağlantı hatası")
    
    try:
        with conn.cursor() as cursor:
            query = sql.SQL("SELECT * FROM attendance WHERE lectureid = %s AND lecturename = %s")
            cursor.execute(query, (lecturer_id, lecture_name))
            attendance_records = cursor.fetchall()
        
        if attendance_records:
            return {"status": "success", "attendance": attendance_records}
        else:
            return {"status": "fail", "message": "Yoklamalar bulunamadı"}
    except Exception as e:
        print(f"Error during attendance retrieval: {e}")
        raise HTTPException(status_code=500, detail="Sunucu hatası")
    finally:
        conn.close()

@app.get("/getAttendances/{student_id}")
async def get_attendances(student_id: str):
    try:
        conn = get_db_connection()
    except Exception as e:
        print(f"Database connection error: {e}")
        raise HTTPException(status_code=500, detail="Veritabanı bağlantı hatası")
    
    try:
        with conn.cursor() as cursor:
            query = sql.SQL("SELECT * FROM attendance WHERE studentid = %s")
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


@app.get("/getLecturesByLecturer/{lecturer_id}")
async def get_lectures_by_lecturer(lecturer_id: str):
    try:
        conn = get_db_connection()
    except Exception as e:
        print(f"Database connection error: {e}")
        raise HTTPException(status_code=500, detail="Veritabanı bağlantı hatası")
    
    try:
        with conn.cursor() as cursor:
            query = sql.SQL("SELECT * FROM lecturelist WHERE lecturerid = %s")
            cursor.execute(query, (lecturer_id,))
            lecture_records = cursor.fetchall()
        
        if lecture_records:
            return {"status": "success", "lectures": lecture_records}
        else:
            return {"status": "fail", "message": "Dersler bulunamadı"}
    except Exception as e:
        print(f"Error during lecture retrieval: {e}")
        raise HTTPException(status_code=500, detail="Sunucu hatası")
    finally:
        conn.close()

@app.get("/getLecturesByStudent/{student_id}")
async def get_lectures_by_student(student_id: str):
    try:
        conn = get_db_connection()
    except Exception as e:
        print(f"Database connection error: {e}")
        raise HTTPException(status_code=500, detail="Veritabanı bağlantı hatası")
    
    try:
        with conn.cursor() as cursor:
            query = sql.SQL("SELECT * FROM lectureliststudent WHERE studentid = %s")
            cursor.execute(query, (student_id,))
            lecture_records = cursor.fetchall()
        
        if lecture_records:
            return {"status": "success", "lectures": lecture_records}
        else:
            return {"status": "fail", "message": "Dersler bulunamadı"}
    except Exception as e:
        print(f"Error during lecture retrieval: {e}")
        raise HTTPException(status_code=500, detail="Sunucu hatası")
    finally:
        conn.close()

@app.get("/getAttendanceByStudentAndLecture/")
async def get_attendance_by_student_and_lecture(student_id: str, lecture_name: str):
    try:
        conn = get_db_connection()
    except Exception as e:
        print(f"Database connection error: {e}")
        raise HTTPException(status_code=500, detail="Veritabanı bağlantı hatası")
    
    try:
        with conn.cursor() as cursor:
            query = sql.SQL("SELECT * FROM attendance WHERE studentid = %s AND lecturename = %s")
            cursor.execute(query, (student_id, lecture_name))
            attendance_records = cursor.fetchall()
        
        if attendance_records:
            return {"status": "success", "attendance": attendance_records}
        else:
            return {"status": "fail", "message": "Yoklamalar bulunamadı"}
    except Exception as e:
        print(f"Error during attendance retrieval: {e}")
        raise HTTPException(status_code=500, detail="Sunucu hatası")
    finally:
        conn.close()

# async def start_face_recognition(lectureid):
#     model = FaceRecognizer(lectureID=lectureid)
#     model.start_recognition()

@app.get("/createLecture")
async def create_lecture(lectureid: str, date: str, lecturerid: str, lecturename: str):
    
    subprocess.Popen(["python3", script_path, lectureid])
    try:
        conn = get_db_connection()
    except Exception as e:
        print(f"Database connection error: {e}")
        raise HTTPException(status_code=500, detail="Veritabanı bağlantı hatası")
    
    try:
        with conn.cursor() as cursor:
            query = sql.SQL("INSERT INTO lecture (lectureid, date, lecturerid, lecturename) VALUES (%s, %s, %s, %s)")
            cursor.execute(query, (lectureid, date, lecturerid, lecturename))
            conn.commit()
        
        return {"status": "success", "message": "Ders oluşturuldu"}
    except Exception as e:
        print(f"Error during lecture creation: {e}")
        raise HTTPException(status_code=500, detail="Sunucu hatası")
    finally:
        conn.close()

@app.get("/markAttendance")
async def mark_attendance(studentID: str, lectureID: str):
    try:
        conn = get_db_connection()
    except Exception as e:
        print(f"Database connection error: {e}")
        raise HTTPException(status_code=500, detail="Veritabanı bağlantı hatası")
    
    try:
        with conn.cursor() as cursor:
            query = sql.SQL("UPDATE attendance SET ishere = %s WHERE studentid = %s AND lectureid = %s")
            cursor.execute(query, (True, studentID, lectureID))
            conn.commit()

        
        return {"status": "success", "message": "Yoklama işaretlendi"}
    except Exception as e:
        print(f"Error during marking attendance: {e}")
        raise HTTPException(status_code=500, detail="Sunucu hatası")
    finally:
        conn.close()

@app.get("/hello")
async def hello():
    return {"message": "Hello, world!"}


ngrok_tunnel = ngrok.connect(8000)
print("Public URL:", ngrok_tunnel.public_url)
nest_asyncio.apply()
uvicorn.run(app, port=8000)
