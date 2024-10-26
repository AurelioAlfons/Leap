import 'package:flutter/material.dart';

class SavePage extends StatelessWidget {
  const SavePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Save',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
