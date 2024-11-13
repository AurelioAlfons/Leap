// lib/business_page.dart
import 'package:flutter/material.dart';
import 'package:leap/UI/Business/gallery.dart';
import 'package:leap/UI/Business/posting.dart';
import 'package:leap/UI/Business/profile.dart';
import 'package:leap/UI/Layout/dark.dart';
import 'package:leap/UI/Layout/light.dart';
import 'package:leap/UI/Layout/themeprovider.dart'; // Import the new page files

class BusinessPage extends StatefulWidget {
  const BusinessPage({super.key});

  @override
  State<BusinessPage> createState() => _BusinessPageState();
}

class _BusinessPageState extends State<BusinessPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const GalleryPage(),
    const PostPage(),
    const BusinessProfilePage(),
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
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Business App'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.lightbulb_outlined),
            onPressed: () => _scaffoldKey.currentState!.openEndDrawer(),
            tooltip: 'Open Settings',
          ),
        ],
      ),
      drawer: _buildLeftDrawer(themeProvider),
      endDrawer: _buildRightDrawer(themeProvider),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_library),
            label: 'Gallery',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
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

  Drawer _buildRightDrawer(ThemeProvider themeProvider) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const SizedBox(
                  height: 50,
                ),
                CircleAvatar(
                  radius: 65,
                  backgroundColor:
                      Theme.of(context).brightness == Brightness.dark
                          ? DarkMode.outerAvatarColor
                          : LightMode.outerAvatarColor,
                  child: const CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage('assets/icon/terno.png'),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('Billing Account',
                      style: TextStyle(fontSize: 18)),
                  trailing:
                      const Icon(Icons.arrow_forward_ios), // Trailing icon
                  onTap: () {
                    // Navigate to Account settings
                  },
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
}
