import 'package:flutter/material.dart';
import 'package:leap/UI/Home/dashboard.dart';
import 'package:leap/UI/Home/home.dart';
import 'package:leap/UI/Home/inbox.dart';
import 'package:leap/UI/Home/profile.dart';
import 'package:leap/UI/Home/save.dart';
import 'package:leap/UI/Layout/dark.dart';
import 'package:leap/UI/Layout/light.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _AppNavigation();
}

class _AppNavigation extends State<MainApp> {
  // Initial navigation index
  int _currentIndex = 0;
  // Default theme state
  bool isDarkMode = true;

  // Toggle theme between dark and light
  void _toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  // List of pages for bottom navigation
  final List<Widget> _pages = [
    const HomePage(),
    const SavePage(),
    const DashboardPage(),
    const InboxPage(),
    const ProfilePage(),
  ];

  // Handle bottom navigation item selection
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? DarkMode.darkTheme : LightMode.lightTheme,
      home: Scaffold(
        // Left Drawer (Main Menu)
        drawer: _buildLeftDrawer(),

        // Right Drawer (Additional Menu)
        endDrawer: _buildRightDrawer(),

        // Display the current page based on _currentIndex
        body: _pages[_currentIndex],

        // Bottom Navigation Bar
        bottomNavigationBar: _buildNavBar(),
      ),
    );
  }

  // Right Drawer with Theme Toggle
  Drawer _buildRightDrawer() {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: const [
                DrawerHeader(
                  decoration: DarkMode.drawerHeaderStyle,
                  child: Text(
                    'Right Menu',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ],
            ),
          ),

          // Settings and Theme Toggle Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListTile(
                  leading: const Icon(Icons.settings_suggest_sharp),
                  title: const Text(
                    'Settings',
                    style: TextStyle(fontSize: 24),
                  ),
                  onTap: () {},
                ),
              ),
              IconButton(
                icon: Icon(
                  isDarkMode ? Icons.brightness_4 : Icons.brightness_4_outlined,
                  color: isDarkMode ? DarkMode.iconColor : LightMode.iconColor,
                ),
                onPressed: _toggleTheme,
                tooltip: 'Toggle Theme',
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Left Drawer with Logout option
  Drawer _buildLeftDrawer() {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: const [
                DrawerHeader(
                  decoration: DarkMode.drawerHeaderStyle,
                  child: Text(
                    'Left Menu',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              ],
            ),
          ),

          // Logout button at the bottom
          ListTile(
            leading: const Icon(Icons.logout_sharp),
            title: const Text(
              'Logout',
              style: TextStyle(fontSize: 24),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  // Bottom Navigation Bar
  BottomNavigationBar _buildNavBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      onTap: _onItemTapped,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
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
    );
  }
}
