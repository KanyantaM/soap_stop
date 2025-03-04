import 'package:flutter/material.dart';

class SoapStopTheme {
  static final lightTheme = ThemeData(
    primaryColor: Colors.blue,
    colorScheme: const ColorScheme.light(
      primary: Colors.blue,
      secondary: Colors.lightBlueAccent,
      surface: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.black87,
    ),
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      elevation: 4,
      titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.blueAccent,
      foregroundColor: Colors.white,
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    chipTheme: const ChipThemeData(
      selectedColor: Colors.blue,
      backgroundColor: Colors.grey,
      labelStyle: TextStyle(color: Colors.black87),
    ),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
          fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
      titleMedium: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black87),
      bodyMedium: TextStyle(fontSize: 16, color: Colors.black87),
    ),
  );

  static final darkTheme = ThemeData(
    primaryColor: Colors.blueGrey,
    colorScheme: const ColorScheme.dark(
      primary: Colors.blueGrey,
      secondary: Colors.tealAccent,
      surface: Colors.black,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.white,
    ),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blueGrey,
      foregroundColor: Colors.white,
      elevation: 4,
      titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.blueGrey,
      foregroundColor: Colors.white,
    ),
    cardTheme: CardTheme(
      color: Colors.grey[900],
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    chipTheme: const ChipThemeData(
      selectedColor: Colors.blueGrey,
      backgroundColor: Colors.grey,
      labelStyle: TextStyle(color: Colors.white),
    ),
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
          fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
      titleMedium: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
    ),
  );
}
