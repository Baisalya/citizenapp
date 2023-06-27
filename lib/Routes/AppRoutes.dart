import 'package:citizenapp/Pages/Onboarding/OnboardingScreen.dart';
import 'package:citizenapp/Pages/Onboarding/Splashscreen.dart';
import 'package:citizenapp/Pages/Onboarding/users/LoginScreen.dart';
import 'package:citizenapp/Pages/Onboarding/users/SignUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final List<GetPage> routes = [
    GetPage(
      name: '/',
      page: () => SplashScreen(),
      transition: Transition.fade,
    ),
    GetPage(
        name: '/onBoarding',
        page: ()=> OnboardingScreen(),
        transition: Transition.circularReveal),
    //Login
    GetPage(
      name: '/login',
      page: () => LoginScreen(),
      transition: Transition.fadeIn,
    ),
    //Signup
    GetPage(
        name: '/signup',
        page: () =>SignUpScreen(),
        transition: Transition.upToDown
    ),
  ];
}