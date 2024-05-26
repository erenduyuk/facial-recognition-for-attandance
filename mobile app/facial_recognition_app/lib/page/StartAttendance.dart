import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:facial_recognition_app/model/Attendance.dart';
import 'package:facial_recognition_app/DatabaseManager.dart';
import 'package:http/http.dart' as http;

class StartAttendancePage extends StatefulWidget {
  final String lecturerId;

  StartAttendancePage({Key? key, required this.lecturerId}) : super(key: key);

  @override
  _StartAttendancePageState createState() => _StartAttendancePageState();
}

class _StartAttendancePageState extends State<StartAttendancePage> {
  String baseIP = "https://d855-95-70-206-22.ngrok-free.app";
  late Timer _timer;
  int _secondsRemaining = 30 * 60; // 30 dakika, saniye cinsinden
  late Future<List<Attendance>> _attendanceDetails;
  List<String> _lectures = [];
  String? _selectedLecture;

  @override
  void initState() {
    super.initState();
    _fetchLectures();
    _attendanceDetails = Future.value([]); // Başlangıçta boş bir liste
  }

  Future<void> _fetchLectures() async {
    try {
      final response = await http.get(
        Uri.parse('$baseIP/getLecturesByLecturer/${widget.lecturerId}'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 'success') {
          final List<String> lectures = List<String>.from(data['lectures'].map((lecture) => lecture['lecturename']));
          if (lectures.isNotEmpty) {
            setState(() {
              _lectures = lectures;
              _selectedLecture = _lectures[0];
              _fetchAttendanceForSelectedLecture();
            });
          } else {
            // Dersler boşsa hata mesajını göster
            print('Dersler boş');
          }
        } else {
          print('Dersler bulunamadı');
        }
      } else {
        throw Exception('Failed to load lectures');
      }
    } catch (e) {
      print('Error fetching lectures: $e');
    }
  }

      

  Future<void> _fetchAttendanceForSelectedLecture() async {
    if (_selectedLecture != null) {
      try {
        final attendance = await Database().fetchAttendanceForLecture(_selectedLecture!);
        setState(() {
          _attendanceDetails = Future.value(attendance);
        });
      } catch (e) {
        print('Error fetching attendance: $e');
      }
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer.cancel();
          // Süre bittiğinde yapılacak işlemler buraya eklenebilir
        }
      });
    });
  }

  String _formatDuration(int seconds) {
    Duration duration = Duration(seconds: seconds);
    String twoDigits(int n) => n >= 10 ? "$n" : "0$n";
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance Page'),
      ),
      body: _lectures.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Kalan Süre: ${_formatDuration(_secondsRemaining)}',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      IconButton(
                        onPressed: _fetchAttendanceForSelectedLecture,
                        icon: Icon(Icons.refresh),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: DropdownButton<String>(
                    value: _selectedLecture,
                    hint: Text('Ders Seçin'),
                    items: _lectures.map((String lecture) {
                      return DropdownMenuItem<String>(
                        value: lecture,
                        child: Text(lecture),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedLecture = newValue;
                        _fetchAttendanceForSelectedLecture();
                      });
                    },
                  ),
                ),
                Expanded(
                  child: FutureBuilder<List<Attendance>>(
                    future: _attendanceDetails,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(child: Text('Attendance not found'));
                      } else {
                        List<Attendance> attendances = snapshot.data!;
                        return ListView.builder(
                          itemCount: attendances.length,
                          itemBuilder: (context, index) {
                            Attendance attendance = attendances[index];
                            return ListTile(
                              leading: Text(attendance.studentID),
                              title: Text('${attendance.studentID} ${attendance.studentID}'),
                              trailing: Checkbox(
                                value: attendance.isAttend,
                                onChanged: null, // Checkbox'ın etkinliği devre dışı bırakıldı
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
