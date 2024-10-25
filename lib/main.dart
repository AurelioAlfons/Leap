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

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _currentIndex = 0; // Track selected tab index

  final List<Widget> _pages = [
    // Correctly define the list of pages
    const HomePage(),
    const SavePage(),
    const DashboardPage(),
    const InboxPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index; // Update selected index on item tap
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Styles.appTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Leapo"),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search_rounded),
            ),
          ],
        ),

        // Display the selected page based on _currentIndex
        body: _pages[_currentIndex],

        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex, // Set selected tab
          onTap: _onItemTapped, // Update index on tap
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
