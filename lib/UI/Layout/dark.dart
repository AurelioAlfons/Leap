import 'package:flutter/material.dart';

class DarkMode {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color.fromARGB(255, 30, 28, 28),

      shadowColor: const Color.fromARGB(255, 55, 204, 87),

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

      // Card theme
      cardColor: const Color.fromARGB(255, 38, 39, 41),

      // Icon theme for cards in ProfilePage
      iconTheme: const IconThemeData(
        color: Color.fromARGB(255, 0, 255, 127),
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
          color: Colors.white,
        ),
        bodyLarge: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
        titleMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        titleSmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        bodySmall: TextStyle(
          fontSize: 14,
          color: Colors.grey,
        ),
        labelLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 0, 255, 127),
        ),
      ),

      // TabBar theme
      tabBarTheme: const TabBarTheme(
        labelColor: Color.fromARGB(255, 0, 255, 127),
        unselectedLabelColor: Colors.white,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 0, 255, 127),
            width: 2.0,
          ),
        ),
      ),
    );
  }

  // Custom colors
  static const Color iconColor = Color.fromARGB(255, 0, 255, 127);
  static const Color outerAvatarColor = Color.fromARGB(255, 30, 28, 28);
  static const Color buttonBackgroundColor = Color.fromARGB(255, 0, 255, 127);
  static const Color buttonTextColor = Color.fromARGB(255, 0, 255, 127);

  // Drawer header style for consistency
  static const BoxDecoration drawerHeaderStyle = BoxDecoration(
    color: Color.fromARGB(255, 0, 200, 83),
  );
}
