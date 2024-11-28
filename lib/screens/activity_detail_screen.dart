import 'package:flutter/material.dart';

class ActivityDetailScreen extends StatelessWidget {
  static const routeName = '/activity-detail';

  const ActivityDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve activity details passed through arguments
    final Map<String, String>? activity =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>?;

    if (activity == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Activity Details'),
        ),
        body: const Center(
          child: Text('No activity data available.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activity['title'] ?? 'Activity Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Activity Title
              Text(
                activity['title'] ?? 'Unknown Activity',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              // Activity Date
              Row(
                children: [
                  const Icon(Icons.calendar_today),
                  const SizedBox(width: 8),
                  Text(
                    activity['date'] ?? 'Unknown Date',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Activity Location
              Row(
                children: [
                  const Icon(Icons.location_pin),
                  const SizedBox(width: 8),
                  Text(
                    activity['location'] ?? 'Unknown Location',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Activity Description
              const Text(
                'Description:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                activity['description'] ??
                    'No description provided for this activity.',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              // Buttons for actions
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/registration',
                            arguments: activity);
                      },
                      icon: const Icon(Icons.how_to_reg),
                      label: const Text('Register'),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/feedback',
                            arguments: activity);
                      },
                      icon: const Icon(Icons.feedback),
                      label: const Text('Feedback'),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/volunteers',
                            arguments: activity);
                      },
                      icon: const Icon(Icons.people),
                      label: const Text('Volunteers'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
