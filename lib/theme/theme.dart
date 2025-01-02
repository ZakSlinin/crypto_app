import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  scaffoldBackgroundColor: Color.fromARGB(1, 164, 255, 164),
  primarySwatch: Colors.purple,
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: Colors.white, fontSize: 25),
  ),
  dividerColor: Colors.white10,
  listTileTheme: ListTileThemeData(iconColor: Colors.white),
);