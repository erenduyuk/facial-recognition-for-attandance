import 'package:flutter/material.dart';
import 'package:facial_recognition_app/model/Attendance.dart';
import 'package:facial_recognition_app/model/Lecturer.dart';
import 'package:facial_recognition_app/model/Lecture.dart';
import 'package:facial_recognition_app/DatabaseManager.dart';
// import 'package:facial_recognition_app/page/AttendanceDetailPage.dart';
import 'package:facial_recognition_app/page/PreviousLectureAttendance.dart';

class PreviousAttendancePage extends StatefulWidget {
  final Lecturer lecturer;
  const PreviousAttendancePage({Key? key, required this.lecturer})
      : super(key: key);

  @override
  _PreviousAttendancePageState createState() => _PreviousAttendancePageState();
}

class _PreviousAttendancePageState extends State<PreviousAttendancePage> {
  late Future<List<Lecture>> _lectures;

  @override
  void initState() {
    super.initState();
    _lectures =
        Database().fetchPreviousLecturesForLecturer(widget.lecturer.lecturerID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lectures'),
      ),
      body: FutureBuilder<List<Lecture>>(
        future: _lectures,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No lectures found'));
          } else {
            // Benzersiz ders isimlerini toplamak için bir Set kullanıyoruz
            Set<String> uniqueLectureNames =
                snapshot.data!.map((lecture) => lecture.lectureName).toSet();
            return ListView.builder(
              itemCount: uniqueLectureNames.length,
              itemBuilder: (context, index) {
                String lectureName = uniqueLectureNames.elementAt(index);
                return ListTile(
                  // title: Text('${lecture.lectureID} - ${lecture.date}'), // Ders kimliği ve tarihini birleştirerek göster
                  title: Text(lectureName),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PreviousLectureAttendance(
                          lectureName: lectureName,
                          lecturerID: widget.lecturer.lecturerID,
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
