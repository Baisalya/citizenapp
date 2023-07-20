import 'package:citizenapp/Pages/Onboarding/Splashscreen.dart';
import 'package:citizenapp/Pages/Onboarding/users/authentication_view_model/authentication.dart';
import 'package:citizenapp/Routes/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'Pages/Onboarding/users/authentication_view_model/RegisterViewModel.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
  ));
  runApp(
    MultiProvider(providers:
    [
      ChangeNotifierProvider<AuthViewModel>(create:(_)=> AuthViewModel(),),
      ChangeNotifierProvider<RegisterViewModel>(create: (_) => RegisterViewModel()),
      // Add other providers if necessary
    ],
        child:  MyApp()
    ),
    );
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Citizen ',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages:AppRoutes.routes,
     // home: Container(),
    );
  }
}

