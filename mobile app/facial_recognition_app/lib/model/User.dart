import 'dart:convert';
import 'package:http/http.dart' as http;
import '../base_ip.dart';

class User {
  final String userId;
  final String username;
  final String userPassword;

  User(
      {required this.userId,
      required this.username,
      required this.userPassword});

  Future<String> login() async {
    BaseIp baseIp = new BaseIp();
    String baseIP = baseIp.base_ip;
    // API üzerinden giriş işlemini gerçekleştirme
    final response = await http.get(Uri.parse(
        '$baseIP/checkLogin?userID=$userId&userPassword=$userPassword'));

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
