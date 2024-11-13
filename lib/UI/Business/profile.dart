// lib/pages/profile_page.dart
import 'package:flutter/material.dart';

class BusinessProfilePage extends StatelessWidget {
  const BusinessProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Profile',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
