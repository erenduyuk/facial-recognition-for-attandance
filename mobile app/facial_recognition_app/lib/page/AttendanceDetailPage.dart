import 'package:flutter/material.dart';
import 'package:facial_recognition_app/model/Student.dart';

class AttendanceDetailPage extends StatelessWidget {
  final String attendanceName; // Önceki yoklamanın adı

  const AttendanceDetailPage({Key? key, required this.attendanceName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Burada önceki yoklamadan verileri alabilirsiniz, şimdilik örnek bir liste kullanıyorum

    return Scaffold(
      appBar: AppBar(
        title: Text('Yoklama Detayı: $attendanceName'),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text(students[index].number.toString()),
            title: Text('${students[index].name} ${students[index].surname}'),
            trailing: Checkbox(
              value: students[index].checked,
              onChanged: null, // Checkbox'ın etkinliği devre dışı bırakıldı
            ),
          );
        },
      ),
    );
  }
}