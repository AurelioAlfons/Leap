import 'package:flutter/material.dart';
import 'package:leap/UI/Layout/dark.dart';
import 'package:leap/UI/Layout/light.dart';
import 'package:leap/UI/Widget/apply.dart';

void showReusableBottomSheet({
  required BuildContext context,
  required String title,
  required String subtitle,
  required String description,
  required String location,
  required String salary,
  required List<String> skills,
  required VoidCallback onApply,
}) {
  final theme = Theme.of(context);
  final bool isDarkMode = theme.brightness == Brightness.dark;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.5,
      maxChildSize: 0.9,
      minChildSize: 0.5,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
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
                Text("Location: $location", style: theme.textTheme.bodyMedium),
                const SizedBox(height: 16),
                Text("Salary: $salary", style: theme.textTheme.bodyMedium),
                const SizedBox(height: 16),

                // Skills Section
                Text("Skills Required:", style: theme.textTheme.titleSmall),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
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
                          ),
                          const SizedBox(width: 4),
                          Text(
                            skill,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
                      ),
                      backgroundColor: theme.cardColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color: isDarkMode ? Colors.grey : theme.dividerColor,
                        ),
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 24),

                // Bottom Row with Like, Share, Save, and Apply Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.thumb_up,
                              color: isDarkMode
                                  ? DarkMode.iconColor
                                  : LightMode.iconColor),
                          onPressed: () {
                            // Handle like functionality
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.share,
                              color: isDarkMode
                                  ? DarkMode.iconColor
                                  : LightMode.iconColor),
                          onPressed: () {
                            // Handle share functionality
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.bookmark,
                              color: isDarkMode
                                  ? DarkMode.iconColor
                                  : LightMode.iconColor),
                          onPressed: () {
                            // Handle save functionality
                          },
                        ),
                      ],
                    ),
                    // Apply Button
                    ElevatedButton.icon(
                      onPressed: () {
                        // Show confirmation dialog when Apply is clicked
                        showApplyConfirmationDialog(
                          context: context,
                          onConfirm: onApply,
                        );
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
    ),
  );
}
