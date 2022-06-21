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

import 'login/searchMain.dart';


void main() {
  runApp(const MyApp());
}

late Map busers = {"buid":'aaa'};

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
        splash: 'images/main_splash.png',
        splashIconSize: 200,
        duration: 1000,
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.deepPurple,
          nextScreen: const LoginPage()),
      routes: {
        '/signup': (context) => const RegisterPage(), // 회원 가입 화면
      },
      debugShowCheckedModeBanner: false,
    );
  }
}