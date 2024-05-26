import 'package:flutter/material.dart';
import 'package:facial_recognition_app/model/Attendance.dart';
import 'package:facial_recognition_app/model/Lecturer.dart';
import 'package:facial_recognition_app/model/Lecture.dart';
import 'package:facial_recognition_app/DatabaseManager.dart';
import 'package:facial_recognition_app/page/AttendanceDetailPage.dart';

class PreviousAttendancePage extends StatefulWidget {
  final Lecturer lecturer;
  const PreviousAttendancePage({Key? key, required this.lecturer}) : super(key: key);

  @override
  _PreviousAttendancePageState createState() => _PreviousAttendancePageState();
}

class _PreviousAttendancePageState extends State<PreviousAttendancePage> {
  late Future<List<Lecture>> _previousLectures;

  @override
  void initState() {
    super.initState();
    _previousLectures = Database().fetchPreviousLecturesForLecturer(widget.lecturer.lecturerID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eski Yoklamalar'),
      ),
      body: FutureBuilder<List<Lecture>>(
        future: _previousLectures,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No lectures found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Lecture lecture = snapshot.data![index];
                return ListTile(
                  title: Text('${lecture.lectureID} - ${lecture.date}'), // Ders kimliği ve tarihini birleştirerek göster
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AttendanceDetailPage(lectureID: lecture.lectureID),
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
