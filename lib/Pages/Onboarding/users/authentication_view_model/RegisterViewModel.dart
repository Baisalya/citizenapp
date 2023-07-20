import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/User_model.dart';

class RegisterViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> registerUser(String username, String email, String password) async {
    try {
      _isLoading = true;
      notifyListeners();

      final apiUrl = 'http://localhost:8800/api/auth/register';
      final userModel = User(username: username, email: email, password: password, phoneNo: '', profilePic: '');

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(userModel.toJson()),
      );

      if (response.statusCode == 201) {
        // User registered successfully
        // You can perform any required actions after successful registration
      } else if (response.statusCode == 409) {
        // Username or email already exists
        // You can handle the error accordingly
      } else {
        // Handle other status codes or errors if needed
      }

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      throw e;
    }
  }
}
