import 'package:uuid/uuid.dart'; 
import 'package:facial_recognition_app/model/Student.dart';

class Attendance {
  final String id; 
  final DateTime createdAt;
  final List<Student> students;

  Attendance({required this.id, required this.createdAt, required this.students});

  factory Attendance.create(List<Student> students) {
    // Yeni bir yoklama oluştururken id ve oluşturulma tarihi otomatik olarak atanır
    return Attendance(
      id: Uuid().v4(), // UUID oluştur
      createdAt: DateTime.now(), // Anlık zaman
      students: students,
    );
  }
}
