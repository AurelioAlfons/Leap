import 'package:flutter/material.dart';
import 'package:leap/UI/Layout/customappbar.dart';
import 'package:leap/UI/Layout/themeprovider.dart';
import 'package:leap/UI/Layout/dark.dart';
import 'package:leap/UI/Layout/light.dart';
import 'package:leap/UI/Widget/ad.dart';
import 'package:leap/UI/Widget/bottomsheet.dart';
import 'package:leap/UI/Widget/post.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      isDarkMode: isDarkMode,
      toggleTheme: toggleTheme,
      child: Builder(
        builder: (context) {
          final themeProvider = ThemeProvider.of(context);
          return MaterialApp(
            title: 'Terno',
            theme: LightMode.lightTheme,
            darkTheme: DarkMode.darkTheme,
            themeMode:
                themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> _reloadData() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    final posts = [
      InternshipPost(
        companyName: 'Mercedes-Benz',
        location: 'Mulgrave, Victoria, Australia',
        companyLogo: const AssetImage('assets/icon/merce.jpg'),
        media: Image.network(
          'https://www.freshersnow.com/wp-content/uploads/2023/01/Mercedes-Benz-Internship.webp',
        ),
        positionName: 'Digital Platforms IBL',
        description:
            'An exciting role focusing on digital transformation and innovation.',
        keySkills: const [
          'Digital Marketing',
          'Project Management',
          'Analytics'
        ],
        onApply: () {},
        initialMatchExperience: true,
        date: 'Oct 04, 2024',
        salary: '\$25/hour',
        link: 'https://www.mercedes-benz.com/',
      ),
      AdvertisementWidget(
        companyName: 'Victoria University',
        location: 'Melbourne, Victoria, Australia',
        companyLogo: const NetworkImage(
            'https://www.studiosity.com/hubfs/Studiosity/Logos/Partner%20Logos/University%20Logos/Mono-400x400px/Victoria-University-Logo-400×400px.png'),
        media: Image.network(
          'https://i.ytimg.com/vi/bmflRVyfV_8/maxresdefault.jpg',
          fit: BoxFit.cover,
        ),
        headline: 'Join VU Course in Business Management',
        description:
            'Be a part of an innovative and industry-leading program that prepares you for success in the business world.',
        link: 'https://www.vicuni.edu.au/',
        onLearnMore: () {},
      ),
      InternshipPost(
        companyName: 'CoinJar',
        location: 'Melbourne, Victoria',
        companyLogo: const AssetImage('assets/icon/coinjar.png'),
        media: Image.network(
          'https://www.marketswiki.com/wiki/images/8/87/CoinJarpic.png',
        ),
        positionName: 'UI/UX Designer',
        description:
            'A great opportunity to work with cutting-edge technology.',
        keySkills: const ['UI Design', 'Prototyping', 'Figma'],
        onApply: () {
          // Handle apply action for CoinJar
        },
        initialMatchExperience: false,
        date: 'Nov 26, 2024',
        salary: '\$29/hour', // Example salary
        link: 'https://www.mercedes-benz.com/', // Example link
      ),
      InternshipPost(
        companyName: 'DiDi',
        location: 'Melbourne, Victoria, Australia',
        companyLogo: const AssetImage('assets/icon/didi.png'),
        media: Image.network(
          'https://pbs.twimg.com/media/EBMDf-OUYAAmchl.jpg:large',
        ),
        positionName: 'Business Analyst',
        description:
            'A great opportunity to work with cutting-edge technology.',
        keySkills: const ['Data Analysis', 'Business Intelligence', 'SQL'],
        onApply: () {
          // Handle apply action for DiDi
        },
        initialMatchExperience: true,
        date: 'Oct 26, 2024', // Added date
        salary: '\$24/hour', // Example salary
        link: 'https://www.mercedes-benz.com/', // Example link
      ),
      InternshipPost(
        companyName: 'Infosys',
        location: 'Melbourne, Victoria, Australia',
        companyLogo: const AssetImage('assets/icon/infosys.jpg'),
        media: Image.network(
          'https://media.licdn.com/dms/image/v2/D5612AQEaBJTzRut4-Q/article-cover_image-shrink_720_1280/article-cover_image-shrink_720_1280/0/1727954905119?e=2147483647&v=beta&t=d8p6si3TGJ-XwjSkI_gJeDe_wDytNvwGiXAFfFobzW8',
        ),
        positionName: 'Software Engineer',
        description:
            'A great opportunity to work with cutting-edge technology.',
        keySkills: const ['Java', 'Spring Boot', 'REST APIs'],
        onApply: () {
          // Handle apply action for Infosys
        },
        initialMatchExperience: false,
        date: 'Oct 15, 2024', // Added date
        salary: '\$35/hour', // Example salary
        link: 'https://www.mercedes-benz.com/', // Example link
      ),
      InternshipPost(
        companyName: 'Eightfold Institute',
        location: 'Carlton, Victoria, Australia',
        companyLogo: const AssetImage('assets/icon/eightfold.png'),
        media: Image.network(
          'https://media.licdn.com/dms/image/v2/C4E1BAQFKbKLfBEMcvA/company-background_10000/company-background_10000/0/1584195149112/eightfoldinstituteofaustralia_cover?e=2147483647&v=beta&t=RGuE3y7znGvxrBQapfXJ3SPB_QnzZteG76HFBLDven0',
        ),
        positionName: 'IT Project Manager',
        description:
            'A great opportunity to work with cutting-edge technology.',
        keySkills: const [
          'Project Management',
          'Agile',
          'Stakeholder Communication'
        ],
        onApply: () {
          // Handle apply action for Eightfold Institute
        },
        initialMatchExperience: true,
        date: 'Sep 20, 2024', // Added date
        salary: '\$32/hour', // Example salary
        link: 'https://www.mercedes-benz.com/', // Example link
      ),
    ];

    return Scaffold(
      appBar: CustomAppBar(
        title: "Home",
        showSearchButton: true,
        showDropdown: true,
        onMenuPressed: () => Scaffold.of(context).openDrawer(),
        onEndDrawerPressed: () => Scaffold.of(context).openEndDrawer(),
      ),
      body: RefreshIndicator(
        onRefresh: _reloadData,
        child: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];

            // Render the appropriate widget based on post type
            if (post is InternshipPost) {
              return GestureDetector(
                onTap: () => showReusableBottomSheet(
                  context: context,
                  title: post.positionName,
                  subtitle: post.companyName,
                  description: post.description,
                  location: post.location,
                  salary: post.salary,
                  skills: post.keySkills,
                  onApply: post.onApply,
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: post,
                ),
              );
            } else if (post is AdvertisementWidget) {
              return GestureDetector(
                onTap: post.onLearnMore,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: post,
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
