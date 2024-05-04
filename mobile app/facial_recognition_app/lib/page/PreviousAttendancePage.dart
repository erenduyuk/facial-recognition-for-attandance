import 'package:flutter/material.dart';
import 'package:facial_recognition_app/page/AttendanceDetailPage.dart';
import 'package:facial_recognition_app/model/Attendance.dart';
import 'package:facial_recognition_app/model/Lecturer.dart';
import 'package:facial_recognition_app/model/Lecture.dart';

class PreviousAttendancePage extends StatelessWidget {
  final Lecturer lecturer;
  const PreviousAttendancePage({Key? key, required this.lecturer}) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        title: Text('Eski Yoklamalar'),
      ),
      body: ListView.builder(
        itemCount: lecturer.previousLectures.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(lecturer.previousLectures[index].date.toString()),
            onTap: () {
              // Tıklanan yoklamanın detay sayfasına yönlendirme işlemi
              Navigator.push(
                context,
                MaterialPageRoute(

                  builder: (context) => AttendanceDetailPage(lectureID: lecturer.previousLectures[index].lectureID,),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
