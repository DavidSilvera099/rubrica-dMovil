import 'package:flutter/material.dart';

class AddActivityScreen extends StatefulWidget {
  static const routeName = '/add-activity';

  const AddActivityScreen({super.key});

  @override
  AddActivityScreenState createState() => AddActivityScreenState();
}

class AddActivityScreenState extends State<AddActivityScreen> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _date = '';
  String _location = '';

  // Controllers for form inputs
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _dateController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  // Method to handle form submission
  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      // Here, we would save the activity (e.g., to Firebase Firestore or a local model)
      setState(() {
        _title = _titleController.text;
        _date = _dateController.text;
        _location = _locationController.text;
      });

      // Show confirmation message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Activity "$_title" added successfully')),
      );

      // Optionally, navigate back to the previous screen (e.g., activities list)
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Activity'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Activity Title Field
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Activity Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the activity title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Activity Date Field
              TextFormField(
                controller: _dateController,
                decoration: const InputDecoration(
                  labelText: 'Activity Date',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the activity date';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Activity Location Field
              TextFormField(
                controller: _locationController,
                decoration: const InputDecoration(
                  labelText: 'Activity Location',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the activity location';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Submit Button
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Add Activity'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
