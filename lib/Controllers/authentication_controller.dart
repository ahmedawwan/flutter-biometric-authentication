import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:local_auth/local_auth.dart';
import '../services/secure_storage.dart';

class AuthenticationController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    Future<void> authenticateUserWithTouchID() async {
    final localAuthentication = LocalAuthentication();
    bool isAuthorized = false;
    try {
      isAuthorized = await localAuthentication.authenticate(
          localizedReason: "Please authenticate to continue",
          options: const AuthenticationOptions(biometricOnly: true),
          );
    } catch (exception) {
     log(exception.toString());
    }
    if (isAuthorized) {
      SecureStorage storage = SecureStorage();
      String? email = await storage.getEmail();
      String? password = await storage.getPassword();

      if (email != null &&
          password != null &&
          email.isNotEmpty &&
          password.isNotEmpty) {

        //login here
        await loginUser(email, password);
      } else {
        log('Something went wrong');
      }
    } else {
      log('Not matched');
    }
  }

  Future<bool> loginUser(String email, String password) async {
    await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    if (firebaseAuth.currentUser == null) {
      return false;
    } else {
      await _saveUser(email, password);
      return true;
    }
  }

  Future<void> _saveUser(String email, String password) async {
     SecureStorage storage = SecureStorage();
     storage.setEmail(email);
     storage.setPassword(password);
  }


  Future<void> logoutUser() async {
    await firebaseAuth.signOut();
  }
}
