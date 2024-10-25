import 'package:flutter/material.dart';

class Styles {
  static ThemeData get appTheme {
    return ThemeData(
      // Set theme to dark mode
      brightness: Brightness.dark,

      // Body background color
      scaffoldBackgroundColor: const Color.fromARGB(255, 30, 28, 28),

      // AppBar
      appBarTheme: const AppBarTheme(
          // AppBar Color
          backgroundColor: Color.fromARGB(255, 30, 28, 28),
          // Text Style
          titleTextStyle: TextStyle(
              color: Color.fromARGB(255, 165, 241, 156),
              fontWeight: FontWeight.bold,
              fontSize: 20),
          // Icon
          iconTheme: IconThemeData(color: Color.fromARGB(255, 165, 241, 156))),

      // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

      // Popup  theme for consistent styling
      popupMenuTheme: const PopupMenuThemeData(
        color: Color.fromARGB(255, 38, 39, 41),
        textStyle: TextStyle(color: Color.fromARGB(255, 165, 241, 156)),
      ),

      // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

      // Bottom Navbar
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color.fromARGB(255, 30, 28, 28),
        // Selected item
        selectedItemColor: Color.fromARGB(255, 165, 241, 156),
        // Unselected item
        unselectedItemColor: Colors.white,
      ),
      //
    );
  }
}
