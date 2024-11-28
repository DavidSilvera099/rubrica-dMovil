import 'package:flutter/material.dart';

class FilterWidget extends StatefulWidget {
  final String? selectedFilter;
  final ValueChanged<String?> onFilterChanged;
  final ValueChanged<String> onSearchQueryChanged;

  const FilterWidget({
    super.key,
    required this.selectedFilter,
    required this.onFilterChanged,
    required this.onSearchQueryChanged,
  });

  @override
  FilterWidgetState createState() => FilterWidgetState();
}

class FilterWidgetState extends State<FilterWidget> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search Bar
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: 'Search activities...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            ),
            onChanged: widget.onSearchQueryChanged,
          ),
        ),
        // Filter Dropdown
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Filter by:', style: TextStyle(fontSize: 16)),
              DropdownButton<String>(
                value: widget.selectedFilter,
                onChanged: widget.onFilterChanged,
                items: const [
                  DropdownMenuItem(value: 'All', child: Text('All')),
                  DropdownMenuItem(value: 'Upcoming', child: Text('Upcoming')),
                  DropdownMenuItem(
                      value: 'Completed', child: Text('Completed')),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
