import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  primaryColor: Colors.green[700],
  scaffoldBackgroundColor: Colors.white,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(color: Colors.black, fontSize: 16),
    bodyMedium: TextStyle(color: Colors.black54, fontSize: 14),
  ),
  appBarTheme: AppBarTheme(
    color: Colors.green[700],
    iconTheme: const IconThemeData(color: Colors.white),
    toolbarTextStyle: const TextTheme(
      titleLarge: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    ).bodyMedium,
    titleTextStyle: const TextTheme(
      titleLarge: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    ).titleLarge,
  ),
  tabBarTheme: const TabBarTheme(
    labelColor: Colors.white, // Text color for selected tab
    unselectedLabelColor: Colors.black, // Text color for unselected tabs
    // indicator: BoxDecoration(
    //   color: Colors.green, // Indicator color for selected tab
    // ),
    labelPadding: EdgeInsets.symmetric(horizontal: 20.0),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.green[700],
    textTheme: ButtonTextTheme.primary,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.green[700], // Button text color
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.green[700], // Text color for TextButton
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.green[700],
      side: BorderSide(color: Colors.green[700]!),
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.green[700],
  ),
  dividerColor: Colors.black12,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: Colors.amber[600],
    background: Colors.white,
    error: Colors.red[600],
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: const OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.green[700]!),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red[600]!),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red[600]!),
    ),
    labelStyle: const TextStyle(color: Colors.black54),
    floatingLabelStyle: TextStyle(color: Colors.green[700]),
    contentPadding: const EdgeInsets.all(16.0),
  ),
);
