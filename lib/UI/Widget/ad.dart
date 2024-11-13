import 'package:flutter/material.dart';
import 'package:leap/UI/Layout/dark.dart';
import 'package:leap/UI/Layout/light.dart';

class AdvertisementWidget extends StatelessWidget {
  final String companyName;
  final String location;
  final ImageProvider<Object> companyLogo;
  final Widget media; // Image or video widget for the ad
  final String headline;
  final String description;
  final String link;
  final VoidCallback onLearnMore;

  const AdvertisementWidget({
    super.key,
    required this.companyName,
    required this.location,
    required this.companyLogo,
    required this.media,
    required this.headline,
    required this.description,
    required this.link,
    required this.onLearnMore,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final iconColor = theme.brightness == Brightness.dark
        ? DarkMode.iconColor
        : LightMode.iconColor;
    final outlineColor = theme.brightness == Brightness.dark
        ? DarkMode.buttonBackgroundColor
        : LightMode.buttonBackgroundColor;

    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: outlineColor, width: 2), // Green outline
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Advertisement Label at the top
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 4),
            color: outlineColor,
            child: Center(
              child: Text(
                'ADVERTISEMENT',
                style: TextStyle(
                  color: theme.brightness == Brightness.dark
                      ? DarkMode.buttonTextColor
                      : LightMode.buttonTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Company Logo, Name, Location
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: companyLogo,
                      radius: 24,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            companyName,
                            style: theme.textTheme.titleMedium,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            location,
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
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
                    height: 200, // Controls height for media consistency
                    child: media,
                  ),
                ),
                const SizedBox(height: 16),

                // Headline and Description
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      headline,
                      style: theme.textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: theme.textTheme.bodyMedium,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                const SizedBox(height: 14),

                // Link Section
                Row(
                  children: [
                    Icon(Icons.link, color: iconColor),
                    const SizedBox(width: 15),
                    GestureDetector(
                      onTap: () {
                        // Open link functionality
                      },
                      child: Text(
                        "Visit Website",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),

                // Divider
                const Divider(),

                // Learn More Button
                Center(
                  child: ElevatedButton.icon(
                    onPressed: onLearnMore,
                    icon: Icon(
                      Icons.info,
                      color: theme.brightness == Brightness.dark
                          ? DarkMode.buttonTextColor
                          : LightMode.buttonTextColor,
                    ),
                    label: Text(
                      "Learn More",
                      style: TextStyle(
                        color: theme.brightness == Brightness.dark
                            ? DarkMode.buttonTextColor
                            : LightMode.buttonTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.brightness == Brightness.dark
                          ? DarkMode.buttonBackgroundColor
                          : LightMode.buttonBackgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
