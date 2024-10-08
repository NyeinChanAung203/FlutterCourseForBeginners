import 'package:flutter/material.dart';
import 'package:flutter_course/quiz_app/theme/colors.dart';

class QuizTheme {
  static ThemeData theme = ThemeData(
    primaryColor: primaryColor,
    brightness: Brightness.dark,
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        color: cyanColor,
        fontSize: 28,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontSize: 20,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryColor,
        side: const BorderSide(
          color: primaryColor,
          width: 1,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.8,
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: scaffoldBackgroundColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.8,
        ),
      ),
    ),
  );
}
