import 'package:flutter/material.dart';
import 'package:facial_recognition_app/model/Student.dart';
import 'package:facial_recognition_app/model/Lecturelist.dart';
import 'package:facial_recognition_app/DatabaseManager.dart';
import 'package:facial_recognition_app/page/StudentAttendanceDetail.dart'; // Update with your correct import path
import 'package:facial_recognition_app/page/LoginPage.dart';

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
      body: Column(
        children: [
          SizedBox(height: 16), // Boşluk eklemek için
          Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'Lecture List',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
              height:
                  8), // Lecture List ile FutureBuilder arasında boşluk eklemek için
          Expanded(
            child: FutureBuilder<List<Lecturelist>>(
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
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.47,
              height: MediaQuery.of(context).size.height * 0.05,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                    (Route<dynamic> route) => false,
                  );
                },
                child: Text(
                  'Çıkış Yap',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
