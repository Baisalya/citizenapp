import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF578CE7); // Indigo
  static const Color secondaryColor = Color(0xFFFF5722); // Deep Orange
  static const Color accentColor = Color(0xFF4CAF50); // Green
  static const Color backgroundColor = Colors.white;
  static const Color textColor = Color(0xFF212121); // Black
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    primaryColorDark: Color(0xFF303F9F),
    primaryColorLight: Color(0xFFC5CAE9),
    accentColor: AppColors.accentColor,
    backgroundColor: AppColors.backgroundColor,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    appBarTheme: AppBarTheme(
      color: AppColors.primaryColor,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: AppColors.textColor,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: AppColors.textColor,
        fontSize: 16.0,
      ),
      // Add more text styles as needed
    ),
    // Add more theme configurations as needed
  );
}
