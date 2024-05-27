import 'dart:convert';
import 'package:http/http.dart' as http;


class User {
  final String userId;
  final String username;
  final String userPassword;

  User({required this.userId, required this.username, required this.userPassword});

  Future<String> login() async {
    String baseIP = "https://1c23-95-70-206-22.ngrok-free.app";
    // API üzerinden giriş işlemini gerçekleştirme
    final response = await http.get(Uri.parse('$baseIP/checkLogin?userID=$userId&userPassword=$userPassword'));

    if (response.statusCode == 200) {
      // API'den başarılı bir yanıt alındıysa
      final responseData = json.decode(response.body);
      if (responseData['status'] == 'success') {
        return responseData['message']; // Kullanıcı türünü döndür
      } else {
        return 'failed'; // Giriş başarısız
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

