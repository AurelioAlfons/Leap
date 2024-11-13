import 'package:flutter/material.dart';
import 'package:leap/UI/Layout/dark.dart';
import 'package:leap/UI/Layout/light.dart'; // Assuming DarkMode is defined here

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Page Title
            Text(
              'Create a New Post',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16.0),

            // Company Name
            TextField(
              decoration: InputDecoration(
                labelText: 'Company Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // Location
            TextField(
              decoration: InputDecoration(
                labelText: 'Location',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // Job Title
            TextField(
              decoration: InputDecoration(
                labelText: 'Job Title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // Description
            TextField(
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 16.0),

            // Salary
            TextField(
              decoration: InputDecoration(
                labelText: 'Salary (e.g., \$25/hour)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16.0),

            // Website Link
            TextField(
              decoration: InputDecoration(
                labelText: 'Website Link',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              keyboardType: TextInputType.url,
            ),
            const SizedBox(height: 16.0),

            // Skills Add Button
            ElevatedButton.icon(
              onPressed: () {
                // Add logic to show a dialog or modal to add skills
              },
              icon: const Icon(Icons.add),
              label: const Text('Add  '),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                backgroundColor: isDarkMode
                    ? DarkMode.buttonBackgroundColor
                    : LightMode
                        .buttonBackgroundColor, // Background color based on theme
                foregroundColor: isDarkMode
                    ? DarkMode.buttonTextColor
                    : LightMode.buttonTextColor, // Text color based on theme
              ),
            ),
            const SizedBox(height: 16.0),

            // Image/Video Upload Button
            OutlinedButton.icon(
              onPressed: () {
                // Add logic to select an image or video
              },
              icon: Icon(
                Icons.image,
                color: isDarkMode ? DarkMode.iconColor : Colors.grey,
              ),
              label: Text(
                'Upload Image or Video',
                style: TextStyle(
                  color: isDarkMode ? DarkMode.iconColor : Colors.black,
                ),
              ),
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: isDarkMode
                      ? DarkMode.iconColor
                      : LightMode.iconColor, // Border color based on theme
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // Submit Button
            ElevatedButton(
              onPressed: () {
                // Add logic to submit the new post
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                backgroundColor: isDarkMode
                    ? DarkMode.buttonBackgroundColor
                    : LightMode
                        .buttonBackgroundColor, // Background color based on theme
                foregroundColor: isDarkMode
                    ? DarkMode.buttonTextColor
                    : LightMode.buttonTextColor, // Text color based on theme
              ),
              child: const Center(
                child: Text(
                  'Create Post',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
