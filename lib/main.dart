import 'package:flutter/material.dart';
import 'package:leap/UI/Home/home.dart';
import 'package:leap/UI/Layout/styles.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the Debug Banner
      debugShowCheckedModeBanner: false,

      // Set the Theme
      theme: Styles.appTheme,

      // Calling the Entry Page
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Leapo",
            style: TextStyle(
                color: Color.fromARGB(255, 165, 241, 156),
                fontWeight: FontWeight.bold),
          ),
        ),

        // Pages
        body: const HomePage(),

        // Bottom Navigation Bar
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType
                .fixed, // Set this to prevent shifting behavior
            selectedItemColor: const Color.fromARGB(
                255, 165, 241, 156), // Set the color for the selected item
            unselectedItemColor:
                Colors.white, // Set the color for unselected items
            items: const [
              //
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              //
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_added_sharp),
                label: 'Save',
              ),
              //
              BottomNavigationBarItem(
                icon: Icon(Icons.flutter_dash_sharp),
                label: 'Dashboard',
              ),
              //
              BottomNavigationBarItem(
                icon: Icon(Icons.inbox_rounded),
                label: 'Inbox',
              ),
              //
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
              //
            ]),
      ),
    );
  }
}
