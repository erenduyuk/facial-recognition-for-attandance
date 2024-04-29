import psycopg2
from fastapi import FastAPI, HTTPException


# PostgreSQL bağlantısı
conn = psycopg2.connect(
    dbname="postgres",
    user="admindb",
    password="facialdb1.",
    host="facialdb.postgres.database.azure.com",
    port="5432"
)

# Tablo oluşturma sorgusu
create_table_query = '''
CREATE TABLE IF NOT EXISTS employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    department VARCHAR(100)
);
'''

# PostgreSQL üzerinde sorguyu çalıştırma
with conn.cursor() as cursor:
    cursor.execute(create_table_query)

# Değişiklikleri kaydetme
conn.commit()

# Bağlantıyı kapatma
conn.close()


app = FastAPI()



@app.get("/checkLogin")
async def check_login(userID: str, password: str):
    try:
        # Veritabanında kullanıcıyı sorgulama
        with conn.cursor() as cursor:
            cursor.execute("SELECT * FROM USER WHERE userID = %s AND password = %s", (userID, password))
            user = cursor.fetchone()
        
        # Kullanıcı var mı yok mu kontrol etme
        if user:
            return {"status": "success", "message": "Giriş başarılı"}
        else:
            raise HTTPException(status_code=401, detail="Kullanıcı adı veya şifre yanlış")
    except Exception as e:
        raise HTTPException(status_code=500, detail="Sunucu hatası")
    




@app.get("/getCurrentAttendance/{lecture_id}")
async def get_current_attendance(lecture_id: int):
    try:
        # Veritabanında dersin mevcut yoklamasını sorgulama
        with conn.cursor() as cursor:
            cursor.execute("SELECT * FROM attendance WHERE lecture_id = %s", (lecture_id,))
            attendance = cursor.fetchall()

        if attendance:
            return {"status": "success", "attendance": attendance}
        else:
            raise HTTPException(status_code=404, detail="Mevcut yoklama bulunamadı")
    except Exception as e:
        raise HTTPException(status_code=500, detail="Sunucu hatası")







# Bağlantıyı kapatma
conn.close()

