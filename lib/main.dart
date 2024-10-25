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
class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _AppNavigation();
}

// Navigation Logic & UI
class _AppNavigation extends State<MainApp> {
  // Declare the nav index (Home:0)
  int _currentIndex = 0;

  // Track if dropdown menu is open
  bool _isDropdownOpen = false;

  final List<Widget> _pages = [
    // Define the list of pages navigate
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

  // Toggle dropdown state
  void _toggleDropdown() {
    setState(() {
      _isDropdownOpen = !_isDropdownOpen;
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

      home: Scaffold(
        // AppBar
        appBar: AppBar(
          // Title with a PopupMenuButton and animated dropdown arrow
          title: PopupMenuButton<String>(
            onSelected: (value) {
              // ignore: avoid_print
              print(value); // You can handle the selected value here
              setState(() {
                _isDropdownOpen = false; // Close dropdown on selection
              });
            },
            onCanceled: () {
              setState(() {
                _isDropdownOpen = false; // Reset state when canceled
              });
            },
            offset: const Offset(0, 30),
            padding: EdgeInsets.zero,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Leapo"),
                  AnimatedRotation(
                    turns: _isDropdownOpen ? 0.5 : 0.0, // Rotate 180 degrees
                    duration: const Duration(milliseconds: 200),
                    child: const Icon(Icons.arrow_drop_down_outlined),
                  ),
                ],
              ),
            ),
            itemBuilder: (BuildContext context) {
              _toggleDropdown(); // Toggle dropdown state on open
              return <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'Home',
                  child: Text(
                    'Home',
                    style: Theme.of(context).popupMenuTheme.textStyle,
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'Popular',
                  child: Text(
                    'Popular',
                    style: Theme.of(context).popupMenuTheme.textStyle,
                  ),
                ),
              ];
            },
          ),

          // Left Button (Drawer or Menu)
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),

          // Right Button (Search)
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search_rounded),
            ),
          ],
        ),

        // Display the current page based on _currentIndex
        body: _pages[_currentIndex],

        // Bottom Navigation Bar
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex, // Set selected tab
          onTap: _onItemTapped, // Update index on tap
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_added_sharp),
              label: 'Save',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.flutter_dash_sharp),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.inbox_rounded),
              label: 'Inbox',
            ),
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
