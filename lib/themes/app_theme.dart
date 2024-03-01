import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData defaultTheme = ThemeData(
    primaryColor: const Color(0xFFDC5151),
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFDC5151),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFFD9D9D9),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          width: 2,
          color: Colors.grey.shade100,
        ),
        borderRadius: BorderRadius.circular(
          5,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 2,
          color: Colors.grey.shade100,
        ),
        borderRadius: BorderRadius.circular(
          5,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 2,
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(
          5,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 2,
          color: Colors.red,
        ),
        borderRadius: BorderRadius.circular(
          5,
        ),
      ),
    ),
  );
}
