import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: const Color(0xFF172182),
  brightness: Brightness.light,
  scaffoldBackgroundColor: const Color(0xFFDEE1ED),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Color(0xFF374992)),
    bodyMedium: TextStyle(fontSize: 16, color: Color(0xFF374992)),
    titleMedium: TextStyle(
      color: Color(0xFF000000),
      fontWeight: FontWeight.bold,
    ),
  ),
  iconTheme: const IconThemeData(color: Color(0xFF8C8C8C)),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: const Color(0xFF7883B4),
    onSecondary: Colors.white,
    onSurface: const Color(0xFF494949),
  ),
  dividerColor: const Color(0xFFB0B0B0),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    labelStyle: const TextStyle(color: Color(0xFF374992)),
    prefixIconColor: const Color(0xFF8C8C8C),
    suffixIconColor: const Color(0xFF8C8C8C),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide.none,
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(color: Colors.red),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(color: Colors.red),
    ),
    isDense: true,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFFcfd3e4),
      foregroundColor: const Color(0xFF172182),
      padding: const EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      minimumSize: const Size(50, 40),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: const Color(0xFF172182),
      textStyle: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
    ),
  ),
);
