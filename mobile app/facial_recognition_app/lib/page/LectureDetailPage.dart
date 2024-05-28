import 'package:flutter/material.dart';
import 'package:facial_recognition_app/model/Attendance.dart';
import 'package:facial_recognition_app/model/Lecture.dart';
import 'package:facial_recognition_app/DatabaseManager.dart';
import 'package:facial_recognition_app/model/Student.dart';

class LectureDetailPage extends StatefulWidget {
  final String lectureID;

  const LectureDetailPage({Key? key, required this.lectureID}) : super(key: key);

  @override
  _LectureDetailPageState createState() => _LectureDetailPageState();
}

class _LectureDetailPageState extends State<LectureDetailPage> {
  late Future<List<Attendance>> _attendanceDetails;

  @override
  void initState() {
    super.initState();
    _attendanceDetails = Database().fetchAttendanceForLecture(widget.lectureID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yoklama Detayı: ${widget.lectureID}'),
      ),
      body: FutureBuilder<List<Attendance>>(
        future: _attendanceDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Attendance not found'));
          } else {
            List<Attendance> attendances = snapshot.data!;
            return ListView.builder(
              itemCount: attendances.length,
              itemBuilder: (context, index) {
                Attendance attendance = attendances[index];
                return ListTile(
                  leading: Text(attendance.lectureID),
                  title: Text(attendance.studentID), // Öğrenci ismi gibi bilgileri almak için Student modeline gerek var
                  trailing: Checkbox(
                    value: attendance.isAttend,
                    onChanged: null, // Checkbox'ı devre dışı bırak
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}