import 'package:flutter/material.dart';

class DarkMode {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color.fromARGB(255, 30, 28, 28),

      // AppBar theme
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

      // Popup menu theme
      popupMenuTheme: const PopupMenuThemeData(
        color: Color.fromARGB(255, 38, 39, 41),
        textStyle: TextStyle(color: Color.fromARGB(255, 0, 255, 127)),
      ),

      // Drawer theme
      drawerTheme: const DrawerThemeData(
        backgroundColor: Color.fromARGB(255, 30, 28, 28),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
        ),
      ),

      // ListTile theme
      listTileTheme: const ListTileThemeData(
        iconColor: Color.fromARGB(255, 0, 255, 127),
        textColor: Color.fromARGB(255, 0, 255, 127),
        style: ListTileStyle.drawer,
        titleTextStyle: TextStyle(
          color: Color.fromARGB(255, 0, 255, 127),
          fontWeight: FontWeight.bold,
        ),
      ),

      // Bottom navigation bar theme
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

      // Text theme
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 0, 255, 127),
        ),
        bodyLarge: TextStyle(color: Color.fromARGB(255, 0, 255, 127)),
        bodyMedium: TextStyle(color: Color.fromARGB(255, 0, 255, 127)),
      ),
    );
  }

  // Custom icon color for theme toggle
  static const Color iconColor = Color.fromARGB(255, 0, 255, 127);

  // Drawer header style for consistency
  static const BoxDecoration drawerHeaderStyle = BoxDecoration(
    color: Color.fromARGB(255, 0, 200, 83),
  );
}
