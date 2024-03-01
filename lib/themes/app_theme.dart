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
    ),
  );
}
