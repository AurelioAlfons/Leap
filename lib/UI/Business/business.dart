import 'package:flutter/material.dart';
import 'package:leap/UI/Layout/dark.dart';
import 'package:leap/UI/Layout/light.dart';
import 'package:leap/UI/Layout/themeprovider.dart';

class BusinessPage extends StatefulWidget {
  const BusinessPage({super.key});

  @override
  State<BusinessPage> createState() => _BusinessPageState();
}

class _BusinessPageState extends State<BusinessPage> {
  int _currentIndex = 0;

  // Define the pages for each bottom navigation item
  final List<Widget> _pages = [
    const GalleryPage(),
    const CreatePostPage(),
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
      appBar: AppBar(
        title: const Text('Business App'),
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
      drawer: _buildLeftDrawer(themeProvider),
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

  // Left drawer for navigation
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
}

// Placeholder for Gallery Page
class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Gallery',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}

// Create Post Page (Reddit-style posting feature)
class CreatePostPage extends StatelessWidget {
  const CreatePostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Create a Post',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16.0),

          // Title TextField
          TextField(
            decoration: InputDecoration(
              labelText: 'Title',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          const SizedBox(height: 16.0),

          // Content TextField
          TextField(
            decoration: InputDecoration(
              labelText: 'Content',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            maxLines: 6,
          ),
          const SizedBox(height: 16.0),

          // Image Upload Button
          OutlinedButton.icon(
            onPressed: () {
              // Add logic to select an image
            },
            icon: const Icon(Icons.image),
            label: const Text('Add Image'),
          ),
          const SizedBox(height: 16.0),

          // Submit Button
          ElevatedButton(
            onPressed: () {
              // Add logic to post the content
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Center(
              child: Text(
                'Post',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Placeholder for Profile Page
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Profile',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
