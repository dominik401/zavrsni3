import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Prijava korisnika
  Future<User?> loginUser(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  // Odjava korisnika
  Future<void> logoutUser() async {
    await _auth.signOut();
  }
}
