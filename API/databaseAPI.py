import psycopg2
from fastapi import FastAPI, HTTPException
from pyngrok import ngrok



# PostgreSQL bağlantısı
conn = psycopg2.connect(
    dbname="postgres",
    user="admindb",
    password="facialdb1.",
    host="facialdb.postgres.database.azure.com",
    port="5432"
)

# #Tablo oluşturma sorgusu
# create_table_query = '''
# CREATE TABLE IF NOT EXISTS employees (
#     employee_id SERIAL PRIMARY KEY,
#     first_name VARCHAR(50),
#     last_name VARCHAR(50),
#     email VARCHAR(100),
#     department VARCHAR(100)
# );
# '''

# # PostgreSQL üzerinde sorguyu çalıştırma
# with conn.cursor() as cursor:
#     cursor.execute(create_table_query)

# # Değişiklikleri kaydetme
# conn.commit()

# # Bağlantıyı kapatma
# conn.close()


app = FastAPI()



@app.get("/checkLogin")
async def check_login(userID: str, password: str):
    try:
        conn = psycopg2.connect(
        dbname="postgres",
        user="admindb",
        password="facialdb1.",
        host="facialdb.postgres.database.azure.com",
        port="5432"
    )
        # Veritabanında kullanıcıyı sorgulama
        with conn.cursor() as cursor:
            cursor.execute(f"SELECT * FROM USERS WHERE userid = '{userID}' AND userpassword = '{password}'")
            user = cursor.fetchone()
            
        conn.close()
        
        # Kullanıcı var mı yok mu kontrol etme
        if user:
            return {"status": "success", "message": "Giriş başarılı"}
        else:
            raise HTTPException(status_code=401, detail="Kullanıcı adı veya şifre yanlış")
    except Exception as e:
        raise HTTPException(status_code=401, detail="Kullanıcı adı veya şifre yanlış")
    




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


# ngrok_tunnel = ngrok.connect(8000)
# print("Public URL:", ngrok_tunnel.public_url)




# Bağlantıyı kapatma
conn.close()

