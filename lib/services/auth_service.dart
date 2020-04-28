import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  /// Signs user in using email and password.
  signIn(String email, String password) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  }
}