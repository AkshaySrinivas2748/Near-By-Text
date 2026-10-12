import 'package:flutter/material.dart';

final darkThemeData = ThemeData(
  scaffoldBackgroundColor: Colors.black,
  cardColor: Colors.white.withValues(alpha: 0.1),
  textTheme: TextTheme(
    bodySmall: TextStyle(
      fontSize: 12,
      color: Colors.white,
      fontWeight: FontWeight.w400,
    ),
    displaySmall: TextStyle(
      fontSize: 12,
      color: Colors.white,
      fontWeight: FontWeight.w400,
    ),
    labelSmall: TextStyle(
      fontSize: 12,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
  ),
  useMaterial3: true,
);

final lightThemeData = ThemeData(
  appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: Colors.white)),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  cardColor: Colors.black.withValues(alpha: 0.9),
  textTheme: TextTheme(
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    displaySmall: TextStyle(
      fontSize: 12,
      color: Colors.black,
      fontWeight: FontWeight.w400,
    ),
    labelSmall: TextStyle(
      fontSize: 12,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
  ),
  useMaterial3: true,
);
