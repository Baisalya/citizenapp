import 'package:citizenapp/Utils/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../../../Utils/app_styles.dart';
import 'SignUpScreen.dart';
import 'authentication_view_model/authentication.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF73AEF5),
                  Color(0xFF61A4F1),
                  Color(0xFF4780E0),
                  Color(0xFF398AE5),
                ],
                stops: [0.1, 0.4, 0.7, 0.9],
              ),
            ),
          ),
          SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: 40.0,
              vertical: 120.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Sign In",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      "Email",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 4.0,
                          ),
                        ],
                      ),
                      height: 60.0,
                      child: TextField(
                        controller: emailController,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16.0,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.black87,
                          ),
                          hintText: 'Enter your Email',
                          hintStyle: TextStyle(
                            color: Colors.black38,
                            fontFamily: 'OpenSans',
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    const Text(
                      "Password",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 4.0,
                          ),
                        ],
                      ),
                      height: 60.0,
                      child: TextField(
                        obscureText: !_isPasswordVisible,
                        controller: passwordController,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 16.0,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.black87,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                            child: Icon(
                              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                              color: Colors.black87,
                            ),
                          ),
                          hintText: 'Enter your password',
                          hintStyle: TextStyle(
                            color: Colors.black38,
                            fontFamily: 'OpenSans',
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Container(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 25.0),
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          final email = emailController.text;
                          final password = passwordController.text;

                          // Check if email and password are not empty
                          if (email.isEmpty || password.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Email and password cannot be empty'),
                              ),
                            );
                            return; // Return early if there's a validation error
                          }

                          final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
                          authViewModel.loginUser(email, password).then((success) {
                            if (success) {
                              Fluttertoast.showToast(
                                msg: 'Login success!',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.grey[600],
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                              // Login successful, navigate to the next screen
                            } else {
                              // Show error message
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Login Failed! Please Try Again Later'),
                                ),
                              );
                            }
                          }).catchError((error) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(error.toString()),
                              ),
                            );
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          elevation: 5.0,
                          padding: const EdgeInsets.all(15.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: const Text(
                          'SIGN IN',
                          style: TextStyle(
                            color: Color(0xFF527DAA),
                            letterSpacing: 1.5,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                          ),
                        ),
                      ),

                    ),
                    const SizedBox(height: 1.0),
                    const Center(
                      child: Text(
                        '- OR -',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const Center(
                      child: Text(
                        'Sign up with',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            // Handle Facebook sign in
                          },
                          child: Container(
                            height: 60.0,
                            width: 60.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 2),
                                  blurRadius: 6.0,
                                ),
                              ],
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/facebook.png',
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 60.0),
                        GestureDetector(
                          onTap: () {
                            // Handle Google sign in
                          },
                          child: Container(
                            height: 60.0,
                            width: 60.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 2),
                                  blurRadius: 6.0,
                                ),
                              ],
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/google.png',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40.0),
                    GestureDetector(
                      onTap: () {
                        // Handle sign up
                        Get.offNamed('/home');
                        /* Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => SignUpScreen()));*/
                      },
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Don't have an account? ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: "Sign up",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

