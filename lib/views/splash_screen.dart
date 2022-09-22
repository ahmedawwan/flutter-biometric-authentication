import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_fingerprint_authentication/views/login_screen.dart';
import 'package:flutter_fingerprint_authentication/views/register_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  navigateToHome() {
    // ===============================================================================
    // Timer is used so that after 3 seconds the user is navigated to login screen
    // ===============================================================================
    Timer(
      //Duration of timer
      const Duration(seconds: 3),
      // function (what happens after the timer stops)
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => RegisterScreen(),
          ),
        );
      },
    );
  }

  // ===========================================================================
  // Init State
  // ===========================================================================
  @override
  void initState() {
    navigateToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: 'logo',
              child: Image.asset(
                'images/logo.png',
                width: MediaQuery.of(context).size.width * 0.5,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Fingerprint Authentication',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
