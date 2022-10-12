import 'package:flutter/material.dart';

class DafaultThemeShere {
  static var defaultThame = ThemeData(
    primarySwatch: Colors.orange,
    primaryColor: Colors.orangeAccent[800],
    fontFamily: 'Georgia',
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blueGrey[50],
      elevation: 0,
      titleTextStyle: const TextStyle(
        color: Colors.black,
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.orange,
    ),
    scaffoldBackgroundColor: Colors.blueGrey[50],
  );
}
