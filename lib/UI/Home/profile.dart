import 'package:flutter/material.dart';
import 'package:leap/UI/Widget/editprofile.dart';
import 'package:leap/UI/Widget/profilemodel.dart';
import 'package:provider/provider.dart';
import 'package:leap/UI/Layout/customappbar.dart';
import 'package:leap/UI/Layout/dark.dart';
import 'package:leap/UI/Layout/light.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Select colors based on current theme (dark or light)
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isDarkMode ? DarkMode.cardColor : LightMode.cardColor;
    final iconColor = isDarkMode ? DarkMode.iconColor : LightMode.iconColor;
    final buttonBackgroundColor = isDarkMode
        ? DarkMode.buttonBackgroundColor
        : LightMode.buttonBackgroundColor;
    final buttonTextColor =
        isDarkMode ? DarkMode.buttonTextColor : LightMode.buttonTextColor;
    final outerAvatarColor =
        isDarkMode ? DarkMode.outerAvatarColor : LightMode.outerAvatarColor;

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
            // Full-Width Banner with Avatar
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
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
                // Profile Avatar positioned below the banner
                Positioned(
                  top: screenHeight * 0.18,
                  child: CircleAvatar(
                    radius: screenWidth * 0.15,
                    backgroundColor: outerAvatarColor,
                    child: CircleAvatar(
                      radius: screenWidth * 0.14,
                      backgroundImage:
                          const AssetImage('assets/icon/terno.png'),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.10),

            // Edit Profile Button
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfile()),
                  );
                },
                icon: Icon(
                  Icons.edit,
                  color: buttonTextColor,
                  size: screenWidth * 0.05,
                ),
                label: Text(
                  "Edit Profile",
                  style: TextStyle(
                    color: buttonTextColor,
                    fontSize: screenWidth * 0.04,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.05),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.08,
                    vertical: screenHeight * 0.015,
                  ),
                  backgroundColor: buttonBackgroundColor,
                  elevation: 4,
                ),
              ),
            ),

            // Name and Profile Description Section with Divider
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.02),

                  // Display dynamic name and title
                  Consumer<ProfileModel>(
                    builder: (context, profile, child) {
                      return Column(
                        children: [
                          Text(
                            profile.name,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  fontSize: screenWidth * 0.06,
                                ),
                          ),
                          SizedBox(height: screenHeight * 0.005),
                          Text(
                            profile.title,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      );
                    },
                  ),

                  SizedBox(height: screenHeight * 0.02),
                  Divider(thickness: 1, color: Theme.of(context).dividerColor),
                  SizedBox(height: screenHeight * 0.02),

                  // Key Skills Section
                  Text(
                    'Key Skills',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontSize: screenWidth * 0.05),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  Consumer<ProfileModel>(
                    builder: (context, profile, child) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: profile.keySkills.map((skill) {
                            return _buildSkillCard(
                              skill,
                              iconColor,
                              Icons.check_circle,
                              context,
                            );
                          }).toList(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Divider(thickness: 1, color: Theme.of(context).dividerColor),
                  SizedBox(height: screenHeight * 0.025),

                  // Additional Profile Information
                  _buildSectionTitle('Resume PDF', context, screenWidth),
                  Card(
                    color: cardColor,
                    child: ListTile(
                      leading:
                          const Icon(Icons.picture_as_pdf, color: Colors.red),
                      title: const Text('Download Resume'),
                      subtitle: const Text('Updated October 2024'),
                      trailing: IconButton(
                        icon: const Icon(Icons.download),
                        onPressed: () {
                          // Add PDF download logic here
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.025),

                  // Studies Section
                  _buildSectionTitle('Studies', context, screenWidth),
                  Consumer<ProfileModel>(
                    builder: (context, profile, child) {
                      return Column(
                        children: profile.studies.split('\n').map((study) {
                          return Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.check_circle,
                                    size: screenWidth * 0.06),
                                title: Text(
                                  study.split(',')[0].trim(),
                                  style: TextStyle(
                                      fontSize: screenWidth * 0.04,
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                subtitle: Text(
                                  study.split(',').sublist(1).join(', ').trim(),
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.color
                                          ?.withOpacity(0.6),
                                      fontSize: screenWidth * 0.035),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                              const Divider(
                                  height: 1,
                                  thickness: 1), // Divider between each entry
                            ],
                          );
                        }).toList(),
                      );
                    },
                  ),
                  SizedBox(height: screenHeight * 0.025),

                  // Certificates Section
                  _buildSectionTitle('Certificates', context, screenWidth),
                  Consumer<ProfileModel>(
                    builder: (context, profile, child) {
                      return Column(
                        children:
                            profile.certificates.split('\n').map((certificate) {
                          return Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.check_circle,
                                    size: screenWidth * 0.06),
                                title: Text(
                                  certificate.split(',')[0].trim(),
                                  style: TextStyle(
                                      fontSize: screenWidth * 0.04,
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                subtitle: Text(
                                  certificate
                                      .split(',')
                                      .sublist(1)
                                      .join(', ')
                                      .trim(),
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.color
                                          ?.withOpacity(0.6),
                                      fontSize: screenWidth * 0.035),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                              const Divider(
                                  height: 1,
                                  thickness: 1), // Divider between each entry
                            ],
                          );
                        }).toList(),
                      );
                    },
                  ),
                  SizedBox(height: screenHeight * 0.025),
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
    final screenWidth = MediaQuery.of(context).size.width;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isDarkMode ? DarkMode.cardColor : LightMode.cardColor;

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
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(
      String title, BuildContext context, double screenWidth) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontSize: screenWidth * 0.045, fontWeight: FontWeight.bold),
    );
  }
}
