import 'package:flutter/material.dart';
import 'package:leap/UI/Layout/customappbar.dart';
import 'package:leap/UI/Layout/dark.dart';
import 'package:leap/UI/Layout/light.dart';
import 'package:leap/UI/Layout/themeprovider.dart';
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
            title: 'Terna',
            theme: LightMode.lightTheme, // Use LightMode theme
            darkTheme: DarkMode.darkTheme, // Use DarkMode theme
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
    return Scaffold(
      appBar: CustomAppBar(
        title: "Home",
        showSearchButton: true,
        showDropdown: true,
        onMenuPressed: () => Scaffold.of(context).openDrawer(),
        onEndDrawerPressed: () => Scaffold.of(context).openEndDrawer(),
      ),
      body: Column(
        children: [
          InternshipPost(
            companyName: 'TechCorp',
            location: 'San Francisco, CA',
            companyLogo: const AssetImage('assets/icon/terno.png'),
            media: Image.network(
                'https://i0.wp.com/opportunitiesforyouth.org/wp-content/uploads/2024/09/Screenshot-2024-09-26-002030.png?resize=1278%2C640&ssl=1'),
            positionName: 'Software Engineering Internship',
            keySkills: const ['Flutter', 'Dart', 'API Integration'],
            onApply: () {
              // Handle apply action
            },
            initialMatchExperience: true,
          )
        ],
      ),
    );
  }
}
