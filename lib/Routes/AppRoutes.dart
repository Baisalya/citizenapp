import 'package:citizenapp/Pages/Home/HomeScreen.dart';
import 'package:citizenapp/Pages/Home/SettingTab/ChangePasswordScreen.dart';
import 'package:citizenapp/Pages/Home/Tab/SettingTab.dart';
import 'package:citizenapp/Pages/Onboarding/OnboardingScreen.dart';
import 'package:citizenapp/Pages/Onboarding/Splashscreen.dart';
import 'package:citizenapp/Pages/Home/SettingTab/EditProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Pages/users/LoginScreen.dart';
import '../Pages/users/SignUpScreen.dart';

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
    //Tabs
    GetPage(name: '/home',
        page: ()=>HomeScreen()),

    GetPage(name: '/setting',
        page:()=> SettingsTab()),

   //setting contents
    GetPage(name: '/editProfile',
        page: ()=>EditProfileScreen()),
    GetPage(name:'/changePassword' ,
        page: ()=>ChangePasswordScreen())
  ];
}