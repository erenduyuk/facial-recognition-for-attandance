import 'dart:convert';
import 'package:facial_recognition_app/model/Lecture.dart';
import 'package:http/http.dart' as http;
import 'package:facial_recognition_app/model/Attendance.dart';

class Database {
  static final Database _instance = Database._internal();
  factory Database() => _instance;
  Database._internal();

  String baseIP = "https://d855-95-70-206-22.ngrok-free.app";

  Future<List<Attendance>> fetchAllAttendanceForStudent(String studentId) async {
    
    // API üzerinden öğrencinin tüm yoklamalarını çekme
    final response = await http.get(Uri.parse('$baseIP/getAttendances/$studentId'));

    if (response.statusCode == 200) {
      final List<dynamic> attendanceJson = json.decode(response.body)['attendances'];
      return attendanceJson.map((json) => Attendance.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load attendances');
    }
  }
Future<List<Lecture>> fetchPreviousLecturesForLecturer(String lecturerId) async {
  final response = await http.get(Uri.parse('$baseIP/getPreviousLectures/$lecturerId'));

  if (response.statusCode == 200) {
    final List<dynamic> lectureJson = json.decode(response.body)['lectures'];
    return lectureJson.map((json) => Lecture.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load lectures');
  }
}


  Future<List<Attendance>> fetchAttendanceForLecture(String lectureID) async {
  final response = await http.get(Uri.parse('$baseIP/getCurrentAttendance/$lectureID'));

  if (response.statusCode == 200) {
    final List<dynamic> responseData = json.decode(response.body)['attendance']; // JSON anahtarını düzeltme
    List<Attendance> attendances = responseData.map((data) => Attendance.fromJson(data)).toList();
    return attendances;
  } else {
    throw Exception('Failed to load attendance data');
  }
}

}
