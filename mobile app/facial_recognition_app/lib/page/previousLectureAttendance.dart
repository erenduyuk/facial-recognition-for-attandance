import 'package:flutter/material.dart';
import 'package:facial_recognition_app/model/Attendance.dart';
import 'package:facial_recognition_app/DatabaseManager.dart';

class PreviousLectureAttendance extends StatefulWidget {
  final String lectureName;
  final String lecturerID;

  const PreviousLectureAttendance(
      {Key? key, required this.lectureName, required this.lecturerID})
      : super(key: key);

  @override
  _PreviousLectureAttendanceState createState() =>
      _PreviousLectureAttendanceState();
}

class _PreviousLectureAttendanceState extends State<PreviousLectureAttendance> {
  late Future<List<Attendance>> _attendances;

  @override
  void initState() {
    super.initState();
    _attendances = Database().fetchAttendanceByLecturerAndLecture(
        widget.lecturerID, widget.lectureName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.lectureName} Geçmiş Yoklamalar'),
      ),
      body: FutureBuilder<List<Attendance>>(
        future: _attendances,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No attendances found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Attendance attendance = snapshot.data![index];
                return ListTile(
                  title: Text('Attendance ID: ${attendance.attendanceid}'),
                  subtitle: Text('Date: ${attendance.time}'),
                  onTap: () {
                    // Attendance detayları için gerekli işlemler
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
