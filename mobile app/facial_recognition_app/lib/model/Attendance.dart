import 'package:uuid/uuid.dart'; 
import 'package:facial_recognition_app/model/Student.dart';

class Attendance {
  final String lectureID; 
  final DateTime time;
  final Student student;
  final bool isAttend;

  Attendance({
    required this.lectureID,
    required this.time,
    required this.student,
    required this.isAttend,
  });
}
