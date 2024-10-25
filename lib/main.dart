import 'package:flutter/material.dart';
import 'package:leap/UI/Home/dashboard.dart';
import 'package:leap/UI/Home/home.dart';
import 'package:leap/UI/Home/inbox.dart';
import 'package:leap/UI/Home/profile.dart';
import 'package:leap/UI/Home/save.dart';
import 'package:leap/UI/Layout/styles.dart';

void main() {
  runApp(const MainApp());
}

// Main Class that we will run
// Declare a StatefulWidget => App can change pages, buttons, etc
// Changing state
class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  // Brain of the app: remember information, on clicked, page index
  // Create the state which we call the _MainAppState
  State<MainApp> createState() => _AppNavigation();
}

// Navigation Logic & UI
class _AppNavigation extends State<MainApp> {
  // Declare the nav index (Home:0)
  int _currentIndex = 0;

  final List<Widget> _pages = [
    // Define the list of pages navigate
    // HomePage = 0, and so on
    const HomePage(),
    const SavePage(),
    const DashboardPage(),
    const InboxPage(),
    const ProfilePage(),
  ];

  // On Tap function
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  // UI Configuration (AppBar & Navbar)
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove Debug Banner
      debugShowCheckedModeBanner: false,

      // Calling the appTheme from Styles class
      theme: Styles.appTheme,

      // Scaffold
      home: Scaffold(
        // AppBar
        appBar: AppBar(
          // Title
          title: const Text("Leapo"),
          // Left Button
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          // Right Button
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search_rounded),
            ),
          ],
        ),

        // Display the current index
        body: _pages[_currentIndex],

        // Bottom Navigatio Bar
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          // Set selected tab
          currentIndex: _currentIndex,
          // Update index on tap
          onTap: _onItemTapped,
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
          ],
        ),
      ),
    );
  }
}
