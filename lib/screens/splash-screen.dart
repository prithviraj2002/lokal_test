import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lokal_test/screens/home-screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: const Text(
            'News App',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        nextScreen: const HomeScreen()
    );
  }
}
