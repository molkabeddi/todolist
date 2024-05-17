// auth_provider.dart
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  List<User> _users = [];

  List<User> get users => _users;

  void signUp(String email, String password) {
    _users.add(User(email: email, password: password));
    notifyListeners();
  }

  bool isRegistered(String email, String password) {
    return _users.any((user) => user.email == email && user.password == password);
  }

  // Autres méthodes et fonctionnalités de la classe
}

class User {
  final String email;
  final String password;

  User({required this.email, required this.password});
}
