import 'package:flutter/material.dart';

// Import all your screens here
import 'screens/home_screen.dart';
import 'screens/activities_screen.dart';
import 'screens/activity_detail_screen.dart';
import 'screens/add_activity_screen.dart';
import 'screens/volunteers_screen.dart';
import 'screens/profile_screen.dart';
// import 'screens/statistics_screen.dart';
import 'screens/registration_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Volunteer Management App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/', // Home screen as the initial route
      routes: {
        '/': (ctx) => const HomeScreen(),
        ActivitiesScreen.routeName: (ctx) => const ActivitiesScreen(),
        ActivityDetailScreen.routeName: (ctx) => const ActivityDetailScreen(),
        AddActivityScreen.routeName: (ctx) => const AddActivityScreen(),
        VolunteersScreen.routeName: (ctx) => const VolunteersScreen(),
        ProfileScreen.routeName: (ctx) => const ProfileScreen(),
        // StatisticsScreen.routeName: (ctx) => StatisticsScreen(),
        RegistrationScreen.routeName: (ctx) => const RegistrationScreen(),
      },
      onGenerateRoute: (settings) {
        // Custom route generation for dynamic routes
        if (settings.name == ActivityDetailScreen.routeName) {
          final Map<String, String> activityData =
              settings.arguments as Map<String, String>;
          return MaterialPageRoute(
            builder: (ctx) => const ActivityDetailScreen(),
          );
        }
        return null; // Default fallback
      },
      onUnknownRoute: (settings) {
        // Fallback route in case of an unknown route
        return MaterialPageRoute(
          builder: (ctx) => const Scaffold(
            body: Center(child: Text('Page not found')),
          ),
        );
      },
    );
  }
}
