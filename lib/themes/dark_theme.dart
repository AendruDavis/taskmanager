import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  primaryColor: Colors.green[800],
  scaffoldBackgroundColor: Colors.black,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(color: Colors.white70, fontSize: 16),
    bodyMedium: TextStyle(color: Colors.white54, fontSize: 14),
  ),
  appBarTheme: AppBarTheme(
    color: Colors.green[800],
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
  tabBarTheme: TabBarTheme(
    labelColor: Colors.green, // Text color for selected tab
    unselectedLabelColor: Colors.white, // Text color for unselected tabs
    indicator: BoxDecoration(
      color: Colors.green, // Indicator color for selected tab
      borderRadius: BorderRadius.circular(10), // Rounded corners
    ),
    indicatorSize: TabBarIndicatorSize.label,

    labelPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 40),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.green[800],
    textTheme: ButtonTextTheme.primary,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.green[800], // Button text color
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.green[800], // Text color for TextButton
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.green[800],
      side: BorderSide(color: Colors.green[800]!),
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.green[800],
  ),
  dividerColor: Colors.white24,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: Colors.amber[700],
    background: Colors.black,
    error: Colors.red[700],
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade600),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.green[800]!),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red[700]!),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red[700]!),
    ),
    labelStyle: const TextStyle(color: Colors.white70),
    floatingLabelStyle: TextStyle(color: Colors.green[800]),
    contentPadding: const EdgeInsets.all(16.0),
  ),
);
