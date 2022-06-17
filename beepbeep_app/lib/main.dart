<<<<<<< HEAD
import 'package:beepbeep_app/predict/d0.dart';
import 'package:beepbeep_app/predict/tabPage.dart';
import 'package:beepbeep_app/predict/tabPage.dart';
=======
import 'package:beepbeep_app/chart/chartRouter.dart';
import 'package:beepbeep_app/login/loginPage.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
>>>>>>> main
import 'package:flutter/material.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
      title: 'Mood Diary',
=======
      title: 'Beep! Beep!',
>>>>>>> main
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
<<<<<<< HEAD
      routes: {
        '/Dday': (context) => const Dday(), // 로그인 화면
        // '/signup': (context) => const RegisterPage(), // 회원 가입 화면
        // 그 외 화면 이동은 MaterialRoute방식으로 사용
      },
      initialRoute: '/Dday',
=======
      home: AnimatedSplashScreen(
        splash: 'images/main_splash.png',
        splashIconSize: 200,
        duration: 1000,
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.deepPurple,
          nextScreen: loginPage(),),
>>>>>>> main
      debugShowCheckedModeBanner: false,
    );
  }
}

// @@@@ user 테이블 이름 워크벤치에서 오류나서 users로 수정!! @@@@ 
// tree 연결 , add화면 추가 하면 끝! 


