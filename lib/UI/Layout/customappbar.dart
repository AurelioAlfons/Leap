import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final bool showSearchButton;
  final bool showDropdown;
  final VoidCallback? onMenuPressed;
  final VoidCallback? onEndDrawerPressed;
  final VoidCallback? onTitleTapped;
  final PreferredSizeWidget? bottom;
  final Function(String)? onSearch;
  final Function(String)? onFilterSelected;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showSearchButton = true,
    this.showDropdown = true,
    this.onMenuPressed,
    this.onEndDrawerPressed,
    this.onTitleTapped,
    this.bottom,
    this.onSearch,
    this.onFilterSelected,
  });

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0.0));

  @override
  // ignore: library_private_types_in_public_api
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;
  String _selectedFilter = 'All';

  // Sample filter options
  final List<String> _filterOptions = ['All', 'Popular', 'Recent'];

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (!_isSearching) _searchController.clear();
    });
  }

  void _applyFilter(String filter) {
    setState(() {
      _selectedFilter = filter;
    });
    widget.onFilterSelected?.call(filter); // Trigger filter callback
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: _isSearching
          ? TextField(
              controller: _searchController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'Search $_selectedFilter...',
                border: InputBorder.none,
              ),
              onChanged: widget.onSearch,
            )
          : GestureDetector(
              onTap: widget.onTitleTapped,
              child: Text(widget.title),
            ),
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: widget.onMenuPressed,
      ),
      actions: [
        if (widget.showSearchButton)
          IconButton(
            onPressed: _toggleSearch,
            icon: Icon(_isSearching ? Icons.close : Icons.search),
          ),
        if (_isSearching)
          PopupMenuButton<String>(
            onSelected: _applyFilter,
            initialValue: _selectedFilter,
            icon: const Icon(Icons.filter_list),
            itemBuilder: (BuildContext context) {
              return _filterOptions.map((String filter) {
                return PopupMenuItem<String>(
                  value: filter,
                  child: Text(filter),
                );
              }).toList();
            },
          ),
        IconButton(
          onPressed: widget.onEndDrawerPressed,
          icon: const Icon(Icons.lightbulb_outlined),
        ),
      ],
      bottom: widget.bottom,
    );
  }
}
