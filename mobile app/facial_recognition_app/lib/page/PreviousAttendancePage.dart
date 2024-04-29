import 'package:flutter/material.dart';
import 'package:facial_recognition_app/page/AttendanceDetailPage.dart';
import 'package:facial_recognition_app/model/Attendance.dart';

class PreviousAttendancePage extends StatelessWidget {
  final List<Attendance> previousAttendances;

  const PreviousAttendancePage({Key? key, required this.previousAttendances}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eski Yoklamalar'),
      ),
      body: ListView.builder(
        itemCount: previousAttendances.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(previousAttendances[index].id),
            onTap: () {
              // Tıklanan yoklamanın detay sayfasına yönlendirme işlemi
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AttendanceDetailPage(attendanceName: previousAttendances[index].id),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
