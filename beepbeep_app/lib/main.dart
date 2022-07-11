import 'package:beepbeep_app/login/loginPage.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:beepbeep_app/login/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// late Map busers = {"buid": 'aaa'}; // ????

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beep! Beep!',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: AnimatedSplashScreen(
          // 스플래쉬
          splash: 'images/main_splash.png',
          splashIconSize: 200,
          duration: 1000,
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.deepPurple,
          nextScreen: const LoginPage()),
      routes: {
        '/signup': (context) => const RegisterPage(), // 회원 가입 화면
        '/login': (context) => const LoginPage() // 로그인 화면
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
