import 'package:uuid/uuid.dart'; 
import 'package:facial_recognition_app/model/Student.dart';

class Attendance {
  final String studentID;
  final String lectureID;
  final String time;
  final bool isAttend;

  Attendance({
    required this.studentID,
    required this.lectureID,
    required this.time,
    required this.isAttend,
  });

 factory Attendance.fromJson(List<dynamic> json) {
  return Attendance(
    studentID: json[1],
    lectureID: json[2], // ders kimliği
    time: json[3], // zaman
    isAttend: json[4], // katılım durumu
  );
}

}
