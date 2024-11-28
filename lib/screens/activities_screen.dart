import 'package:flutter/material.dart';
import '../widgets/activities_card.dart';
import '../widgets/filter_widget.dart';

class ActivitiesScreen extends StatefulWidget {
  static const routeName = '/activities';

  const ActivitiesScreen({super.key});

  @override
  ActivitiesScreenState createState() => ActivitiesScreenState();
}

class ActivitiesScreenState extends State<ActivitiesScreen> {
  // Mock data for demonstration
  final List<Map<String, String>> _activities = [
    {
      'title': 'Beach Cleanup',
      'date': 'Nov 25',
      'location': 'Santa Monica Beach'
    },
    {'title': 'Park Restoration', 'date': 'Dec 1', 'location': 'Central Park'},
    {'title': 'Food Drive', 'date': 'Dec 10', 'location': 'Community Center'},
  ];

  String? _selectedFilter = 'All'; // Nullable to match the updated FilterWidget
  String _searchQuery = '';

  // Function to filter and search activities
  List<Map<String, String>> _getFilteredActivities() {
    return _activities.where((activity) {
      // Apply search query
      final matchesSearch =
          activity['title']!.toLowerCase().contains(_searchQuery.toLowerCase());
      // Apply filter
      final matchesFilter = _selectedFilter == 'All' ||
          (_selectedFilter == 'Upcoming' &&
              activity['date'] == 'Dec 1') || // Example logic
          (_selectedFilter == 'Completed' &&
              activity['date'] == 'Nov 25'); // Example logic

      return matchesSearch && matchesFilter;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredActivities = _getFilteredActivities();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Activities'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/add-activity');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Filter Widget
          FilterWidget(
            selectedFilter: _selectedFilter, // Pass nullable String
            onFilterChanged: (newFilter) {
              setState(() {
                _selectedFilter = newFilter ?? 'All'; // Handle null gracefully
              });
            },
            onSearchQueryChanged: (query) {
              setState(() {
                _searchQuery = query;
              });
            },
          ),
          // Activities List
          Expanded(
            child: ListView.builder(
              itemCount: filteredActivities.length,
              itemBuilder: (ctx, index) {
                final activity = filteredActivities[index];
                return ActivitiesCard(
                  title: activity['title']!,
                  date: activity['date']!,
                  location: activity['location'],
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/activity-detail',
                      arguments: activity,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
