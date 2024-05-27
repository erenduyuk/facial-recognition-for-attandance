import requests

def mark_attendance(studentID: str, lectureID: str):
    url = "http://localhost:8000/markAttendance"  # FastAPI sunucunuzun URL'si
    params = {
        "studentID": studentID,
        "lectureID": lectureID
    }
    
    try:
        response = requests.get(url, params=params)
        response.raise_for_status()  # HTTPError için kontrol
        
        data = response.json()
        if data["status"] == "success":
            print("Yoklama başarıyla işaretlendi")
        else:
            print("Yoklama işaretleme başarısız:", data["message"])
    except requests.exceptions.RequestException as e:
        print(f"HTTP isteği sırasında hata: {e}")

# Örnek kullanım
mark_attendance("12345", "67890")
