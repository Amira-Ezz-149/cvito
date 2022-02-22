import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cvito/layout/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(

      backgroundColor: Colors.white,
      splashIconSize:120.0,
      splash: Image.network('assets/images/app_logo.png', fit: BoxFit.cover),
      nextScreen: HomeScreen(),
      splashTransition: SplashTransition.scaleTransition,
    );
  }
}
