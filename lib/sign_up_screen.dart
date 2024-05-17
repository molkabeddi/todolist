import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_provider.dart';
import 'firebase_auth_services.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuthService _authService = FirebaseAuthService(); // Instance de FirebaseAuthService

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                final email = _emailController.text;
                final password = _passwordController.text;

                if (!_isValidEmail(email)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please enter a valid email address'),
                      backgroundColor: Colors.red,
                    ),
                  );
                  return;
                }

                signUp(email, password, context); // Appel de la fonction signUp avec le contexte
              },
              child: Text('Sign Up'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signin');
              },
              child: Text('Already have an account? Sign In'),
            ),
          ],
        ),
      ),
    );
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@gmail.com$');
    return emailRegex.hasMatch(email);
  }

  Future<void> signUp(String email, String password, BuildContext context) async {
    try {
      await _authService.signUpWithEmailAndPassword(email, password); // Appel de la méthode d'inscription
      // Afficher un message de succès d'inscription
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registration Successful'),
          backgroundColor: Colors.green,
        ),
      );
      // Rediriger l'utilisateur vers une autre page ou effectuer d'autres actions nécessaires après l'inscription réussie
    } catch (e) {
      // Gérer l'échec de l'inscription, afficher un message d'erreur, etc.
      print("Une erreur s'est produite lors de l'inscription : $e");
    }
  }
}
