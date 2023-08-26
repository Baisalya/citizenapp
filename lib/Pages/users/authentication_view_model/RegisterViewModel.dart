import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../const/api_constants.dart';
import '../model/User_model.dart';

class RegisterViewModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
  Future<void> register(String email, String password, String username, String phoneNo) async {
    final userModel = UserModel(
      email: email,
      password: password,
      username: username,
      phoneNo: phoneNo,
      profilePic: '', // You can provide a default profile picture if needed
    );

    try {
      final response = await http.post(
        Uri.parse('$apiBaseUrl/api/auth/register'), // backend URL
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(userModel.toJson()),
      );

      if (response.statusCode == 201) {
        Fluttertoast.showToast(
          msg: 'Registration successful!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        Get.offNamed('/login');
        // TODO: Navigate to the login screen or handle registration success
      } else {
        final Map<String, dynamic> errorData = json.decode(response.body);
        final String errorMessage = errorData['message'];

        Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );

        // TODO: Handle other error scenarios if needed
      }
    } catch (e) {
      print('Error during registration: $e');
      // TODO: Handle connection errors or other exceptions
    }
  }

}
