import 'package:facial_recognition_app/model/Attendance.dart';

class Lecture {
  String lectureID;
  List<Attendance> attendances;
  String date;

  Lecture({required this.lectureID, required this.attendances, required this.date});
  
}