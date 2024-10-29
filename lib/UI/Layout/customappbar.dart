import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  // Required parameters for the app bar title and visibility options
  final String title;
  final bool showSearchButton;
  final bool showDropdown;

  // Callbacks for menu and end drawer actions
  final VoidCallback? onMenuPressed;
  final VoidCallback? onEndDrawerPressed;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showSearchButton = true,
    this.showDropdown = true,
    this.onMenuPressed,
    this.onEndDrawerPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // Conditionally shows title with dropdown menu or just title
      title: showDropdown
          ? PopupMenuButton<String>(
              onSelected: (value) {
                // Handle selected item
                // ignore: avoid_print
                print(value);
              },
              offset: const Offset(0, 30),
              padding: EdgeInsets.zero,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title),
                  const Icon(Icons.arrow_drop_down_outlined),
                ],
              ),

              // Dropdown menu items
              itemBuilder: (BuildContext context) {
                return <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'Home',
                    child: Row(
                      children: [
                        Icon(Icons.home_rounded),
                        Text('   Home'),
                      ],
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Popular',
                    child: Row(
                      children: [
                        Icon(Icons.data_exploration_rounded),
                        Text('   Popular'),
                      ],
                    ),
                  ),
                ];
              },
            )
          : Text(title),

      // Leading icon button to open the main drawer
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: onMenuPressed,
      ),

      // Action buttons (search and end drawer) based on visibility flags
      actions: [
        if (showSearchButton)
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_rounded),
          ),
        IconButton(
          onPressed: onEndDrawerPressed,
          icon: const Icon(Icons.lightbulb_outlined),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
