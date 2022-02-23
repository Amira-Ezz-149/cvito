import 'package:cvito/layout/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'layout/screens/home_screen.dart';
import 'layout/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          backgroundColor: Colors.blue,
        ),
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        // HomeScreen.id: (context) => HomeScreen(),
      },
      initialRoute: SplashScreen.id,
      home: SplashScreen(),
    );
  }
}
