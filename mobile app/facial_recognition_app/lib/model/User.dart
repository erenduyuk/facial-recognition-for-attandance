import 'dart:convert';
import 'package:http/http.dart' as http;


class User {
  final String userId;
  final String username;
  final String userPassword;

  User({required this.userId, required this.username, required this.userPassword});

  Future<bool> login() async {
    // API üzerinden giriş işlemini gerçekleştirme
    final response = await http.get(Uri.parse('http://your-api-url/checkLogin?userID=$userId&password=$userPassword'));

    if (response.statusCode == 200) {
      // API'den başarılı bir yanıt alındıysa
      final responseData = json.decode(response.body);
      if (responseData['status'] == 'success') {
        return true; // Giriş başarılı
      } else {
        return false; // Giriş başarısız
      }
    } else {
      // API çağrısında bir hata oluştuysa
      throw Exception('API call failed');
    }
  }

  void logout() {
    // Çıkış işlemleri burada yapılacak
  }
}
