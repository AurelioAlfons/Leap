// lib/pages/business_profile_page.dart
import 'package:flutter/material.dart';
import 'package:leap/UI/Layout/dark.dart';
import 'package:leap/UI/Layout/light.dart';
import 'package:leap/UI/Layout/themeprovider.dart';

class BusinessProfilePage extends StatelessWidget {
  const BusinessProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeProvider.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textColor = themeProvider.isDarkMode ? Colors.white : Colors.black;
    final iconColor =
        themeProvider.isDarkMode ? DarkMode.iconColor : LightMode.iconColor;

    return Scaffold(
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
                      image: NetworkImage(
                        'https://di-uploads-pod7.s3.amazonaws.com/mercedesbenzwinnipeg/uploads/2016/08/Mercedes-Benz-Winnipeg-Staff.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Profile Picture and Edit Profile Button
                Positioned(
                  bottom: -screenHeight * 0.1,
                  child: Column(
                    children: [
                      // Outer Container to create space effect
                      Container(
                        padding: const EdgeInsets.all(
                            4.0), // Adjust the padding to control gap width
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: themeProvider.isDarkMode
                              ? DarkMode.outerAvatarColor
                              : LightMode.outerAvatarColor,
                        ),
                        child: CircleAvatar(
                          radius: screenWidth * 0.15,
                          backgroundColor: Colors.transparent,
                          child: CircleAvatar(
                            radius: screenWidth * 0.14,
                            backgroundImage:
                                const AssetImage('assets/icon/terno.png'),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      ElevatedButton.icon(
                        onPressed: () {
                          // Edit Profile Logic
                        },
                        icon: Icon(
                          Icons.edit,
                          color: Theme.of(context).iconTheme.color,
                          size: screenWidth * 0.05,
                        ),
                        label: Text(
                          "Edit Profile",
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.color,
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
                            vertical: screenHeight * 0.015,
                          ),
                          backgroundColor: Theme.of(context)
                              .buttonTheme
                              .colorScheme
                              ?.surface,
                          elevation: 4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.15), // Adjust spacing for overlap

            // Name and Profile Description Section with Divider
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Company Name and Location
                  Center(
                    child: Column(
                      children: [
                        Text(
                          "Mercedes-Benz",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                color: textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth * 0.06,
                              ),
                        ),
                        SizedBox(height: screenHeight * 0.005),
                        Text(
                          "Mulgrave, Victoria, Australia",
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: textColor.withOpacity(0.7),
                                    fontSize: screenWidth * 0.045,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Divider(thickness: 1, color: textColor.withOpacity(0.2)),
                  SizedBox(height: screenHeight * 0.02),

                  // Company Description
                  Text(
                    'Company Description',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: textColor,
                          fontSize: screenWidth * 0.05,
                        ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    'Mercedes-Benz is a global leader in luxury vehicles and cutting-edge technology, delivering superior quality and performance. We aim to redefine the standards of excellence in the automotive industry through innovation and customer satisfaction.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: textColor.withOpacity(0.8),
                          fontSize: screenWidth * 0.04,
                        ),
                  ),
                  SizedBox(height: screenHeight * 0.03),

                  // Contact Information Section
                  Text(
                    'Contact Information',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: textColor,
                          fontSize: screenWidth * 0.05,
                        ),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone, color: iconColor),
                    title: Text('+61 3 1234 5678',
                        style: TextStyle(color: textColor)),
                    subtitle: Text('Phone',
                        style: TextStyle(color: textColor.withOpacity(0.6))),
                  ),
                  ListTile(
                    leading: Icon(Icons.email, color: iconColor),
                    title: Text('contact@mercedesbenz.com.au',
                        style: TextStyle(color: textColor)),
                    subtitle: Text('Email',
                        style: TextStyle(color: textColor.withOpacity(0.6))),
                  ),
                  ListTile(
                    leading: Icon(Icons.web, color: iconColor),
                    title: Text('www.mercedesbenz.com.au',
                        style: TextStyle(color: textColor)),
                    subtitle: Text('Website',
                        style: TextStyle(color: textColor.withOpacity(0.6))),
                    onTap: () {
                      // Add website opening logic here
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // Services Section
                  Text(
                    'Our Services',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: textColor,
                          fontSize: screenWidth * 0.05,
                        ),
                  ),
                  ListTile(
                    leading: Icon(Icons.car_repair, color: iconColor),
                    title: Text('Luxury Vehicles',
                        style: TextStyle(color: textColor)),
                    subtitle: Text('Explore our range of premium cars',
                        style: TextStyle(color: textColor.withOpacity(0.6))),
                  ),
                  ListTile(
                    leading: Icon(Icons.electric_car, color: iconColor),
                    title: Text('Electric Mobility',
                        style: TextStyle(color: textColor)),
                    subtitle: Text('Our commitment to sustainable driving',
                        style: TextStyle(color: textColor.withOpacity(0.6))),
                  ),
                  ListTile(
                    leading: Icon(Icons.build, color: iconColor),
                    title: Text('Custom Engineering',
                        style: TextStyle(color: textColor)),
                    subtitle: Text('Tailored solutions for business needs',
                        style: TextStyle(color: textColor.withOpacity(0.6))),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
