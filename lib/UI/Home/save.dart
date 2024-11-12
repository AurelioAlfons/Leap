import 'package:flutter/material.dart';
import 'package:leap/UI/Layout/customappbar.dart';
import 'package:leap/UI/Widget/post.dart';
import 'package:leap/UI/Widget/saveitem.dart'; // Import InternshipPost model

class SavePage extends StatelessWidget {
  const SavePage({super.key});

  @override
  Widget build(BuildContext context) {
    final internshipPosts = [
      InternshipPost(
        companyName: 'Mercedes-Benz',
        location: 'Mulgrave, Victoria, Australia',
        companyLogo: const AssetImage('assets/icon/merce.jpg'),
        media: Image.network(
          'https://www.freshersnow.com/wp-content/uploads/2023/01/Mercedes-Benz-Internship.webp',
        ),
        positionName: 'Digital Platforms IBL',
        date: 'Oct 04, 2024',
        description:
            'An exciting role focusing on digital transformation and innovation.',
        salary: '\$25/hour',
        keySkills: const [
          'Digital Marketing',
          'Project Management',
          'Analytics'
        ],
        onApply: () {
          // Handle apply action for Mercedes-Benz
        },
        link: '',
      ),
      InternshipPost(
        companyName: 'Infosys',
        location: 'Melbourne, Victoria, Australia',
        companyLogo: const AssetImage('assets/icon/infosys.jpg'),
        media: Image.network(
          'https://media.licdn.com/dms/image/v2/D5612AQEaBJTzRut4-Q/article-cover_image-shrink_720_1280/article-cover_image-shrink_720_1280/0/1727954905119?e=2147483647&v=beta&t=d8p6si3TGJ-XwjSkI_gJeDe_wDytNvwGiXAFfFobzW8',
        ),
        positionName: 'Software Engineer',
        date: 'Oct 15, 2024',
        description:
            'A great opportunity to work with cutting-edge technology.',
        salary: '\$35/hour',
        keySkills: const ['Java', 'Spring Boot', 'REST APIs'],
        onApply: () {
          // Handle apply action for Infosys
        },
        link: '',
      ),
      InternshipPost(
        companyName: 'Eightfold Institute',
        location: 'Carlton, Victoria, Australia',
        companyLogo: const AssetImage('assets/icon/eightfold.png'),
        media: Image.network(
          'https://media.licdn.com/dms/image/v2/C4E1BAQFKbKLfBEMcvA/company-background_10000/company-background_10000/0/1584195149112/eightfoldinstituteofaustralia_cover?e=2147483647&v=beta&t=RGuE3y7znGvxrBQapfXJ3SPB_QnzZteG76HFBLDven0',
        ),
        positionName: 'IT Project Manager',
        date: 'Sep 20, 2024',
        description:
            'A great opportunity to work with cutting-edge technology.',
        salary: '\$32/hour',
        keySkills: const [
          'Project Management',
          'Agile',
          'Stakeholder Communication'
        ],
        onApply: () {
          // Handle apply action for Eightfold Institute
        },
        link: '',
      ),
    ];

    return Scaffold(
      appBar: CustomAppBar(
        title: "Bookmark",
        showSearchButton: false,
        showDropdown: false,
        onMenuPressed: () => Scaffold.of(context).openDrawer(),
        onEndDrawerPressed: () => Scaffold.of(context).openEndDrawer(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: internshipPosts
                .map((post) => SimplifiedInternshipPost(internship: post))
                .toList(),
          ),
        ),
      ),
    );
  }
}
