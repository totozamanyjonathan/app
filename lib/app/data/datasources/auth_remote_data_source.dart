import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class AuthRemoteDataSource {
  Future<UserModel> login(String username, String password) async {
    try {
      final response = await http.get(
        Uri.parse(
          'http://localhost:3000/users?name=$username&password=$password',
        ),
      );
      if (response.statusCode == 200) {
        List<dynamic> jsonData = jsonDecode(response.body);
        if (jsonData.isEmpty) {
          throw Exception('User not found');
        }
        return jsonData.map((item) => UserModel.fromJson(item)).first;
      }
      throw Exception('Failed to login');
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }
}
