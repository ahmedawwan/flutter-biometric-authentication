import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationController {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    Future<void> authenticateUserWithTouchID() async {
    final localAuthentication = LocalAuthentication();
    log('TOUCH ID PROCESS STARTED');
    bool isAuthorized = false;
    try {
      isAuthorized = await localAuthentication.authenticate(
          localizedReason: "Please authenticate to continue",
          options: const AuthenticationOptions(),
          );
    } catch (exception) {
     log(exception.toString());
    }
    if (isAuthorized) {
      final prefs = await SharedPreferences.getInstance();
      String? email = prefs.getString('email');
      String? password = prefs.getString('password');

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
    log('Loggin in Process started');
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
     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString('email', email);
      sharedPreferences.setString('password', password);
  }


  Future<void> logoutUser() async {
    await firebaseAuth.signOut();
  }
}
