import 'package:facial_recognition_app/model/user.dart';
import 'package:facial_recognition_app/DatabaseManager.dart';
import 'package:facial_recognition_app/model/Attendance.dart';

class Student extends User {
  List<Attendance> attendanceList = [];

  Student({
    required String userId,
    required String username,
    required String userPassword,
  }) : super(userId: userId, username: username, userPassword: userPassword);

  void listAttendance() {
    // Öğrencinin yoklamalarını listeleme işlemleri burada yapılacak
  }
}
