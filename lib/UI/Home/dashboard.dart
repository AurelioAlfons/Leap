import 'package:flutter/material.dart';
import 'package:leap/UI/Layout/customappbar.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        // Custom AppBar with page-specific settings
        appBar: CustomAppBar(
          title: "Dashboard",
          showSearchButton: false,
          showDropdown: false,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(48.0),
            child: Row(
              children: [
                Expanded(
                  child: TabBar(
                    isScrollable: true, // Allows horizontal scrolling
                    tabs: [
                      Tab(text: 'For You'),
                      Tab(text: 'Technology'),
                      Tab(text: 'Business'),
                      Tab(text: 'Graphic Design'),
                      Tab(text: 'Add +'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          onMenuPressed: () => Scaffold.of(context).openDrawer(),
          onEndDrawerPressed: () => Scaffold.of(context).openEndDrawer(),
        ),

        body: const TabBarView(
          children: [
            Center(child: Text('For You Content')),
            Center(child: Text('Technology Content')),
            Center(child: Text('Technology Content')),
            Center(child: Text('Technology Content')),
            Center(child: Text('Add Content')),
          ],
        ),
      ),
    );
  }
}
