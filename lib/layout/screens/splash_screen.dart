import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cvito/layout/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String id = 'SplashScreen';
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Colors.white,
      splashIconSize:180.0,
      splash: Image.asset('assets/images/app_logo.png', fit: BoxFit.cover),
      nextScreen: const WelcomeScreen(),
      splashTransition: SplashTransition.scaleTransition,
    );
  }
}
