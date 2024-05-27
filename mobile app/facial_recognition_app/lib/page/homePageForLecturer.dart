import 'package:flutter/material.dart';
import 'package:facial_recognition_app/page/PreviousAttendancePage.dart';
import 'package:facial_recognition_app/page/StartAttendance.dart';
import 'package:facial_recognition_app/model/Lecturer.dart';
import 'package:facial_recognition_app/page/LoginPage.dart';

class HomePageForLecturer extends StatelessWidget {
  final Lecturer lecturer;
  const HomePageForLecturer({Key? key, required this.lecturer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 60.0)),
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Center(
              child: Image.asset(
                'assets/D_Renkli_AçıkZemin.png', // Burada kendi resminizin yolunu belirtin
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 20.0)),
          // İlk buton
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.47,
            height: MediaQuery.of(context).size.height * 0.05,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => StartAttendancePage(
                            lecturerId: lecturer.lecturerID,
                          )),
                );
              },
              child: Text(
                'Yoklama Başlat',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 30.0)),
          // İkinci buton
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.47,
            height: MediaQuery.of(context).size.height * 0.05,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PreviousAttendancePage(
                            lecturer: lecturer,
                          )),
                );
              },
              child: Text(
                'Geçmiş Yoklamalar',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Spacer(),
          // Log out butonu
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.47,
            height: MediaQuery.of(context).size.height * 0.05,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (Route<dynamic> route) => false,
                );
              },
              child: Text(
                'Çıkış Yap',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 30.0)),
        ],
      ),
    );
  }
}
