import 'package:flutter/material.dart';

class AppTheme {

  static final lightTheme = ThemeData(
    shadowColor: const Color(0xffFBDF6A),
    useMaterial3: true,
    //canvasColor: const Color(0xffF4F4F4),
    cardColor: const Color(0xff53E88B),
    brightness: Brightness.light,
    primaryColor: Colors.black,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: const Color(0xffF7F8FE),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    colorScheme: const ColorScheme.light(secondary: Color(0xff53E88B)),
  );

  static final darkTheme = ThemeData(
    shadowColor: const Color(0xffFFFFFF),
    useMaterial3: true,
    canvasColor: const Color(0xff252525),
    cardColor: const Color(0xff53E88B),
    brightness: Brightness.dark,
    primaryColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: const Color(0xff0D0D0D),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    colorScheme: const ColorScheme.dark(brightness: Brightness.dark, secondary: Color(0xff53E88B)),
  );
}
