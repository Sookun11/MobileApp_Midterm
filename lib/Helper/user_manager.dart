import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class UserManager {
  static const String _usersKey = "users";

  static Future<List<Map<String, String>>> getUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final usersString = prefs.getString(_usersKey);
    if (usersString == null) return [];
    final List decoded = jsonDecode(usersString);
    return decoded.map((e) => Map<String, String>.from(e)).toList();
  }

  static Future<void> addUser(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final users = await getUsers();
    users.add({'email': email, 'password': password});
    prefs.setString(_usersKey, jsonEncode(users));
  }

  static Future<bool> validateUser(String email, String password) async {
    final users = await getUsers();
    return users.any((user) => user['email'] == email && user['password'] == password);
  }
}
