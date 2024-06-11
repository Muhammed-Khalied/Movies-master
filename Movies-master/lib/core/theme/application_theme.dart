import 'package:flutter/material.dart';

class ApplicationTheme {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: const Color(0xff121312),
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 30,
      ),
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontFamily: 'Inter',
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xffB5B4B4),
      primary: const Color(0xffB5B4B4),
      secondary: Colors.white,
      background: const Color(0xff121312),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Color(0xffB5B4B4),
        fontFamily: 'Inter',
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: Color(0xffB5B4B4),
        fontFamily: 'Inter',
        fontSize: 22,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: TextStyle(
        color: Colors.white,
        fontFamily: 'Inter',
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xff282A28),
      elevation: 6,
      selectedIconTheme: IconThemeData(
        color: Color(0xffFFB224),
        size: 25,
      ),
      selectedItemColor: Color(0xffFFB224),
      selectedLabelStyle: TextStyle(
        color: Color(0xffFFB224),
        fontSize: 8,
        fontWeight: FontWeight.w400,
        height: 2,
      ),
      unselectedIconTheme: IconThemeData(
        color: Color(0xffC6C6C6),
        size: 25,
      ),
      unselectedItemColor: Color(0xffC6C6C6),
      unselectedLabelStyle: TextStyle(
        color: Color(0xffC6C6C6),
        fontSize: 8,
        fontWeight: FontWeight.w400,
        height: 2,
      ),
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),
  );
}
