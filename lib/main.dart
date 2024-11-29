import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Importa firebase_core
import 'package:firebase_auth/firebase_auth.dart'; // Importa firebase_auth
import 'screens/login_screen.dart'; // Pantalla de login
import 'screens/registro_screen.dart'; // Pantalla de registro
import './firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:
        DefaultFirebaseOptions.currentPlatform, // Usa las opciones generadas
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase App',
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(), // Ruta para el Login
        '/registro': (context) =>
            const RegistroScreen(), // Ruta para el Registro
        '/bienvenido': (context) =>
            const BienvenidoScreen(), // Ruta para Bienvenida
      },
    );
  }
}

class BienvenidoScreen extends StatelessWidget {
  const BienvenidoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido'),
      ),
      body: Center(
        child: Text(
          '¡Bienvenido!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
