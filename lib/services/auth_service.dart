import 'package:flutter/material.dart';

class AuthService {
  static final Map<String, String> _users = {}; // Mock database (email -> password)
  static String? _loggedInUser; // Store the logged-in user's email

  static String? get currentUser => _loggedInUser;

  static bool isLoggedIn() => _loggedInUser != null;

  static Future<String?> register(String email, String password) async {
    if (_users.containsKey(email)) {
      return "Email already exists.";
    }
    _users[email] = password;
    _loggedInUser = email;
    return null; // Registration successful
  }

  static Future<String?> login(String email, String password) async {
    if (_users[email] != password) {
      return "Invalid email or password.";
    }
    _loggedInUser = email;
    return null; // Login successful
  }

  static void logout() {
    _loggedInUser = null;
  }
}