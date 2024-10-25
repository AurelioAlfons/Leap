import 'package:flutter/material.dart';

class Styles {
  static ThemeData get appTheme {
    return ThemeData(
      // Set the theme to dark mode
      brightness: Brightness.dark,

      // Black for AppBar and primary elements
      primaryColor: const Color.fromARGB(255, 30, 28, 28),

      // Black background for the body
      scaffoldBackgroundColor: const Color.fromARGB(255, 30, 28, 28),

      // Customize AppBar theme
      appBarTheme: const AppBarTheme(
        backgroundColor:
            Color.fromARGB(255, 30, 28, 28), // Same black as primary
        titleTextStyle: TextStyle(
          color: Color.fromARGB(
              255, 165, 241, 156), // The green color for the text
          fontWeight: FontWeight.bold,
          fontSize: 20, // Optional: Adjust font size as needed
        ),
      ),

      // Define text themes for other parts of the app
      textTheme: const TextTheme(
        titleLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white70),
        // Add any other text styles as needed
      ),
    );
  }
}
