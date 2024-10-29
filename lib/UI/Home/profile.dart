import 'package:flutter/material.dart';
import 'package:leap/UI/Layout/customappbar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Custom AppBar with page-specific settings
      appBar: CustomAppBar(
        title: "Profile",
        showSearchButton: false,
        showDropdown: false,
        onMenuPressed: () => Scaffold.of(context).openDrawer(),
        onEndDrawerPressed: () => Scaffold.of(context).openEndDrawer(),
      ),

      body: Center(
        child: Text(
          'Profile Page',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
