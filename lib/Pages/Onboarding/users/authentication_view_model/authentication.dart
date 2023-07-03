import 'package:citizenapp/const/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/User_model.dart';

class AuthViewModel extends ChangeNotifier {
  //Login User
  Future<bool> loginUser(String email, String password) async {
    final response = await http.post(
      Uri.parse('$apiBaseUrl/api/auth/login'),
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      // User logged in successfully
      return true;
    } else {
      // Handle login error
      return false;
    }
  }

  //Register user
  Future<bool> registerUser(User user) async {
    final response = await http.post(
      Uri.parse('http://localhost:8800/api/auth/register'),
      body: {
        'username': user.username,
        'email': user.email,
        'phoneNo': user.phoneNo,
        'profilepic': user.profilePic,
        'password': user.password,
      },
    );

    if (response.statusCode == 200) {
      // User registered successfully
      return true;
    } else {
      // Handle registration error
      return false;
    }
  }
}
