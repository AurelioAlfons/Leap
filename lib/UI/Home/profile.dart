import 'package:flutter/material.dart';
import 'package:leap/UI/Layout/customappbar.dart';
import 'package:leap/UI/Layout/dark.dart';
import 'package:leap/UI/Layout/light.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final Color textColor =
        Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black;
    final Color cardColor = Theme.of(context).cardColor;
    final Color iconColor = Theme.of(context).iconTheme.color ?? Colors.black;

    return Scaffold(
      appBar: CustomAppBar(
        title: "Profile",
        showSearchButton: false,
        showDropdown: false,
        onMenuPressed: () => Scaffold.of(context).openDrawer(),
        onEndDrawerPressed: () => Scaffold.of(context).openEndDrawer(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Full-Width Banner with Profile Information
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                // Banner Image
                Container(
                  width: double.infinity,
                  height: screenHeight * 0.25,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/image/bg.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Profile Picture and Edit Profile Button
                Positioned(
                  bottom: -screenHeight * 0.1,
                  child: Column(
                    children: [
                      // Profile Picture
                      CircleAvatar(
                        radius: screenWidth * 0.15,
                        backgroundColor:
                            Theme.of(context).brightness == Brightness.dark
                                ? DarkMode.outerAvatarColor
                                : LightMode.outerAvatarColor,
                        child: CircleAvatar(
                          radius: screenWidth * 0.14,
                          backgroundImage:
                              const AssetImage('assets/icon/terno.png'),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      // Edit Profile Button
                      ElevatedButton.icon(
                        onPressed: () {
                          // Edit Profile Logic
                        },
                        icon: Icon(
                          Icons.edit,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? DarkMode.buttonTextColor
                              : LightMode.buttonTextColor,
                          size: screenWidth * 0.05,
                        ),
                        label: Text(
                          "Edit Profile",
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: textColor,
                                    fontSize: screenWidth * 0.04,
                                  ),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(screenWidth * 0.05),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.08,
                              vertical: screenHeight * 0.015),
                          elevation: 4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.12),

            // Key Skills Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Key Skills',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: textColor, fontSize: screenWidth * 0.05),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildSkillCard(
                            'Flutter', iconColor, Icons.flutter_dash, context),
                        _buildSkillCard('Dart', iconColor, Icons.code, context),
                        _buildSkillCard(
                            'Firebase', iconColor, Icons.cloud, context),
                        _buildSkillCard('UI/UX Design', iconColor,
                            Icons.design_services, context),
                        _buildSkillCard('Project Management', iconColor,
                            Icons.work, context),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.025),
                  // Additional Profile Information
                  _buildSectionTitle(
                      'Resume PDF', textColor, context, screenWidth),
                  Card(
                    color: cardColor,
                    child: ListTile(
                      leading:
                          const Icon(Icons.picture_as_pdf, color: Colors.red),
                      title: Text('Download Resume',
                          style: TextStyle(
                              color: textColor, fontSize: screenWidth * 0.04)),
                      subtitle: Text('Updated October 2024',
                          style: TextStyle(
                              color: textColor.withOpacity(0.6),
                              fontSize: screenWidth * 0.035)),
                      trailing: IconButton(
                        icon: const Icon(Icons.download),
                        onPressed: () {
                          // Add PDF download logic here
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.025),
                  _buildSectionTitle(
                      'Studies', textColor, context, screenWidth),
                  _buildListTile(
                    title: 'Bachelor of Science in Computer Science',
                    subtitle: 'University of Technology, 2021-2024',
                    textColor: textColor,
                    screenWidth: screenWidth,
                  ),
                  _buildListTile(
                    title: 'Mobile Application Development',
                    subtitle: 'Online Course, 2022',
                    textColor: textColor,
                    screenWidth: screenWidth,
                  ),
                  SizedBox(height: screenHeight * 0.025),
                  _buildSectionTitle(
                      'Certificates', textColor, context, screenWidth),
                  _buildListTile(
                    title: 'Google Flutter Certificate',
                    subtitle: 'Earned June 2023',
                    textColor: textColor,
                    screenWidth: screenWidth,
                  ),
                  _buildListTile(
                    title: 'AWS Cloud Practitioner',
                    subtitle: 'Earned August 2023',
                    textColor: textColor,
                    screenWidth: screenWidth,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillCard(
      String skill, Color iconColor, IconData icon, BuildContext context) {
    final Color cardColor = Theme.of(context).cardColor;
    final Color textColor =
        Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black;
    final screenWidth = MediaQuery.of(context).size.width;

    return Card(
      color: cardColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: screenWidth * 0.02, horizontal: screenWidth * 0.04),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: iconColor, size: screenWidth * 0.06),
            SizedBox(width: screenWidth * 0.02),
            Text(
              skill,
              style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(
      String title, Color textColor, BuildContext context, double screenWidth) {
    return Text(
      title,
      style: TextStyle(
          fontSize: screenWidth * 0.045,
          fontWeight: FontWeight.bold,
          color: textColor),
    );
  }

  Widget _buildListTile({
    required String title,
    required String subtitle,
    required Color textColor,
    required double screenWidth,
  }) {
    return ListTile(
      leading: Icon(Icons.check_circle, size: screenWidth * 0.06),
      title: Text(
        title,
        style: TextStyle(color: textColor, fontSize: screenWidth * 0.04),
        overflow: TextOverflow.ellipsis, // Ensures text doesn't overflow
        maxLines: 1, // Limits text to one line
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
            color: textColor.withOpacity(0.6), fontSize: screenWidth * 0.035),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}
