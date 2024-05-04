import 'dart:async';
import 'package:facial_recognition_app/model/Attendance.dart';
import 'package:flutter/material.dart';
import 'package:facial_recognition_app/model/Student.dart';
import 'package:facial_recognition_app/DatabaseManager.dart';

class StartAttendancePage extends StatefulWidget {

  StartAttendancePage({Key? key}) : super(key: key);

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<StartAttendancePage> {
  late Timer _timer;
  int _secondsRemaining = 30 * 60; // 30 dakika, saniye cinsinden
  List<Attendance> attendances = [];
  Database database = Database();

  @override
  void initState() {
    super.initState();
    _startTimer();
    _loadStudentsFromDatabase();
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
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  void _loadStudentsFromDatabase() {
    // Veritabanından öğrenci bilgilerini yükleyin ve Student nesnelerini oluşturun
    // Veritabanı işlemleri için uygun bir şekilde değiştirin
  }

void _updateStudentData() {
  // Veritabanından öğrenci bilgilerini güncelleyin ve setState'i çağırarak yeniden oluşturun
  // Veritabanı işlemleri için uygun bir şekilde değiştirin
  
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
                    _updateStudentData(); // Verileri güncelleme fonksiyonunu çağır
                  },
                  icon: Icon(Icons.refresh),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: attendances.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(attendances[index].student.userId.toString()),
                  title: Text('${attendances[index].student.username} ${attendances[index].student.username}'),
                  trailing: Checkbox(
                    value: attendances[index].isAttend,
                    onChanged: null, // Checkbox'ın etkinliği devre dışı bırakıldı
                  ),
                );
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


