import 'package:flutter/material.dart';
import 'package:facial_recognition_app/student.dart';

class AttendanceDetailPage extends StatelessWidget {
  final String attendanceName; // Önceki yoklamanın adı

  const AttendanceDetailPage({Key? key, required this.attendanceName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Burada önceki yoklamadan verileri alabilirsiniz, şimdilik örnek bir liste kullanıyorum
    List<Student> students = [
      Student(number: 1, name: 'Ahmet', surname: 'Yılmaz', checked: true),
      Student(number: 2, name: 'Ayşe', surname: 'Kara', checked: false),
      Student(number: 3, name: 'Mehmet', surname: 'Demir', checked: true),
      // Diğer öğrenciler
    ];

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