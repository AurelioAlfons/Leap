import 'package:flutter/material.dart';
import 'package:leap/UI/Home/dashboard.dart';
import 'package:leap/UI/Home/home.dart';
import 'package:leap/UI/Home/inbox.dart';
import 'package:leap/UI/Home/profile.dart';
import 'package:leap/UI/Home/save.dart';
import 'package:leap/UI/Layout/dark.dart';
import 'package:leap/UI/Layout/light.dart';
import 'package:leap/UI/Layout/themeprovider.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _AppNavigation();
}

class _AppNavigation extends State<MainApp> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const SavePage(),
    const DashboardPage(),
    const InboxPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeProvider.of(context);

    return Scaffold(
      drawer: _buildLeftDrawer(themeProvider),
      endDrawer: _buildRightDrawer(themeProvider),
      body: _pages[_currentIndex],
      bottomNavigationBar: _buildNavBar(),
    );
  }

  Drawer _buildRightDrawer(ThemeProvider themeProvider) {
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
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/settings',
                      (Route<dynamic> route) => false,
                    );
                  },
                ),
              ),
              IconButton(
                icon: Icon(
                  themeProvider.isDarkMode
                      ? Icons.brightness_4
                      : Icons.brightness_4_outlined,
                  color: themeProvider.isDarkMode
                      ? DarkMode.iconColor
                      : LightMode.iconColor,
                ),
                onPressed: themeProvider.toggleTheme,
                tooltip: 'Toggle Theme',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Drawer _buildLeftDrawer(ThemeProvider themeProvider) {
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
          ListTile(
            leading: const Icon(Icons.logout_sharp),
            title: const Text(
              'Logout',
              style: TextStyle(fontSize: 24),
            ),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/',
                (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
    );
  }

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
