import 'package:flutter/material.dart';
import 'package:leap/UI/Layout/customappbar.dart';
import 'package:leap/UI/Layout/dark.dart';
import 'package:leap/UI/Layout/light.dart';
import 'package:leap/UI/Layout/themeprovider.dart';
import 'package:leap/UI/Widget/seemore.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
              Tab(text: 'Finalized'),
              Tab(text: 'Pending'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            NotificationList(
              items: [
                {
                  'category': 'Pending',
                  'title': 'UI/UX Designer',
                  'companyName': 'CoinJar',
                  'location': 'Melbourne, Victoria',
                  'avatar': 'assets/icon/coinjar.png',
                  'date': 'Nov 28',
                  'description':
                      'Design and improve the user interface and user experience for CoinJar\'s mobile and web applications.'
                },
                {
                  'category': 'Pending',
                  'title': 'Business Analyst',
                  'companyName': 'DiDi',
                  'location': 'Melbourne, Victoria, Australia',
                  'avatar': 'assets/icon/didi.png',
                  'date': 'Nov 26',
                  'description':
                      'Analyze business needs and provide insights to optimize operations at DiDi.'
                },
                {
                  'category': 'Finalized',
                  'title': 'Software Engineer',
                  'companyName': 'Infosys',
                  'location': 'Melbourne, Victoria, Australia',
                  'avatar': 'assets/icon/infosys.jpg',
                  'date': 'Oct 26',
                  'description':
                      'Develop and maintain software solutions for Infosys\' clients, focusing on quality and efficiency.'
                },
                {
                  'category': 'Finalized',
                  'title': 'IT Helpdesk Guru',
                  'companyName': 'Bayside Group',
                  'location': 'Somerton, Victoria, Australia',
                  'avatar': 'assets/icon/bayside.jpeg',
                  'date': 'Oct 15',
                  'description':
                      'Provide technical support and troubleshooting services for Bayside Group\'s IT systems.'
                },
                {
                  'category': 'News',
                  'title': 'Students Marketeer',
                  'companyName': 'Red Bull',
                  'location': 'South Melbourne, Victoria, ...',
                  'avatar': 'assets/icon/redbull.png',
                  'date': 'Oct 11',
                  'description':
                      'Engage with the local student community to promote Red Bull\'s brand through various marketing activities.'
                },
                {
                  'category': 'Finalized',
                  'title': 'Digital Platforms IBL',
                  'companyName': 'Mercedes-Benz',
                  'location': 'Mulgrave, Victoria, Australia',
                  'avatar': 'assets/icon/merce.jpg',
                  'date': 'Oct 04',
                  'description':
                      'Support digital initiatives and projects for Mercedes-Benz’s platform solutions.'
                },
                {
                  'category': 'Pending',
                  'title': 'IT Project Manager',
                  'companyName': 'Eightfold Institute',
                  'location': 'Carlton, Victoria, Australia',
                  'avatar': 'assets/icon/eightfold.png',
                  'date': 'Sep 20',
                  'description':
                      'Oversee IT projects from planning to completion, ensuring alignment with Eightfold Institute\'s goals.'
                },
              ],
            ),
            NotificationList(
              items: [
                {
                  'category': 'Finalized',
                  'title': 'Software Engineer',
                  'companyName': 'Infosys',
                  'location': 'Melbourne, Victoria, Australia',
                  'avatar': 'assets/icon/infosys.jpg',
                  'date': 'Oct 26',
                  'description':
                      'Work on innovative software solutions that address Infosys’ global business needs.'
                },
                {
                  'category': 'Finalized',
                  'title': 'IT Helpdesk Guru',
                  'companyName': 'Bayside Group',
                  'location': 'Somerton, Victoria, Australia',
                  'avatar': 'assets/icon/bayside.jpeg',
                  'date': 'Oct 15',
                  'description':
                      'Assist end-users with technical issues and maintain the efficiency of Bayside Group\'s IT services.'
                },
                {
                  'category': 'Finalized',
                  'title': 'Digital Platforms IBL',
                  'companyName': 'Mercedes-Benz',
                  'location': 'Mulgrave, Victoria, Australia',
                  'avatar': 'assets/icon/merce.jpg',
                  'date': 'Oct 04',
                  'description':
                      'Assist in developing and managing digital projects for Mercedes-Benz.'
                },
              ],
            ),
            NotificationList(
              items: [
                {
                  'category': 'Pending',
                  'title': 'UI/UX Designer',
                  'companyName': 'CoinJar',
                  'location': 'Melbourne, Victoria',
                  'avatar': 'assets/icon/coinjar.png',
                  'date': 'Nov 28',
                  'description':
                      'Refine and enhance the visual and interactive aspects of CoinJar’s platforms.'
                },
                {
                  'category': 'Pending',
                  'title': 'Business Analyst',
                  'companyName': 'DiDi',
                  'location': 'Melbourne, Victoria, Australia',
                  'avatar': 'assets/icon/didi.png',
                  'date': 'Nov 26',
                  'description':
                      'Evaluate and document DiDi\'s business processes to recommend strategic improvements.'
                },
                {
                  'category': 'Pending',
                  'title': 'IT Project Manager',
                  'companyName': 'Eightfold Institute',
                  'location': 'Carlton, Victoria, Australia',
                  'avatar': 'assets/icon/eightfold.png',
                  'date': 'Sep 20',
                  'description':
                      'Lead IT projects, coordinate teams, and ensure timely project delivery for Eightfold Institute.'
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
          description: item['description'],
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
  final String description;

  const NotificationItem({
    super.key,
    required this.category,
    required this.title,
    required this.companyName,
    required this.location,
    required this.date,
    required this.avatar,
    required this.description,
  });

  @override
  // ignore: library_private_types_in_public_api
  _NotificationItemState createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  bool isThumbsUp = false;

  @override
  void initState() {
    super.initState();
    _loadThumbsUpState();
  }

  Future<void> _loadThumbsUpState() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isThumbsUp = prefs.getBool('${widget.title}_thumbsUp') ?? false;
    });
  }

  Future<void> _toggleThumbsUp() async {
    setState(() {
      isThumbsUp = !isThumbsUp;
    });
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('${widget.title}_thumbsUp', isThumbsUp);
  }

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
                      : const Color(0xFF007A5E).withOpacity(0.7),
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
                  fit: BoxFit.cover,
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
                      ? (themeProvider.isDarkMode
                          ? DarkMode.iconColor
                          : LightMode.iconColor)
                      : themeProvider.isDarkMode
                          ? DarkMode.iconColor
                          : LightMode.iconColor,
                ),
                onPressed: _toggleThumbsUp,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SeeMore(
                title: widget.title,
                subtitle: widget.companyName,
                description: widget.description,
                location: widget.location,
                onApply: () {
                  // Action when Apply is pressed
                },
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
