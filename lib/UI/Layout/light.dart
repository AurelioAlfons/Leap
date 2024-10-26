import 'package:flutter/material.dart';

class LightMode {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xFFF5EAD7), // Suggested Beige
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFFF5EAD7), // Suggested Beige
        titleTextStyle: TextStyle(
          color: Color(0xFF007A5E), // Suggested Green
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        iconTheme: IconThemeData(
          color: Color(0xFF007A5E), // Suggested Green
          size: 28,
        ),
      ),
      popupMenuTheme: const PopupMenuThemeData(
        color: Color(0xFFF5EAD7), // Suggested Beige
        textStyle: TextStyle(color: Color(0xFF007A5E)), // Suggested Green
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: Color(0xFFF5EAD7), // Suggested Beige
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
        ),
      ),
      listTileTheme: const ListTileThemeData(
        iconColor: Color(0xFF007A5E), // Suggested Green
        textColor: Color(0xFF007A5E), // Suggested Green
        style: ListTileStyle.drawer,
        titleTextStyle: TextStyle(
          color: Color(0xFF007A5E),
          fontWeight: FontWeight.bold,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFFF5EAD7), // Suggested Beige
        selectedIconTheme: IconThemeData(
          size: 34,
          color: Color(0xFF007A5E), // Suggested Green
        ),
        unselectedIconTheme: IconThemeData(
          size: 26,
          color: Color(0xFF5F5F5F), // Suggested Gray
        ),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color(0xFF007A5E), // Suggested Green
        ),
        bodyLarge: TextStyle(color: Colors.black),
        bodyMedium: TextStyle(
            color: Color(0xFF5F5F5F)), // Suggested Gray for secondary text
      ),
    );
  }

  static const BoxDecoration drawerHeaderStyle = BoxDecoration(
    color: Color(0xFFFFC857),
  );
}
