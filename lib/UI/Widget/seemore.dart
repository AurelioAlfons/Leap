import 'package:flutter/material.dart';

class SeeMore extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final String location;
  final VoidCallback onApply;

  const SeeMore({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.location,
    required this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showBottomSheet(context);
      },
      child: Text(
        'See more',
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.5,
          maxChildSize: 0.9,
          minChildSize: 0.5,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
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
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 16),

                    // Description
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 16),

                    // Location
                    Text(
                      "Location: $location",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 0),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
