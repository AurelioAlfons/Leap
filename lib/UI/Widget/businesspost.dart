// lib/UI/Widget/business_post.dart
import 'package:flutter/material.dart';
import 'package:leap/UI/Layout/dark.dart';
import 'package:leap/UI/Layout/light.dart';
import 'package:leap/UI/Widget/bottomsheet.dart';

class BusinessPost extends StatefulWidget {
  final String companyName;
  final String location;
  final ImageProvider<Object> companyLogo;
  final Widget media;
  final String positionName;
  final List<String> keySkills;
  final String date;
  final String description;
  final String salary;
  final String link;
  final VoidCallback onEdit;
  final bool initialMatchExperience;

  const BusinessPost({
    super.key,
    required this.companyName,
    required this.location,
    required this.companyLogo,
    required this.media,
    required this.positionName,
    required this.keySkills,
    required this.date,
    required this.description,
    required this.salary,
    required this.link,
    required this.onEdit,
    this.initialMatchExperience = false,
  });

  @override
  State<BusinessPost> createState() => _BusinessPostState();
}

class _BusinessPostState extends State<BusinessPost> {
  bool isLiked = false;
  bool isShared = false;
  bool matchExperience = false;

  @override
  void initState() {
    super.initState();
    matchExperience = widget.initialMatchExperience;
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  void toggleShare() {
    setState(() {
      isShared = !isShared;
    });
  }

  Widget _buildSkillCard(String skill, IconData icon, BuildContext context) {
    final Color cardColor = Theme.of(context).cardColor;
    final Color iconColor = Theme.of(context).iconTheme.color ?? Colors.green;
    final Color textColor =
        Theme.of(context).textTheme.bodyLarge?.color ?? Colors.white;
    final screenWidth = MediaQuery.of(context).size.width;

    return Card(
      color: cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: screenWidth * 0.02, horizontal: screenWidth * 0.04),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: iconColor, size: screenWidth * 0.05),
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

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Company Logo, Name, Location, and Date
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: widget.companyLogo,
                  radius: 24,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.companyName,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.location,
                        style: Theme.of(context).textTheme.bodyMedium,
                        overflow: TextOverflow.visible,
                      ),
                    ],
                  ),
                ),
                Text(
                  widget.date,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Media (Image/Video)
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: SizedBox(
                width: double.infinity,
                child: widget.media,
              ),
            ),
            const SizedBox(height: 16),
            // Position Name and Brief Description
            GestureDetector(
              onTap: () {
                showReusableBottomSheet(
                  context: context,
                  title: widget.positionName,
                  subtitle: widget.companyName,
                  description: widget.description,
                  location: widget.location,
                  salary: widget.salary,
                  skills: widget.keySkills,
                  onApply: widget.onEdit,
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.positionName,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Salary, Hours, and Link Section
            Row(
              children: [
                Icon(Icons.attach_money,
                    color: Theme.of(context).iconTheme.color),
                const SizedBox(width: 15),
                Text(
                  widget.salary,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.link, color: Theme.of(context).iconTheme.color),
                const SizedBox(width: 15),
                GestureDetector(
                  onTap: () {
                    // Open link functionality
                  },
                  child: Text(
                    "Visit Website",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            // Key Skills Section (Horizontal Scrollable)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: widget.keySkills.map((skill) {
                  IconData skillIcon = Icons.code;
                  if (skill.toLowerCase() == 'flutter') {
                    skillIcon = Icons.flutter_dash;
                  }
                  if (skill.toLowerCase() == 'firebase') {
                    skillIcon = Icons.cloud;
                  }
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: _buildSkillCard(skill, skillIcon, context),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 14),
            const Divider(),
            // Like, Share, Edit Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(isLiked
                          ? Icons.thumb_up_alt
                          : Icons.thumb_up_alt_outlined),
                      onPressed: toggleLike,
                    ),
                    IconButton(
                      icon: Icon(isShared ? Icons.share : Icons.share_outlined),
                      onPressed: toggleShare,
                    ),
                  ],
                ),
                // Edit Button with Icon
                ElevatedButton.icon(
                  onPressed: widget.onEdit,
                  icon: Icon(
                    Icons.edit,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? DarkMode.buttonTextColor
                        : LightMode.buttonTextColor,
                  ),
                  label: Text(
                    "Edit",
                    style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? DarkMode.buttonTextColor
                          : LightMode.buttonTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Theme.of(context).brightness == Brightness.dark
                            ? DarkMode.buttonBackgroundColor
                            : LightMode.buttonBackgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
