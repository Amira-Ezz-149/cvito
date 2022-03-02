import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import '../welcome_module/welcome_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String id = 'SplashScreen';

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Colors.white,
      splashIconSize: 180.0,
      splash: Image.asset('assets/images/app_logo.png', fit: BoxFit.cover),
      nextScreen: WelcomeScreen(),
      splashTransition: SplashTransition.scaleTransition,
    );
  }
}
