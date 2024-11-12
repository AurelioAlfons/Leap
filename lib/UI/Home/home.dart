import 'package:flutter/material.dart';
import 'package:leap/UI/Layout/customappbar.dart';
import 'package:leap/UI/Layout/themeprovider.dart';
import 'package:leap/UI/Layout/dark.dart';
import 'package:leap/UI/Layout/light.dart';
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

  @override
  Widget build(BuildContext context) {
    final posts = [
      InternshipPost(
        companyName: 'Mercedes-Benz',
        location: 'Mulgrave, Victoria, Australia',
        companyLogo: const AssetImage('assets/icon/merce.jpg'),
        media: Image.network(
          'https://i0.wp.com/opportunitiesforyouth.org/wp-content/uploads/2024/09/Screenshot-2024-09-26-002030.png?resize=1278%2C640&ssl=1',
        ),
        positionName: 'Digital Platforms IBL',
        description:
            'An exciting role focusing on digital transformation and innovation.',
        keySkills: const [
          'Digital Marketing',
          'Project Management',
          'Analytics'
        ],
        onApply: () {
          // Handle apply action for Mercedes-Benz
        },
        initialMatchExperience: true,
        date: 'Oct 04, 2024',
        salary: '\$20/hour',
        link: 'https://www.mercedes-benz.com/',
      ),
      InternshipPost(
        companyName: 'CoinJar',
        location: 'Melbourne, Victoria',
        companyLogo: const AssetImage('assets/icon/coinjar.png'),
        media: Image.network(
          'https://i0.wp.com/opportunitiesforyouth.org/wp-content/uploads/2024/09/Screenshot-2024-09-26-002030.png?resize=1278%2C640&ssl=1',
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
        salary: '\$20/hour', // Example salary
        link: 'https://www.mercedes-benz.com/', // Example link
      ),
      InternshipPost(
        companyName: 'DiDi',
        location: 'Melbourne, Victoria, Australia',
        companyLogo: const AssetImage('assets/icon/didi.png'),
        media: Image.network(
          'https://i0.wp.com/opportunitiesforyouth.org/wp-content/uploads/2024/09/Screenshot-2024-09-26-002030.png?resize=1278%2C640&ssl=1',
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
        salary: '\$20/hour', // Example salary
        link: 'https://www.mercedes-benz.com/', // Example link
      ),
      InternshipPost(
        companyName: 'Infosys',
        location: 'Melbourne, Victoria, Australia',
        companyLogo: const AssetImage('assets/icon/infosys.jpg'),
        media: Image.network(
          'https://i0.wp.com/opportunitiesforyouth.org/wp-content/uploads/2024/09/Screenshot-2024-09-26-002030.png?resize=1278%2C640&ssl=1',
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
        salary: '\$20/hour', // Example salary
        link: 'https://www.mercedes-benz.com/', // Example link
      ),
      InternshipPost(
        companyName: 'Eightfold Institute',
        location: 'Carlton, Victoria, Australia',
        companyLogo: const AssetImage('assets/icon/eightfold.png'),
        media: Image.network(
          'https://i0.wp.com/opportunitiesforyouth.org/wp-content/uploads/2024/09/Screenshot-2024-09-26-002030.png?resize=1278%2C640&ssl=1',
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
        salary: '\$20/hour', // Example salary
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
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
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
        },
      ),
    );
  }
}
