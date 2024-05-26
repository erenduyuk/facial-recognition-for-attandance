import 'package:facial_recognition_app/model/Lecture.dart';

class Lecturer {
  final String id;
  final String name;
  final List<Lecture> previousLectures;
  final String password; // Eğer gerekli ise

  Lecturer({
    required this.id,
    required this.name,
    required this.previousLectures,
    required this.password, // Eğer gerekli ise
  });

  factory Lecturer.fromJson(Map<String, dynamic> json) {
    return Lecturer(
      id: json['id'],
      name: json['name'],
      previousLectures: (json['previousLectures'] as List<dynamic>)
          .map((lecture) => Lecture.fromJson(lecture))
          .toList(),
      password: json['password'], // Eğer gerekli ise
    );
  }

  String get lecturerID => this.id;
}
