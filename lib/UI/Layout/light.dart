import 'package:flutter/material.dart';

class LightMode {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xFFF5EAD7),

      // AppBar theme
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFFF5EAD7),
        titleTextStyle: TextStyle(
          color: Color(0xFF007A5E), // Green text color
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        iconTheme: IconThemeData(
          color: Color(0xFF007A5E),
          size: 28,
        ),
      ),

      // Card theme
      cardColor: const Color(0xFFF0EFEA), // Light card background

      // Icon theme for ProfilePage cards
      iconTheme: const IconThemeData(
        color: Color(0xFF007A5E), // Green icon color
      ),

      // Popup menu theme
      popupMenuTheme: const PopupMenuThemeData(
        color: Color(0xFFF5EAD7),
        textStyle: TextStyle(color: Color(0xFF007A5E)),
      ),

      // Drawer theme
      drawerTheme: const DrawerThemeData(
        backgroundColor: Color(0xFFF5EAD7),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
        ),
      ),

      // ListTile theme
      listTileTheme: const ListTileThemeData(
        iconColor: Color(0xFF007A5E),
        textColor: Color(0xFF007A5E),
        style: ListTileStyle.drawer,
        titleTextStyle: TextStyle(
          color: Color(0xFF007A5E),
          fontWeight: FontWeight.bold,
        ),
      ),

      // Bottom navigation bar theme
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFFF5EAD7),
        selectedIconTheme: IconThemeData(
          size: 34,
          color: Color(0xFF007A5E),
        ),
        unselectedIconTheme: IconThemeData(
          size: 26,
          color: Color(0xFF5F5F5F), // Gray color
        ),
      ),

      // Text theme
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
          color: Colors.black,
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

      // Tab bar theme
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

  // Define colors for profile avatar
  static const Color outerAvatarColor = Color(0xFFF5EAD7);

  // Colors for the Edit Profile button in Dark Mode
  static const Color buttonBackgroundColor = Color(0xFF007A5E);
  // Adjust this color if needed
  static const Color buttonTextColor = Color(0xFF007A5E);

  // Drawer header style for consistency
  static const BoxDecoration drawerHeaderStyle = BoxDecoration(
    color: Color(0xFFFFC857),
  );
}
