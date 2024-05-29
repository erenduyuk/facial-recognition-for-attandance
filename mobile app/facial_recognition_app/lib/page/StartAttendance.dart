import 'dart:async';
import 'dart:convert';
import 'package:facial_recognition_app/model/Lecture.dart';
import 'package:flutter/material.dart';
import 'package:facial_recognition_app/model/Attendance.dart';
import 'package:facial_recognition_app/DatabaseManager.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';
import '../base_ip.dart';
import 'package:intl/intl.dart';

class StartAttendancePage extends StatefulWidget {
  final String lecturerId;

  StartAttendancePage({Key? key, required this.lecturerId}) : super(key: key);

  @override
  _StartAttendancePageState createState() => _StartAttendancePageState();
}

BaseIp baseIp = new BaseIp();
String baseIP = baseIp.base_ip;

class _StartAttendancePageState extends State<StartAttendancePage> {
  late Timer _timer;
  int _secondsRemaining = 30 * 60; // 30 minutes in seconds
  late Future<List<Attendance>> _attendanceDetails;
  List<String> _lectures = [];
  String? _selectedLecture;
  bool _isLoadingLectures = true; // New loading state
  String uuid = Uuid().v4();
  bool _isTimerRunning = false; // To track the timer state

  @override
  void initState() {
    super.initState();
    _fetchLectures();
    _attendanceDetails = Future.value([]); // Initially an empty list
  }

  Future<void> _fetchLectures() async {
    try {
      final response = await http.get(
        Uri.parse('$baseIP/getLecturesByLecturer/${widget.lecturerId}'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('Fetched data: $data'); // Debugging line
        if (data['status'] == 'success') {
          final List<String> lectures = List<String>.from(
            data['lectures'].map(
                (lecture) => lecture[2]), // Adjusted to handle list of lists
          );
          setState(() {
            _lectures = lectures;
            _selectedLecture = lectures.isNotEmpty ? lectures[0] : null;
            _isLoadingLectures = false; // Stop loading
            if (_selectedLecture != null) {
              _fetchAttendanceForSelectedLecture();
            }
          });
        } else {
          setState(() {
            _isLoadingLectures = false; // Stop loading
          });
          print('Lectures not found');
        }
      } else {
        throw Exception('Failed to load lectures');
      }
    } catch (e) {
      setState(() {
        _isLoadingLectures = false; // Stop loading in case of error
      });
      print('Error fetching lectures: $e');
    }
  }

  Future<void> _fetchAttendanceForSelectedLecture() async {
    if (_selectedLecture != null) {
      try {
        final attendance =
            await Database().fetchAttendanceForLecture(uuid.toString());

        print(attendance); // Debugging line
        setState(() {
          _attendanceDetails = Future.value(attendance);
          print('Fetched attendance: $attendance'); // Debugging line
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
          // Actions to be taken when the timer ends can be added here
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
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Remaining Time: ${_formatDuration(_secondsRemaining)}',
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
                  hint: Text('Select Lecture'),
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
                            leading: Text(attendance.time.substring(0, 8)),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(attendance.studentID),
                                Text(attendance.lectureName),
                              ],
                            ),
                            trailing: Checkbox(
                              value: attendance.isAttend,
                              onChanged: null,
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
              SizedBox(
                  height:
                      16), // Boşluk ekleyerek butonları biraz yukarı çekiyoruz
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _isTimerRunning
                        ? null
                        : () {
                            _startTimer();
                            setState(() {
                              _isTimerRunning = true;
                            });

                            Lecture lecture = Lecture(
                                lectureID: uuid,
                                date: DateFormat('yyyy-MM-dd HH:mm:ss')
                                    .format(DateTime.now()),
                                lecturerID: widget.lecturerId,
                                lectureName: _selectedLecture!);
                            Database().addNewLectureToAPI(
                                lecture.lectureID,
                                lecture.date,
                                lecture.lecturerID,
                                lecture.lectureName);
                          },
                    child: Text('Start'),
                  ),
                  ElevatedButton(
                    onPressed: !_isTimerRunning
                        ? null
                        : () {
                            uuid = Uuid().v4();
                            _timer.cancel();
                            _secondsRemaining = 30 * 60;
                            Database().stopFaceRecognition();
                            setState(() {
                              _isTimerRunning = false;
                            });
                          },
                    child: Text('Stop'),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
