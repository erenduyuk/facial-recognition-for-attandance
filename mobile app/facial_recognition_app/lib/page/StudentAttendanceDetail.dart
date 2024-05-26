import 'package:flutter/material.dart';
import 'package:facial_recognition_app/model/Lecturelist.dart';
import 'package:facial_recognition_app/DatabaseManager.dart';
import 'package:facial_recognition_app/model/Attendance.dart';

class StudentAttendanceDetail extends StatefulWidget {
  final Lecturelist lecture;

  StudentAttendanceDetail({required this.lecture});

  @override
  _StudentAttendanceDetailState createState() =>
      _StudentAttendanceDetailState();
}

class _StudentAttendanceDetailState extends State<StudentAttendanceDetail> {
  late Future<List<Attendance>> _attendanceDetails;

  @override
  void initState() {
    super.initState();
    _attendanceDetails = Database().fetchAttendanceByStudentAndLecture(
        widget.lecture.studentID, widget.lecture.lectureName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance Details'),
      ),
      body: FutureBuilder<List<Attendance>>(
        future: _attendanceDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No attendance records found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Attendance attendance = snapshot.data![index];
                return ListTile(
                  title: Text('Time: ${attendance.time}'),
                  subtitle: Text('Lecture: ${attendance.lectureName}'),
                  trailing: attendance.isAttend
                      ? Icon(Icons.check_circle, color: Colors.green)
                      : Icon(Icons.cancel, color: Colors.red),
                );
              },
            );
          }
        },
      ),
    );
  }
}
