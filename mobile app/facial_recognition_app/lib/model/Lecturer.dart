import 'package:facial_recognition_app/model/user.dart';

class Lecturer extends User {
  

  Lecturer({
    required String userId,
    required String username,
    required String userPassword,
  }) : super(userId: userId, username: username, userPassword: userPassword);

  void previousLecture() {
    // Önceki ders bilgilerini getirme işlemleri burada yapılacak
  }

  void startAttendance() {
    // Yoklama başlatma işlemleri burada yapılacak
  }

  void listCurrentAttendance() {
    // Mevcut yoklamaları listeleme işlemleri burada yapılacak
  }

  void listPreviousAttendance() {
    // Önceki yoklamaları listeleme işlemleri burada yapılacak
  }

  void stopAttendance() {
    // Yoklamayı sonlandırma işlemleri burada yapılacak
  }
}