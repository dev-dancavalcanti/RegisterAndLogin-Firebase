import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthStore extends ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  String? email;
  String? password;
  User? person;

  AuthStore() {
    _getUser();
  }

  _getUser() async {
    person = _auth.currentUser;
    notifyListeners();
  }

  Future<void> login() async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email!, password: password!);
      _getUser();
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found ' || e.code == 'wrong-password') {
        throw Exception(
            'Credencias incorretas. Tente novamente ou Cadastre-se.');
      }
    }
  }

  Future<void> register() async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email!, password: password!);
      _getUser();
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Exception('Senha fraca.');
      } else if (e.code == 'email-already-in-use') {
        Exception('Email ja ultilizado.');
      }
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    _getUser();
    notifyListeners();
  }

  String? validateEmail(String? email) =>
      email != null && email.isNotEmpty && email.contains('@')
          ? null
          : 'Precisa de um e-mail.';

  String? validatePassword(String? password) =>
      password != null && password.length >= 6
          ? null
          : "A senha precisa ter mais de 6 digitos";
}
