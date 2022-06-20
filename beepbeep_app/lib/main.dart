

import 'package:beepbeep_app/predict/myhistory.dart';
import 'package:beepbeep_app/tabPage.dart';
import 'package:flutter/material.dart';

import 'login/loginPage.dart';
import 'login/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beep! Beep!',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      routes: {
<<<<<<< HEAD
        '/tab':(context) => TabPage(busers: {},),
=======
        '/': (context) => const TabPage(), // 로그인 화면
        // '/': (context) => const TimeChart(), // 로그인 화면
        // '/signup': (context) => const RegisterPage(), // 회원 가입 화면
>>>>>>> main
        '/signin': (context) => const LoginPage(), // 로그인 화면
        '/signup': (context) => const RegisterPage(), // 회원 가입 화면
  
        // 그 외 화면 이동은 MaterialRoute방식으로 사용
      },
<<<<<<< HEAD
      initialRoute: '/signin',
=======
      initialRoute: '/',
>>>>>>> main
      debugShowCheckedModeBanner: false,
// ------------------------

      // 삭제하지 마시오--- 상아엉니코드
      // home: AnimatedSplashScreen(
      //   splash: 'images/main_splash.png',
      //   splashIconSize: 200,
      //   duration: 1000,
      //   splashTransition: SplashTransition.fadeTransition,
      //   backgroundColor: Colors.deepPurple,
      //   nextScreen: const LoginPage(),
      // ),
      // debugShowCheckedModeBanner: false,
      // -------
    );
  }
}
