import 'package:flutter/material.dart';
import '../widgets/volunteer_card.dart';

class VolunteersScreen extends StatelessWidget {
  static const routeName = '/volunteers';

  const VolunteersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve activity details passed through arguments
    final Map<String, String>? activity =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>?;

    if (activity == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Volunteers'),
        ),
        body: const Center(
          child: Text('No activity data available.'),
        ),
      );
    }

    // Sample volunteers list
    final List<Map<String, String>> volunteers = [
      {'name': 'John Doe', 'hours': '4 hours'},
      {'name': 'Jane Smith', 'hours': '3 hours'},
      {'name': 'Mark Johnson', 'hours': '5 hours'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('${activity['title']} - Volunteers'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display activity name
            Text(
              'Volunteers for: ${activity['title']}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            // Display the volunteers list
            Expanded(
              child: ListView.builder(
                itemCount: volunteers.length,
                itemBuilder: (ctx, index) {
                  final volunteer = volunteers[index];
                  return VolunteerCard(
                    name: volunteer['name']!,
                    hours: volunteer['hours']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
