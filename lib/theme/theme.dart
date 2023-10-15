import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  listTileTheme: const ListTileThemeData(iconColor: Colors.white),
  dividerColor: Colors.white24,
  // style app Bar
  appBarTheme: const AppBarTheme(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: Color.fromARGB(255, 80, 78, 78),
      titleTextStyle: TextStyle(
          color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700)),
  // style main text
  scaffoldBackgroundColor: const Color.fromARGB(255, 80, 78, 78),
  primarySwatch: Colors.yellow,
  textTheme: TextTheme(
      // style main text
      bodyMedium: const TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
      labelSmall: TextStyle(
          color: Colors.white.withOpacity(0.6),
          fontSize: 16,
          fontWeight: FontWeight.bold)),
);
