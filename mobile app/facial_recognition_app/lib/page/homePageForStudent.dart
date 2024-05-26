import 'package:flutter/material.dart';
import 'package:facial_recognition_app/model/Student.dart';
import 'package:facial_recognition_app/model/Lecturelist.dart';
import 'package:facial_recognition_app/DatabaseManager.dart';
import 'package:facial_recognition_app/page/StudentAttendanceDetail.dart'; // Update with your correct import path

class HomePageForStudent extends StatefulWidget {
  final Student student;

  HomePageForStudent({required this.student});

  @override
  _HomePageForStudentState createState() => _HomePageForStudentState();
}

class _HomePageForStudentState extends State<HomePageForStudent> {
  late Future<List<Lecturelist>> _lectures;

  @override
  void initState() {
    super.initState();
    _lectures = Database().fetchLecturesByStudent(widget.student.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Home Page'),
      ),
      body: FutureBuilder<List<Lecturelist>>(
        future: _lectures,
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
                Lecturelist lecture = snapshot.data![index];
                return ListTile(
                  title: Text('Lecture: ${lecture.lectureName}'),
                  subtitle: Text('StudentID: ${lecture.studentID}'),
                  trailing: Icon(Icons.class_, color: Colors.blue),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            StudentAttendanceDetail(lecture: lecture),
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
