import 'package:flutter/material.dart';
import 'package:leap/UI/Layout/themeprovider.dart';
import 'package:leap/UI/Layout/dark.dart';
import 'package:leap/UI/Layout/light.dart';
import 'package:leap/UI/Login/login.dart';
import 'package:leap/UI/Login/signup.dart';
import 'package:leap/UI/Settings/settings.dart';
import 'package:leap/content.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = true;

  void _toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      isDarkMode: isDarkMode,
      toggleTheme: _toggleTheme,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: isDarkMode ? DarkMode.darkTheme : LightMode.lightTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => const LoginPage(),
          '/home': (context) => const MainApp(),
          '/signup': (context) => SignUpPage(),
          '/settings': (context) => const SettingsPage(),
        },
      ),
    );
  }
}
