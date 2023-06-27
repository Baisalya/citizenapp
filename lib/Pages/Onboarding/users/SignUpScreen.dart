import 'package:citizenapp/Pages/Onboarding/users/LoginScreen.dart';
import 'package:citizenapp/Utils/app_colors.dart';
import 'package:citizenapp/Utils/app_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
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
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 120.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Center(
                    child: Text(
                      "Sign Up",
                      style: AppStyles.LoginPrimaryText,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        "Name",
                        style: AppStyles.LoginSecondaryText,
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            const BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 2),
                              blurRadius: 4.0,
                            ),
                          ],
                        ),
                        height: 60.0,
                        child: const TextField(
                          style: AppStyles.secondaryText,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.black87,
                            ),
                            hintText: 'Enter your Name',
                            hintStyle: TextStyle(
                              color: Colors.black38,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      const Text(
                        "Email",
                        style: AppStyles.LoginSecondaryText,
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            const BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 2),
                              blurRadius: 4.0,
                            ),
                          ],
                        ),
                        height: 60.0,
                        child: const TextField(
                          style: AppStyles.secondaryText,
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
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      const Text(
                        "Password",
                        style: AppStyles.LoginSecondaryText,
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            const BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 2),
                              blurRadius: 4.0,
                            ),
                          ],
                        ),
                        height: 60.0,
                        child: TextField(
                          obscureText: !_isPasswordVisible, // Toggle visibility based on the state
                          style: AppStyles.secondaryText,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.black87,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible; // Toggle the visibility state
                                });
                              },
                              child: Icon(
                                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                color: Colors.black87,
                              ),
                            ),
                            hintText: 'Enter your password',
                            hintStyle: const TextStyle(
                              color: Colors.black38,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 25.0),
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            elevation: 5.0,
                            padding: const EdgeInsets.all(15.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          child: const Text(
                            'SIGN UP',
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
                       Center(
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
                              // Handle Facebook sign up
                            },
                            child: Container(
                              height: 60.0,
                              width: 60.0,
                              decoration: const BoxDecoration(
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
                              // Handle Google sign up
                            },
                            child: Container(
                              height: 60.0,
                              width: 60.0,
                              decoration: const BoxDecoration(
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
                          Get.offNamed('/login');
                        },
                        child: Center(
                          child: RichText(
                            text:  TextSpan(
                              children: [
                                TextSpan(
                                  text: "Already have an account? ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: "Sign in",
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
          ),
        ],
      ),
    );
  }
}
