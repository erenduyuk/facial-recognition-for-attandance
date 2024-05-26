import 'dart:async';
import 'package:flutter/material.dart';
import 'package:facial_recognition_app/model/Attendance.dart';
import 'package:facial_recognition_app/DatabaseManager.dart';

class StartAttendancePage extends StatefulWidget {
  StartAttendancePage({Key? key}) : super(key: key);

  @override
  _StartAttendancePageState createState() => _StartAttendancePageState();
}

class _StartAttendancePageState extends State<StartAttendancePage> {
  late Timer _timer;
  int _secondsRemaining = 30 * 60; // 30 dakika, saniye cinsinden
  late Future<List<Attendance>> _attendanceDetails;
  

  @override
  void initState() {
    super.initState();
    _attendanceDetails = Database().fetchAttendanceForLecture("lec1");
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
        title: Text('Timer Page'),
      ),
      body: Column(
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
                  onPressed: () {
                    setState(() {
                      Database database = Database();
                      _attendanceDetails = database.fetchAttendanceForLecture("lec4"); // Uygun lectureID'yi kullanın
                    });
                  },
                  icon: Icon(Icons.refresh),
                ),
              ],
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
