import 'package:flutter/material.dart';

class Lecturelist {
  final int id;
  final String studentID;
  final String lectureName;

  Lecturelist({
    required this.id,
    required this.studentID,
    required this.lectureName,
  });

  factory Lecturelist.fromJson(List<dynamic> json) {
    return Lecturelist(
      id: json[0],
      studentID: json[1],
      lectureName: json[2],
    );
  }
}
