import 'package:flutter/material.dart';
import 'package:leap/UI/Layout/customappbar.dart';
import 'package:leap/UI/Layout/dark.dart';
import 'package:leap/UI/Layout/light.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  height: MediaQuery.of(context).size.height *
                      0.2, // 30% of screen height
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/image/bg.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Profile Picture and Edit Profile Button
                Positioned(
                  bottom: -80, // Adjust to overlap lipping
                  child: Column(
                    children: [
                      // Profile Picture
                      CircleAvatar(
                        radius: 50,
                        backgroundColor:
                            Theme.of(context).brightness == Brightness.dark
                                ? DarkMode.outerAvatarColor
                                : LightMode.outerAvatarColor,
                        child: const CircleAvatar(
                          radius: 46,
                          backgroundImage: AssetImage('assets/icon/terno.png'),
                        ),
                      ),
                      const SizedBox(height: 8),
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
                          size: 20,
                        ),
                        label: Text(
                          "Edit Profile",
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: textColor,
                                    fontSize: 16,
                                  ),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(20), // Rounded edges
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          elevation: 4, // Adds a shadow for a raised effect
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 100),

            // Key Skills Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Key Skills',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: textColor),
                  ),
                  const SizedBox(height: 10),
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
                  const SizedBox(height: 20),
                  // Additional Profile Information
                  _buildSectionTitle('Resume PDF', textColor, context),
                  Card(
                    color: cardColor,
                    child: ListTile(
                      leading:
                          const Icon(Icons.picture_as_pdf, color: Colors.red),
                      title: Text('Download Resume',
                          style: TextStyle(color: textColor)),
                      subtitle: Text('Updated October 2024',
                          style: TextStyle(color: textColor.withOpacity(0.6))),
                      trailing: IconButton(
                        icon: const Icon(Icons.download),
                        onPressed: () {
                          // Add PDF download logic here
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildSectionTitle('Studies', textColor, context),
                  _buildListTile(
                    title: 'Bachelor of Science in Computer Science',
                    subtitle: 'University of Technology, 2021-2024',
                    textColor: textColor,
                    context: context,
                  ),
                  _buildListTile(
                    title: 'Mobile Application Development',
                    subtitle: 'Online Course, 2022',
                    textColor: textColor,
                    context: context,
                  ),
                  const SizedBox(height: 20),
                  _buildSectionTitle('Certificates', textColor, context),
                  _buildListTile(
                    title: 'Google Flutter Certificate',
                    subtitle: 'Earned June 2023',
                    textColor: textColor,
                    context: context,
                  ),
                  _buildListTile(
                    title: 'AWS Cloud Practitioner',
                    subtitle: 'Earned August 2023',
                    textColor: textColor,
                    context: context,
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

    return Card(
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: iconColor),
            const SizedBox(width: 8),
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
      String title, Color textColor, BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: textColor),
    );
  }

  Widget _buildListTile({
    required String title,
    required String subtitle,
    required Color textColor,
    required BuildContext context,
  }) {
    return ListTile(
      leading: const Icon(Icons.check_circle),
      title: Text(title, style: TextStyle(color: textColor)),
      subtitle:
          Text(subtitle, style: TextStyle(color: textColor.withOpacity(0.6))),
    );
  }
}
