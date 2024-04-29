import 'package:facial_recognition_app/page/PreviousAttendancePage.dart';
import 'package:flutter/material.dart';
import 'package:facial_recognition_app/page/StartAttendance.dart';
import 'package:facial_recognition_app/model/Attendance.dart';
import 'package:facial_recognition_app/model/Student.dart';

class firstPage extends StatelessWidget {
  const firstPage({Key? key}) : super(key: key);

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
                  primary: Colors.blue,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StartAttendancePage()),
                  );
                },
                child: Text('Yoklama Başlat',
                style: TextStyle(color: Colors.white),),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 30.0)),
            // İkinci buton
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.47,
              height: MediaQuery.of(context).size.height * 0.05,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                onPressed: () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PreviousAttendancePage(previousAttendances: [],)),
                  );
                },
                child: Text('Geçmiş Yoklamalar',
                    style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      );
  }
}