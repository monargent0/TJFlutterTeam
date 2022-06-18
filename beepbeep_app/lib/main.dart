import 'package:beepbeep_app/predict/d0.dart';
import 'package:beepbeep_app/predict/d1.dart';
import 'package:beepbeep_app/predict/d2.dart';


import 'package:flutter/material.dart';



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
        '/Dday': (context) => const Dday(), //설날당일 입력화면
        '/Dday1': (context) => const Dday1(), // 설날D-1 입력화면
        '/Dday2': (context) => const Dday2(), // 설날D-2 입력화면
        // '/signup': (context) => const RegisterPage(), // 회원 가입 화면
        // 그 외 화면 이동은 MaterialRoute방식으로 사용
      },
      initialRoute: '/Dday2',
// ------------------------

      // 삭제하지 마시오--- 상아엉니코드
      // home: AnimatedSplashScreen(
      //   splash: 'images/main_splash.png',
      //   splashIconSize: 200,
      //   duration: 1000,
      //   splashTransition: SplashTransition.fadeTransition,
      //   backgroundColor: Colors.deepPurple,
      //     nextScreen: LoginPage(),),
      // debugShowCheckedModeBanner: false,
      // -------

    );
  }
}

// @@@@ user 테이블 이름 워크벤치에서 오류나서 users로 수정!! @@@@ 
// tree 연결 , add화면 추가 하면 끝! 


