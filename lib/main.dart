import 'package:flutter/material.dart';
import 'package:flutter_fingerprint_authentication/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFF2097F3),
      ),
      home: const SplashScreen(),
    );
  }
}
