import 'package:flutter/material.dart';
import 'package:facial_recognition_app/model/Student.dart';
import 'package:facial_recognition_app/model/Attendance.dart';
import 'package:facial_recognition_app/DatabaseManager.dart';

class HomePageForStudent extends StatefulWidget {
  final Student student;

  HomePageForStudent({required this.student});

  @override
  _HomePageForStudentState createState() => _HomePageForStudentState();
}

class _HomePageForStudentState extends State<HomePageForStudent> {
  late Future<List<Attendance>> _attendances;

  @override
  void initState() {
    super.initState();
    _attendances = Database().fetchAllAttendanceForStudent(widget.student.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Home Page'),
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
                  title: Text('Lecture: ${attendance.lectureID}'),
                  subtitle: Text('Time: ${attendance.time}'),
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
