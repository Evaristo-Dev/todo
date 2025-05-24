import 'package:flutter/material.dart';

ThemeData darkTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.grey[800],
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey,
      foregroundColor: Colors.white,
    ),
    iconTheme: IconThemeData(color: Colors.white),
    hintColor: Colors.orange,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w200),
    ),
  );
}

ThemeData lightTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.purple,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(backgroundColor: Colors.white),
    iconTheme: IconThemeData(color: Colors.white),
    hintColor: Colors.orange,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.orange,
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w200),
    ),
  );
}
