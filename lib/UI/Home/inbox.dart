import 'package:flutter/material.dart';
import 'package:leap/UI/Layout/customappbar.dart';
import 'package:leap/UI/Layout/dark.dart';
import 'package:leap/UI/Layout/light.dart';
import 'package:leap/UI/Layout/themeprovider.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomAppBar(
          title: "Inbox",
          showSearchButton: false,
          showDropdown: false,
          onMenuPressed: () => Scaffold.of(context).openDrawer(),
          onEndDrawerPressed: () => Scaffold.of(context).openEndDrawer(),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'Approvals'),
              Tab(text: 'Rejections'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            NotificationList(
              items: [
                {
                  'category': 'Rejection',
                  'title': 'UI/UX Designer',
                  'companyName': 'CoinJar',
                  'location': 'Melbourne, Victoria',
                  'avatar': 'assets/icon/coinjar.png',
                  'date': 'Nov 28'
                },
                {
                  'category': 'Rejection',
                  'title': 'Business Analyst',
                  'companyName': 'DiDi',
                  'location': 'Melbourne, Victoria, Australia',
                  'avatar': 'assets/icon/didi.png',
                  'date': 'Nov 26'
                },
                {
                  'category': 'Approval',
                  'title': 'Software Engineer',
                  'companyName': 'Infosys',
                  'location': 'Melbourne, Victoria, Australia',
                  'avatar': 'assets/icon/infosys.jpg',
                  'date': 'Oct 26'
                },
                {
                  'category': 'Approval',
                  'title': 'IT Helpdesk Guru',
                  'companyName': 'Bayside Group',
                  'location': 'Somerton, Victoria, Australia',
                  'avatar': 'assets/icon/bayside.jpeg',
                  'date': 'Oct 15'
                },
                {
                  'category': 'News',
                  'title': 'Students Marketeer',
                  'companyName': 'Red Bull',
                  'location': 'South Melbourne, Victoria, ...',
                  'avatar': 'assets/icon/redbull.png',
                  'date': 'Oct 11'
                },
                {
                  'category': 'Approval',
                  'title': 'Digital Platforms IBL',
                  'companyName': 'Mercedes-Benz',
                  'location': 'Mulgrave, Victoria, Australia',
                  'avatar': 'assets/icon/merce.jpg',
                  'date': 'Oct 04'
                },
                {
                  'category': 'Rejection',
                  'title': 'IT Project Manager',
                  'companyName': 'Eightfold Institute',
                  'location': 'Carlton, Victoria, Australia',
                  'avatar': 'assets/icon/eightfold.png',
                  'date': 'Sep 20'
                },
              ],
            ),
            NotificationList(
              items: [
                {
                  'category': 'Approval',
                  'title': 'Software Engineer',
                  'companyName': 'Infosys',
                  'location': 'Melbourne, Victoria, Australia',
                  'avatar': 'assets/icon/infosys.jpg',
                  'date': 'Oct 26'
                },
                {
                  'category': 'Approval',
                  'title': 'IT Helpdesk Guru',
                  'companyName': 'Bayside Group',
                  'location': 'Somerton, Victoria, Australia',
                  'avatar': 'assets/icon/bayside.jpeg',
                  'date': 'Oct 15'
                },
                {
                  'category': 'Approval',
                  'title': 'Digital Platforms IBL',
                  'companyName': 'Mercedez-Benz',
                  'location': 'Mulgrave, Victoria, Australia',
                  'avatar': 'assets/icon/merce.jpg',
                  'date': 'Oct 04'
                },
              ],
            ),
            NotificationList(
              items: [
                {
                  'category': 'Rejection',
                  'title': 'UI/UX Designer',
                  'companyName': 'CoinJar',
                  'location': 'Melbourne, Victoria',
                  'avatar': 'assets/icon/coinjar.png',
                  'date': 'Nov 28'
                },
                {
                  'category': 'Rejection',
                  'title': 'Business Analyst',
                  'companyName': 'DiDi',
                  'location': 'Melbourne, Victoria, Austrlia',
                  'avatar': 'assets/icon/didi.png',
                  'date': 'Nov 26'
                },
                {
                  'category': 'Rejection',
                  'title': 'IT Project Manager',
                  'companyName': 'Eightfold Institue',
                  'location': 'Carlton, Victoria, Australia',
                  'avatar': 'assets/icon/eightfold.png',
                  'date': 'Sep 20'
                },
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationList extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  const NotificationList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(bottom: 70),
      itemCount: items.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return const SizedBox(height: 7);
        }

        final item = items[index - 1];

        return NotificationItem(
          category: item['category'],
          title: item['title'],
          companyName: item['companyName'],
          location: item['location'],
          avatar: item['avatar'],
          date: item['date'],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 12),
    );
  }
}

class NotificationItem extends StatefulWidget {
  final String category;
  final String title;
  final String companyName;
  final String location;
  final String date;
  final String avatar;

  const NotificationItem({
    super.key,
    required this.category,
    required this.title,
    required this.companyName,
    required this.location,
    required this.date,
    required this.avatar,
  });

  @override
  // ignore: library_private_types_in_public_api
  _NotificationItemState createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  bool isThumbsUp = false;

  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeProvider.of(context);

    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: themeProvider.isDarkMode
                      ? const Color.fromARGB(255, 0, 255, 127).withOpacity(0.7)
                      : const Color(0xFF007A5E)
                          .withOpacity(0.7), // Example color
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  widget.category,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            widget.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              ClipOval(
                child: Image.asset(
                  widget.avatar,
                  width: 45,
                  height: 45,
                  fit: BoxFit
                      .cover, // Ensures the image covers the space without distortion
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.companyName,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    widget.location,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                icon: Icon(
                  isThumbsUp ? Icons.thumb_up_alt : Icons.thumb_up_alt_outlined,
                  color: isThumbsUp
                      ? const Color.fromARGB(255, 0, 255, 127)
                      : themeProvider.isDarkMode
                          ? DarkMode.iconColor
                          : LightMode.iconColor,
                ),
                onPressed: () {
                  setState(() {
                    isThumbsUp = !isThumbsUp;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'See more',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Text(
                widget.date,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
