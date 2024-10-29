import 'package:flutter/material.dart';
import 'package:leap/UI/Layout/customappbar.dart';

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
      body: Center(
        child: Text(
          'Home Page',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
