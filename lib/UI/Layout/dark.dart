import 'package:flutter/material.dart';

class DarkMode {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color.fromARGB(255, 30, 28, 28),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 30, 28, 28),
        titleTextStyle: TextStyle(
          color: Color.fromARGB(255, 0, 255, 127),
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 0, 255, 127),
          size: 28,
        ),
      ),
      popupMenuTheme: const PopupMenuThemeData(
        color: Color.fromARGB(255, 38, 39, 41),
        textStyle: TextStyle(color: Color.fromARGB(255, 0, 255, 127)),
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: Color.fromARGB(255, 30, 28, 28),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
        ),
      ),
      listTileTheme: const ListTileThemeData(
        iconColor: Color.fromARGB(255, 0, 255, 127),
        textColor: Color.fromARGB(255, 0, 255, 127),
        style: ListTileStyle.drawer,
        titleTextStyle: TextStyle(
          color: Color.fromARGB(255, 0, 255, 127),
          fontWeight: FontWeight.bold,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color.fromARGB(255, 30, 28, 28),
        selectedIconTheme: IconThemeData(
          size: 34,
          color: Color.fromARGB(255, 0, 255, 127),
        ),
        unselectedIconTheme: IconThemeData(
          size: 26,
          color: Colors.white,
        ),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 0, 255, 127),
        ),
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white70),
      ),
    );
  }

  static const BoxDecoration drawerHeaderStyle = BoxDecoration(
    color: Color.fromARGB(255, 0, 200, 83),
  );
}
