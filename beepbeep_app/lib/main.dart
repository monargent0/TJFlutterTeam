import 'package:beepbeep_app/chart/chartRouter.dart';
import 'package:beepbeep_app/chart/chart_spop.dart';
import 'package:beepbeep_app/chart/chart_time.dart';
import 'package:beepbeep_app/login/loginPage.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:beepbeep_app/login/register.dart';
import 'package:beepbeep_app/predict/d0.dart';
import 'package:beepbeep_app/predict/d1.dart';
import 'package:beepbeep_app/predict/d2.dart';
import 'package:beepbeep_app/predict/selectPredictPage.dart';

import 'package:beepbeep_app/tabPage.dart';
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
        //'/': (context) => const SelectPredictPage(),
        //'/Dday': (context) => Dday(busers: busers), //설날당일 입력화면
        //'/Dday1': (context) => const Dday1(), // 설날D-1 입력화면
        //'/Dday2': (context) => const Dday2(), // 설날D-2 입력화면
        '/': (context) => const LoginPage(), // 로그인 화면
        '/signup': (context) => const RegisterPage(), // 회원 가입 화면
        // 그 외 화면 이동은 MaterialRoute방식으로 사용
        // '/signup': (context) => const RegisterPage(), // 회원 가입 화면
        // 그 외 화면 이동은 MaterialRoute방식으로 사용
      },
      initialRoute: '/',
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
