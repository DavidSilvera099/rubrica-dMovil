import 'package:flutter/material.dart';

class VolunteerCard extends StatelessWidget {
  final String name;
  final String hours;

  const VolunteerCard({
    super.key,
    required this.name,
    required this.hours,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        title: Text(
          name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'Volunteered for: $hours',
          style: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
