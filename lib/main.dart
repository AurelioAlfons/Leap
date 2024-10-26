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

// Main Class that we will run
class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _AppNavigation();
}

// Navigation Logic & UI
class _AppNavigation extends State<MainApp> {
  int _currentIndex = 0; // Declare the nav index (Home:0)
  bool _isDropdownOpen = false; // Track if dropdown menu is open
  bool isDarkMode = true; // Initial theme state (default to dark mode)

  // Toggle theme between Dark and Light
  void _toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  final List<Widget> _pages = [
    const HomePage(),
    const SavePage(),
    const DashboardPage(),
    const InboxPage(),
    const ProfilePage(),
  ];

  // Handle bottom navigation item tap
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove Debug Banner
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? DarkMode.darkTheme : LightMode.lightTheme,

      home: Scaffold(
        appBar: AppBar(
          // Title with dropdown
          title: PopupMenuButton<String>(
            onSelected: (value) {
              // ignore: avoid_print
              print(value); // Handle selected item
              setState(() {
                _isDropdownOpen = false;
              });
            },
            onCanceled: () {
              setState(() {
                _isDropdownOpen = false;
              });
            },
            offset: const Offset(0, 30),
            padding: EdgeInsets.zero,
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
            itemBuilder: (BuildContext context) {
              _toggleDropdown();
              return <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'Home',
                  child: Row(
                    children: [
                      const Icon(Icons.home_rounded),
                      Text(
                        '   Home',
                        style: Theme.of(context).popupMenuTheme.textStyle,
                      ),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'Popular',
                  child: Row(
                    children: [
                      const Icon(Icons.data_exploration_rounded),
                      Text(
                        '   Popular',
                        style: Theme.of(context).popupMenuTheme.textStyle,
                      ),
                    ],
                  ),
                ),
              ];
            },
          ),

          // Left Button (Drawer or Menu)
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),

          // Right Button (Search)
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search_rounded),
            ),
            Builder(
              builder: (context) {
                return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  icon: const Icon(
                      Icons.lightbulb_outlined), // Static icon for right drawer
                );
              },
            ),
          ],
        ),

        // Left Drawer (Menu)
        drawer: leftDrawer(context),

        // Right Drawer (Additional Menu)
        endDrawer: rightDrawer(),

        // Display the current page based on _currentIndex
        body: _pages[_currentIndex],

        // Bottom Navigation Bar
        bottomNavigationBar: navBar(),
      ),
    );
  }

  // Right Drawer with Theme Toggle
  Drawer rightDrawer() {
    return Drawer(
      child: Column(
        children: [
          // Expanded to make drawer scrollable
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
                // Add other menu items here if needed
              ],
            ),
          ),

          // Row for Settings and Theme Toggle
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
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              IconButton(
                // Toggle icon between filled and outlined based on isDarkMode
                icon: Icon(isDarkMode
                    ? Icons.brightness_4 // Filled icon for dark mode
                    : Icons
                        .brightness_4_outlined), // Outlined icon for light mode
                onPressed: _toggleTheme,
                tooltip: 'Toggle Theme',
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Left Drawer
  Drawer leftDrawer(BuildContext context) {
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
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  // Bottom Navigation Bar
  BottomNavigationBar navBar() {
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
