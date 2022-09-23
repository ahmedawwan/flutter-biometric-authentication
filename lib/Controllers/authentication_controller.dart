import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<bool> loginUser(String email, String password) async {
    await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    if (firebaseAuth.currentUser == null) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> logoutUser() async {
    await firebaseAuth.signOut();
  }
}
