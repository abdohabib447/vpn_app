import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 3,
      backgroundColor: Colors.redAccent,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.red,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 3,
      backgroundColor: Colors.black12,
    ),
  );
}
