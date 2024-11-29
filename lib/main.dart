import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Importa firebase_core
import 'package:firebase_auth/firebase_auth.dart'; // Importa firebase_auth
import './firebase_options.dart';
// Screens
import 'screens/login_screen.dart'; // Pantalla de login
import 'screens/registro_screen.dart'; // Pantalla de registro
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
  await Firebase.initializeApp(
    options:
        DefaultFirebaseOptions.currentPlatform, // Usa las opciones generadas
  );
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
        '/': (context) => const LoginScreen(),
        ActivitiesScreen.routeName: (context) => const ActivitiesScreen(),
        ActivityDetailScreen.routeName: (context) =>
            const ActivityDetailScreen(),
        AddActivityScreen.routeName: (context) => const AddActivityScreen(),
        VolunteersScreen.routeName: (context) => const VolunteersScreen(),
        ProfileScreen.routeName: (context) => const ProfileScreen(),
        // StatisticsScreen.routeName: (context) => StatisticsScreen(),
        RegistrationScreen.routeName: (context) => const RegistrationScreen(),
      },
      onGenerateRoute: (settings) {
        // Custom route generation for dynamic routes
        if (settings.name == ActivityDetailScreen.routeName) {
          final Map<String, String> activityData =
              settings.arguments as Map<String, String>;
          return MaterialPageRoute(
            builder: (context) => const ActivityDetailScreen(),
          );
        }
        return null; // Default fallback
      },
      onUnknownRoute: (settings) {
        // Fallback route in case of an unknown route
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(child: Text('Page not found')),
          ),
        );
      },
    );
  }
}
