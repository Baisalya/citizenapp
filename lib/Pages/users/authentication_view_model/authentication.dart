import 'dart:convert';

import 'package:citizenapp/const/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/User_model.dart';

class AuthViewModel extends ChangeNotifier {
  //Login User
  bool _isPasswordVisible = false;

  bool get isPasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    final userModel = UserModel(email: email, password: password, username: '', phoneNo: '', profilePic: '');

    final response = await http.post(
      Uri.parse('$apiBaseUrl/api/auth/login'), // backend URL
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(userModel.toJson()),
    );

    if (response.statusCode == 200) {
      // Successful login
      final Map<String, dynamic> responseData = json.decode(response.body);
      final String token = responseData['token'];

      // Save token or handle login success here

      // Show a toast message
      Fluttertoast.showToast(
        msg: 'Login success!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey[600],
        textColor: Colors.white,
        fontSize: 16.0,
      );

      // Navigate to the home screen
      Get.toNamed('/home');
    } else {
      // Failed login
      final Map<String, dynamic> errorData = json.decode(response.body);
      final String errorMessage = errorData['message'];

      // Show an error message using a dialog or a toast
      Fluttertoast.showToast(
        msg: errorMessage,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );

      // Handle other error scenarios if needed
    }
  }


}
