import 'package:facial_recognition_app/model/Lecturer.dart';
import 'package:flutter/material.dart';
import 'package:facial_recognition_app/model/user.dart';
import 'package:facial_recognition_app/page/homePageForLecturer.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<bool> _login() async {
    String userID = _usernameController.text;
    String password = _passwordController.text;

    User user = User(userId: userID, username: userID, userPassword: password);
    
    try {
      bool response = await user.login();
      if(response) {
        // Kullanıcı başarılı bir şekilde giriş yaptıysa
       return true;
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
      return false;
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
  return false;
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                bool response = await _login();
                if(response) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => homePageForLecturer(lecturer: Lecturer(userId: _usernameController.text, username: _usernameController.text, userPassword: _passwordController.text))),
                  );
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
