import 'package:flutter/material.dart';
import 'package:leap/UI/Layout/customappbar.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
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
                    isScrollable: true,
                    tabs: [
                      Tab(text: 'Overview'),
                      Tab(text: 'For You'),
                      Tab(text: 'Technology'),
                      Tab(text: 'Business'),
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
        body: TabBarView(
          children: [
            // Overview Tab Content
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, User',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Theme.of(context).shadowColor.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildDashboardItem(
                                context,
                                title: 'Browsing Time',
                                value: '5h 30m',
                                icon: Icons.timer,
                              ),
                              _buildDashboardItem(
                                context,
                                title: 'Active Time',
                                value: '3h 10m',
                                icon: Icons.flash_on,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildDashboardItem(
                                context,
                                title: 'Results',
                                value: '12',
                                icon: Icons.recommend,
                              ),
                              _buildDashboardItem(
                                context,
                                title: 'Acceptance Rate',
                                value: '85%',
                                icon: Icons.check_circle_outline,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Theme.of(context).shadowColor.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Performance Overview',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 12),
                          Container(
                            height: 150,
                            color: Theme.of(context).cardColor.withOpacity(0.1),
                            child: Center(
                              child: Text(
                                'Chart Placeholder',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Center(child: Text('For You Content')),
            const Center(child: Text('Technology Content')),
            const Center(child: Text('Business Content')),
            const Center(child: Text('Add Content')),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardItem(BuildContext context,
      {required String title, required String value, required IconData icon}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Theme.of(context).iconTheme.color, size: 30),
          const SizedBox(height: 8),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
