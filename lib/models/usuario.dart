import 'package:cloud_firestore/cloud_firestore.dart';

class Usuario {
  final String id;
  final String nombre;
  final String password;

  Usuario({
    required this.id,
    required this.nombre,
    required this.password,
  });

  // Crear un objeto Usuario a partir de un DocumentSnapshot de Firestore
  factory Usuario.fromMap(DocumentSnapshot doc, Map<String, dynamic> data) {
    return Usuario(
      id: doc.id,
      nombre: data['nombre'] ?? '',
      password: data['password'] ?? '',
    );
  }
}
