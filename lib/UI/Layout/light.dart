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

      // Text theme (only defined once)
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        bodyLarge: TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
        titleMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        titleSmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        bodySmall: TextStyle(
          fontSize: 14,
          color: Color.fromARGB(255, 43, 42, 42),
        ),
        labelLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color(0xFF007A5E),
        ),
      ),

      tabBarTheme: const TabBarTheme(
        labelColor: Color(0xFF007A5E),
        unselectedLabelColor: Color(0xFF5F5F5F),
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            color: Color(0xFF007A5E),
            width: 2.0,
          ),
        ),
      ),
    );
  }

  // Custom icon color for theme toggle
  static const Color iconColor = Color(0xFF007A5E);

  static const BoxDecoration drawerHeaderStyle = BoxDecoration(
    color: Color(0xFFFFC857),
  );
}
