import 'package:flutter/material.dart';
import 'package:leap/UI/Layout/dark.dart';
import 'package:leap/UI/Layout/light.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InternshipPost extends StatefulWidget {
  final String companyName;
  final String location;
  final ImageProvider<Object> companyLogo;
  final Widget media;
  final String positionName;
  final List<String> keySkills;
  final VoidCallback onApply;
  final bool initialMatchExperience;

  const InternshipPost({
    super.key,
    required this.companyName,
    required this.location,
    required this.companyLogo,
    required this.media,
    required this.positionName,
    required this.keySkills,
    required this.onApply,
    this.initialMatchExperience = false,
  });

  @override
  State<InternshipPost> createState() => _InternshipPostState();
}

class _InternshipPostState extends State<InternshipPost> {
  bool isLiked = false;
  bool isShared = false;
  bool isSaved = false;
  bool matchExperience = false;

  @override
  void initState() {
    super.initState();
    _loadIconStates();
    matchExperience = widget.initialMatchExperience;
  }

  Future<void> _loadIconStates() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isLiked = prefs.getBool('${widget.companyName}_liked') ?? false;
      isShared = prefs.getBool('${widget.companyName}_shared') ?? false;
      isSaved = prefs.getBool('${widget.companyName}_saved') ?? false;
    });
  }

  Future<void> _saveIconState(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('${widget.companyName}_$key', value);
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
    _saveIconState('liked', isLiked);
  }

  void toggleShare() {
    setState(() {
      isShared = !isShared;
    });
    _saveIconState('shared', isShared);
  }

  void toggleSave() {
    setState(() {
      isSaved = !isSaved;
    });
    _saveIconState('saved', isSaved);
  }

  void toggleMatchExperience() {
    setState(() {
      matchExperience = !matchExperience;
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
            // Company Logo, Name, and Location
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
                        overflow: TextOverflow.visible, // Allow wrapping
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(
                    matchExperience
                        ? Icons.check_circle
                        : Icons.check_circle_outline,
                    color: matchExperience ? Colors.green : Colors.grey,
                  ),
                  onPressed: toggleMatchExperience,
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
            // Position Name
            Text(
              widget.positionName,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 14),
            // Key Skills Section (Horizontal Scrollable)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: widget.keySkills.map((skill) {
                  IconData skillIcon = Icons.code; // default icon for skills
                  if (skill.toLowerCase() == 'flutter') {
                    skillIcon = Icons.flutter_dash;
                  }
                  if (skill.toLowerCase() == 'firebase') {
                    skillIcon = Icons.cloud;
                  }
                  // Add more specific icons if needed

                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: _buildSkillCard(skill, skillIcon, context),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 14),
            const Divider(),
            // Like, Share, Save Row
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
                    IconButton(
                      icon: Icon(
                          isSaved ? Icons.bookmark : Icons.bookmark_outline),
                      onPressed: toggleSave,
                    ),
                  ],
                ),
                // Apply Button with Icon
                ElevatedButton.icon(
                  onPressed: widget.onApply,
                  icon: Icon(
                    Icons.check_circle,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? DarkMode
                            .buttonTextColor // Black icon color in dark mode
                        : LightMode
                            .buttonTextColor, // White icon color in light mode
                  ),
                  label: Text(
                    "Apply",
                    style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? DarkMode
                              .buttonTextColor // Black text color in dark mode
                          : LightMode
                              .buttonTextColor, // White text color in light mode
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).brightness ==
                            Brightness.dark
                        ? DarkMode
                            .buttonBackgroundColor // Green background in dark mode
                        : LightMode
                            .buttonBackgroundColor, // Green background in light mode
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20), // Rounded corners
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
