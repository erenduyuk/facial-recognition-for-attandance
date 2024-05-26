import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:facial_recognition_app/model/Attendance.dart';

class Lecture {
  final String lectureID;
  final String date;
  final String lecturerID;
  final String lectureName;

  Lecture({
    required this.lectureID,
    required this.date,
    required this.lecturerID,
    required this.lectureName,
  });

  factory Lecture.fromJson(List<dynamic> json) {
    return Lecture(
      lectureID: json[0], // Dizi içindeki ilk değer lectureID'yi temsil eder
      date: json[1],
      lecturerID: json[2], // Dizi içindeki üçüncü değer lectureID'yi temsil eder
      lectureName: json[3], // Dizi içindeki ikinci değer tarihi temsil eder
    );
  }
}
