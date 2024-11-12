import 'package:flutter/material.dart';
import 'package:leap/UI/Layout/themeprovider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    // Access ThemeProvider to get isDarkMode and toggleTheme
    final themeProvider = ThemeProvider.of(context);
    final isDarkMode = themeProvider.isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.keyboard_backspace),
          onPressed: () {
            Navigator.pushNamed(context, '/home'); // Navigates to '/home'
          },
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Account'),
            trailing: const Icon(Icons.arrow_forward_ios), // Trailing icon
            onTap: () {
              // Navigate to Account settings
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail),
            title: const Text('Contact us'),
            trailing: const Icon(Icons.arrow_forward_ios), // Trailing icon
            onTap: () {
              // Navigate to Contact us page
            },
          ),
          ListTile(
            leading: const Icon(Icons.color_lens),
            title: const Text('Appearance'),
            trailing: const Icon(Icons.arrow_forward_ios), // Trailing icon
            onTap: () {
              // Navigate to Appearance settings
            },
          ),
          ListTile(
            leading: const Icon(Icons.group),
            title: const Text('Social Media'),
            trailing: const Icon(Icons.arrow_forward_ios), // Trailing icon
            onTap: () {
              // Navigate to Social Media settings
            },
          ),
          ListTile(
            leading: const Icon(Icons.location_on),
            title: const Text('Location'),
            trailing: const Icon(Icons.arrow_forward_ios), // Trailing icon
            onTap: () {
              // Navigate to Location settings
            },
          ),
          ListTile(
            leading: const Icon(Icons.brightness_6),
            title: const Text('Dark Mode'),
            trailing: Switch(
              value: isDarkMode,
              onChanged: (value) {
                themeProvider.toggleTheme(); // Toggle theme using provider
              },
              activeColor: isDarkMode
                  ? const Color.fromARGB(255, 0, 255, 127)
                  : const Color.fromARGB(255, 0, 255,
                      127), // Customize active color based on theme
              inactiveThumbColor: isDarkMode
                  ? const Color(0xFF007A5E)
                  : const Color(0xFF007A5E),
            ),
            onTap: themeProvider.toggleTheme,
          ),
        ],
      ),
    );
  }
}
