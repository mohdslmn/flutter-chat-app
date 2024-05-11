import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<void> createUserAccount(String email, String password) async {
    final apiUrl = 'http://localhost:1337/api/user1s'; // Update with your API endpoint
    final userData = {
      'data': {
        'email': email,
        'password': password,
      }
    }; // Payload for account creation

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(userData),
      );

      if (response.statusCode == 200) {
        print('Account created successfully');
      } else {
        print('Failed to create account. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error creating account: $e');
    }
  }
}
