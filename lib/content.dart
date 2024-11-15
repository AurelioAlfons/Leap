import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart'; // Add this for launching URLs
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
              children: [
                const SizedBox(
                  height: 50,
                ),
                CircleAvatar(
                  radius: 56,
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
                  leading: const Icon(Icons.group),
                  title: const Text('Social Media',
                      style: TextStyle(fontSize: 18)),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    _showSocialMediaBottomSheet(
                        context); // Show bottom sheet on tap
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.location_on),
                  title: const Text('Location', style: TextStyle(fontSize: 18)),
                  trailing:
                      const Icon(Icons.arrow_forward_ios), // Trailing icon
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/map',
                      (Route<dynamic> route) => false,
                    );
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
                    Navigator.pushNamed(
                      context,
                      '/settings',
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
              children: [
                const SizedBox(
                  height: 50,
                ),
                CircleAvatar(
                  radius: 56,
                  backgroundColor:
                      Theme.of(context).brightness == Brightness.dark
                          ? DarkMode.outerAvatarColor
                          : LightMode.outerAvatarColor,
                  child: const CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage('assets/icon/terno.png'),
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

  void _showSocialMediaBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Social Media Contacts',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 10),
                ListTile(
                  leading: const Icon(Icons.phone),
                  title: const Text('Customer Support'),
                  subtitle: const Text('+61 505 503 4455'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    _launchUrl('tel:+615055034455'); // Launch phone call
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.facebook,
                    color: Colors.blue[600],
                  ),
                  title: const Text('Facebook'),
                  subtitle: const Text('https://www.facebook.com/terno'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    _launchUrl('https://www.facebook.com');
                  },
                ),
                ListTile(
                  leading: SvgPicture.asset(
                    'assets/icon/instagram.svg',
                    width: 24,
                    height: 24,
                  ),
                  title: const Text('Instagram'),
                  subtitle: const Text('https://www.instagram.com/terno'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    _launchUrl('https://www.instagram.com');
                  },
                ),
                ListTile(
                  leading: SvgPicture.asset(
                    'assets/icon/twitter.svg',
                    width: 24,
                    height: 24,
                  ),
                  title: const Text('Twitter'),
                  subtitle: const Text('https://twitter.com/terno'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    _launchUrl('https://twitter.com');
                  },
                ),
                ListTile(
                  leading: SvgPicture.asset(
                    'assets/icon/tiktok.svg',
                    width: 24,
                    height: 24,
                  ),
                  title: const Text('Tiktok'),
                  subtitle: const Text('https://tiktok.com/terno'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    _launchUrl('https://tiktok.com');
                  },
                ),
                ListTile(
                  leading: SvgPicture.asset(
                    'assets/icon/linkedin.svg',
                    width: 24,
                    height: 24,
                  ),
                  title: const Text('Linkedin'),
                  subtitle: const Text('https://linkedin.com/terno'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    _launchUrl('https://linkedin.com');
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication, // Opens in the default browser
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
