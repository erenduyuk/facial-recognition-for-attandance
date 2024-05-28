import requests

def mark_attendance(studentID, lectureID):
    url = "https://2705-193-255-169-24.ngrok-free.app/markAttendance"
    params = {
        "studentID": studentID,
        "lectureID": lectureID
    }

    try:
        response = requests.get(url, params=params)
        response.raise_for_status()  # Raise an HTTPError for bad responses (4xx or 5xx)
        
        # If the request was successful, the response's JSON content can be accessed
        data = response.json()
        print("Response:", data)
        return data
    except requests.exceptions.HTTPError as errh:
        print ("HTTP Error:", errh)
    except requests.exceptions.ConnectionError as errc:
        print ("Error Connecting:", errc)
    except requests.exceptions.Timeout as errt:
        print ("Timeout Error:", errt)
    except requests.exceptions.RequestException as err:
        print ("An error occurred:", err)

mark_attendance("o3", "lec4")