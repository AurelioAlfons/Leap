import 'package:flutter/material.dart';
import 'package:leap/UI/Layout/customappbar.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Custom AppBar with page-specific settings
      appBar: CustomAppBar(
        title: "Dashboard",
        showSearchButton: false,
        showDropdown: false,
        onMenuPressed: () => Scaffold.of(context).openDrawer(),
        onEndDrawerPressed: () => Scaffold.of(context).openEndDrawer(),
      ),

      body: Center(
        child: Text(
          'Dashboard Page',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
