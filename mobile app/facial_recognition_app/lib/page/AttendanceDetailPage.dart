import 'package:facial_recognition_app/model/Attendance.dart';
import 'package:facial_recognition_app/model/Lecture.dart';
import 'package:flutter/material.dart';
import 'package:facial_recognition_app/model/Student.dart';
import 'package:facial_recognition_app/model/Lecturer.dart';

class AttendanceDetailPage extends StatelessWidget {
  final String lectureID; // Önceki yoklamanın adı

  const AttendanceDetailPage({Key? key, required this.lectureID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Burada önceki yoklamadan verileri alabilirsiniz, şimdilik örnek bir liste kullanıyorum
    final Lecture lecture = Lecture(lectureID: lectureID, date: DateTime.now(), attendances: []);
    return Scaffold(
      appBar: AppBar(
        title: Text('Yoklama Detayı: ${attendance.lectureID}'),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text(students[index].number.toString()),
            title: Text('${students[index].name} ${students[index].surname}'),
            trailing: Checkbox(
              value: students[index].checked,
              onChanged: null, // Checkbox'ın etkinliği devre dışı bırakıldı
            ),
          );
        },
      ),
    );
  }
}