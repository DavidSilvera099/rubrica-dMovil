import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Método para registrar usuario y asignar rol en Firestore
  Future<String> registrarUsuario(
      String email, String nombre, String password, bool esAdmin) async {
    try {
      // Crear el usuario en FirebaseAuth
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Guardar el usuario en Firestore con el rol correspondiente
      await _firestore
          .collection('usuarios')
          .doc(userCredential.user?.uid)
          .set({
        'nombre': nombre,
        'email': email,
        'rol': esAdmin
            ? 'administrador'
            : 'usuario', // Asigna el rol según la variable esAdmin
      });

      return 'Usuario registrado con éxito';
    } catch (e) {
      print('Error al registrar usuario: $e');
      return 'Error al registrar usuario';
    }
  }

  // Método para iniciar sesión con correo y contraseña
  Future<User?> loginUsuario(String email, String password) async {
    try {
      // Intentamos iniciar sesión
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential
          .user; // Retorna el usuario si la autenticación es exitosa
    } catch (e) {
      // Manejo de errores si algo sale mal
      print('Error al iniciar sesión: $e');
      throw Exception('Credenciales incorrectas');
    }
  }

  // Método para obtener el rol del usuario desde Firestore
  Future<String> obtenerRolUsuario(String uid) async {
    try {
      DocumentSnapshot userDoc =
          await _firestore.collection('usuarios').doc(uid).get();
      if (userDoc.exists) {
        return userDoc['rol'] ??
            'usuario'; // Devuelve 'usuario' por defecto si no se encuentra el campo 'rol'
      } else {
        return 'usuario'; // Si no hay documento, es un usuario por defecto
      }
    } catch (e) {
      print('Error al obtener rol del usuario: $e');
      return 'usuario';
    }
  }
}
