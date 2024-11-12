import 'package:flutter/material.dart';
import 'package:leap/UI/Layout/customappbar.dart';

class SavePage extends StatelessWidget {
  const SavePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Bookmark",
        showSearchButton: false,
        showDropdown: false,
        onMenuPressed: () => Scaffold.of(context).openDrawer(),
        onEndDrawerPressed: () => Scaffold.of(context).openEndDrawer(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0), // Padding around the grid
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 8, // Spacing between columns
            mainAxisSpacing: 8, // Spacing between rows
            childAspectRatio:
                3 / 4, // Aspect ratio for each container (adjust as needed)
          ),
          itemCount:
              6, // Number of grid items (adjust or replace with dynamic data)
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Theme.of(context)
                    .cardColor, // Background color for each item
                borderRadius: BorderRadius.circular(12), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16), // Inner padding
              child: Center(
                child: Text(
                  'Item ${index + 1}', // Placeholder text for each item
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
