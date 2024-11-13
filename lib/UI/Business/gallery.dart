// lib/pages/gallery_page.dart
import 'package:flutter/material.dart';
import 'package:leap/UI/Widget/businesspost.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: BusinessPost(
            companyName: 'Mercedes-Benz',
            location: 'Mulgrave, Victoria, Australia',
            companyLogo: const AssetImage('assets/icon/merce.jpg'),
            media: Image.network(
              'https://www.freshersnow.com/wp-content/uploads/2023/01/Mercedes-Benz-Internship.webp',
              fit: BoxFit.cover,
            ),
            positionName: 'Digital Platforms IBL',
            description:
                'An exciting role focusing on digital transformation and innovation.',
            keySkills: const [
              'Digital Marketing',
              'Project Management',
              'Analytics'
            ],
            onEdit: () {
              // Handle edit action for Mercedes-Benz
            },
            initialMatchExperience: true,
            date: 'Oct 04, 2024',
            salary: '\$25/hour',
            link: 'https://www.mercedes-benz.com/',
          ),
        ),
      ),
    );
  }
}
