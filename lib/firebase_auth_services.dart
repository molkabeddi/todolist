import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'firebase_auth_services.dart'; // Assurez-vous que vous importez correctement votre service Firebase Auth

class FirebaseAuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } catch (e) {
      print("Une erreur s'est produite lors de l'inscription : $e");
      return null;
    }
  }

  Future<void> signIn(String email, String password, BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password); // Assurez-vous de passer le contexte ici
      // Gérer la connexion réussie, par exemple, rediriger l'utilisateur vers une autre page
      Navigator.pushNamed(context, '/tasklist');
    } catch (e) {
      // Gérer l'échec de la connexion, afficher un message d'erreur, etc.
      print("Une erreur s'est produite lors de la connexion : $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Une erreur s\'est produite lors de la connexion.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
