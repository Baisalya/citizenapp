import 'dart:convert';

import 'package:citizenapp/const/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/User_model.dart';

class AuthViewModel extends ChangeNotifier {
  //Login User
  Future<bool> loginUser(String email, String password) async {
    final Uri apiUrl = Uri.parse('$apiBaseUrl/api/auth/login');

    try {
      final response = await http.post(
        apiUrl,
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        // User logged in successfully
        return true;
      } else if (response.statusCode == 404) {
        // Email is not registered
        final responseBody = json.decode(response.body);
        final errorMessage = responseBody['message'];
        throw Exception(errorMessage); // Throw an exception to be caught and handled
      } else if (response.statusCode == 401) {
        // Authentication failed
        final responseBody = json.decode(response.body);
        final errorMessage = responseBody['message'];
        throw Exception(errorMessage); // Throw an exception to be caught and handled
      } else {
        // Handle other login errors
        return false;
      }
    } catch (e) {
      // Handle any exceptions thrown during the API call
      throw Exception('An error occurred while logging in');
    }
  }
  //Register user
  Future<bool> registerUser(User user) async {
    final response = await http.post(
      Uri.parse('http://localhost:8800/api/auth/register'),
      body: {
        'username': user.username,
        'email': user.email,
       /* 'phoneNo': user.phoneNo,
        'profilepic': user.profilePic,*/
        'password': user.password,
      },
    );

    if (response.statusCode == 200) {
      // User registered successfully
      return true;
    }else if (response.statusCode == 409) {
      // Username or email already exists
      final responseBody = json.decode(response.body);
      final errorMessage = responseBody['message'];
      throw Exception(errorMessage); // Throw an exception to be caught and handled
    } else {
      // Handle registration error
      return false;
    }
  }
}
