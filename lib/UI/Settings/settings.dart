import 'package:flutter/material.dart';
import 'package:leap/UI/Layout/dark.dart';
import 'package:leap/UI/Layout/light.dart';
import 'package:leap/UI/Layout/themeprovider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        actions: [
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
      body: ListView(
        children: [
          // About Section
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'About',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Learn more about our policies, user agreements, and acknowledgments.',
              style: TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(height: 16),

          // Content Policies Section
          ListTile(
            leading: const Icon(Icons.policy),
            title: const Text('Content Policy'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Content Policy page
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip),
            title: const Text('Privacy Policy'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Privacy Policy page
            },
          ),
          ListTile(
            leading: const Icon(Icons.gavel),
            title: const Text('User Agreement'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to User Agreement page
            },
          ),
          ListTile(
            leading: const Icon(Icons.thumb_up),
            title: const Text('Acknowledgements'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Acknowledgements page
            },
          ),

          // Divider between sections
          const Divider(thickness: 1, height: 32),

          // Support Section
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Support',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.help_center),
            title: const Text('Help Center'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Help Center
            },
          ),
          ListTile(
            leading: const Icon(Icons.report_problem),
            title: const Text('Report an Issue'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Report an Issue page
            },
          ),
        ],
      ),
    );
  }
}
