import 'package:uuid/uuid.dart'; 
import 'package:facial_recognition_app/model/Student.dart';

class Attendance {
  final String studentID;
  final String lectureID;
  final String time;
  final bool isAttend;
  final String lectureName;

  Attendance({
    required this.studentID,
    required this.lectureID,
    required this.time,
    required this.isAttend,
    required this.lectureName,
  });

  factory Attendance.fromJson(List<dynamic> json) {
    return Attendance(
      studentID: json[0],
      lectureID: json[2],
      time: json[3],
      isAttend: json[4],
      lectureName: json[5],
    );
  }
}
