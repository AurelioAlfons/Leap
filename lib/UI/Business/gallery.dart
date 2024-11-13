// lib/pages/gallery_page.dart
import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Gallery',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
