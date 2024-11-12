import 'package:flutter/material.dart';
import 'package:leap/UI/Layout/dark.dart';
import 'package:leap/UI/Layout/light.dart';
import 'package:shared_preferences/shared_preferences.dart';

void showReusableBottomSheet({
  required BuildContext context,
  required String title,
  required String subtitle,
  required String description,
  required String location,
  required String salary,
  required List<String> skills,
  required VoidCallback onApply,
}) async {
  final theme = Theme.of(context);
  final bool isDarkMode = theme.brightness == Brightness.dark;

  // Load initial states from SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  bool isLiked = prefs.getBool('${title}_liked') ?? false;
  bool isShared = prefs.getBool('${title}_shared') ?? false;
  bool isSaved = prefs.getBool('${title}_saved') ?? false;

  // Update preferences when icon states change
  Future<void> saveIconState(String key, bool value) async {
    await prefs.setBool('${title}_$key', value);
  }

  showModalBottomSheet(
    // ignore: use_build_context_synchronously
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.5,
          maxChildSize: 0.9,
          minChildSize: 0.5,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
              ),
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title and Subtitle
                    Text(
                      title,
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: isDarkMode
                            ? Colors.white
                            : theme.textTheme.titleLarge?.color,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      subtitle,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: isDarkMode
                            ? Colors.white
                            : theme.textTheme.titleMedium?.color,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Description
                    Text(
                      description,
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 16),

                    // Location and Salary
                    Text("Location: $location",
                        style: theme.textTheme.bodyMedium),
                    const SizedBox(height: 16),
                    Text("Salary: $salary", style: theme.textTheme.bodyMedium),
                    const SizedBox(height: 16),

                    // Skills Section with Vertical Spacing
                    Text("Skills Required:", style: theme.textTheme.titleSmall),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8, // Horizontal spacing
                      runSpacing: 8, // Vertical spacing between rows
                      children: skills.map((skill) {
                        return Chip(
                          label: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.code,
                                size: 16,
                                color: isDarkMode
                                    ? DarkMode.iconColor
                                    : LightMode.iconColor,
                              ), // Icon color based on theme
                              const SizedBox(width: 4),
                              Text(
                                skill,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color:
                                      isDarkMode ? Colors.white : Colors.black,
                                ),
                              ),
                            ],
                          ),
                          backgroundColor: theme.cardColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                                color: isDarkMode
                                    ? Colors.grey
                                    : theme.dividerColor), // Border color
                          ),
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 24),

                    // Like, Share, Save, and Apply Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                isLiked
                                    ? Icons.thumb_up
                                    : Icons.thumb_up_outlined,
                                color: isDarkMode
                                    ? DarkMode.iconColor
                                    : LightMode.iconColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  isLiked = !isLiked;
                                });
                                saveIconState('liked', isLiked);
                              },
                            ),
                            IconButton(
                              icon: Icon(
                                isShared ? Icons.share : Icons.share_outlined,
                                color: isDarkMode
                                    ? DarkMode.iconColor
                                    : LightMode.iconColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  isShared = !isShared;
                                });
                                saveIconState('shared', isShared);
                              },
                            ),
                            IconButton(
                              icon: Icon(
                                isSaved
                                    ? Icons.bookmark
                                    : Icons.bookmark_outline,
                                color: isDarkMode
                                    ? DarkMode.iconColor
                                    : LightMode.iconColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  isSaved = !isSaved;
                                });
                                saveIconState('saved', isSaved);
                              },
                            ),
                          ],
                        ),
                        // Apply Button at Bottom Right
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                            onApply();
                          },
                          icon: Icon(Icons.check_circle,
                              color: isDarkMode
                                  ? DarkMode.buttonTextColor
                                  : LightMode.buttonTextColor),
                          label: Text(
                            "Apply",
                            style: TextStyle(
                              color: isDarkMode
                                  ? DarkMode.buttonTextColor
                                  : LightMode.buttonTextColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isDarkMode
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
          },
        );
      },
    ),
  );
}
