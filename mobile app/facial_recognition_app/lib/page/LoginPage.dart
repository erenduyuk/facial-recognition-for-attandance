import 'package:facial_recognition_app/model/Lecturer.dart';
import 'package:facial_recognition_app/model/Student.dart';
import 'package:flutter/material.dart';
import 'package:facial_recognition_app/model/User.dart';
import 'package:facial_recognition_app/page/homePageForLecturer.dart';
import 'package:facial_recognition_app/page/HomePageForStudent.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<String> _login() async {
    String userID = _usernameController.text;
    String password = _passwordController.text;

    User user = User(userId: userID, username: userID, userPassword: password);

    try {
      String response = await user.login();
      if (response != 'failed') {
        return response; // Kullanıcı türünü döndür
      } else {
        // Kullanıcı adı veya şifre yanlışsa
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Hata'),
            content: Text('Kullanıcı adı veya şifre yanlış.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Tamam'),
              ),
            ],
          ),
        );
        return 'failed';
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Hata'),
          content: Text('Bir hata oluştu: $e'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Tamam'),
            ),
          ],
        ),
      );
    }
    return 'failed';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giriş Yap'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                height: 50), // Giriş Yap yazısını aşağıya almak için boşluk
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Center(
                child: Image.asset(
                  'assets/D_Renkli_AçıkZemin.png', // Burada kendi resminizin yolunu belirtin
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Kullanıcı Adı',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Şifre',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String response = await _login();
                if (response != 'failed') {
                  print(response);
                  if (response == 'Lecturer') {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => homePageForLecturer(
                              lecturer: Lecturer(
                                  id: _usernameController.text,
                                  name: _usernameController.text,
                                  password: _passwordController.text,
                                  previousLectures: []))),
                      (Route<dynamic> route) => false,
                    );
                  } else if (response == 'Student') {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePageForStudent(
                              student: Student(
                                  userId: _usernameController.text,
                                  username: _usernameController.text,
                                  userPassword: _passwordController.text))),
                      (Route<dynamic> route) => false,
                    );
                  }
                }
              },
              child: Text('Giriş Yap'),
            ),
          ],
        ),
      ),
    );
  }
}
