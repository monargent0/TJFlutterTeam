import 'package:flutter/material.dart';
import 'package:mood_diary_app/view/dailylist.dart';
import 'package:mood_diary_app/view/dailycontent.dart';
import 'package:mood_diary_app/view/login.dart';
import 'package:mood_diary_app/view/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mood Diary',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      routes: {
        '/': (context) => const LoginPage(),// 로그인 화면
        '/signup': (context) => const RegisterPage(), // 회원 가입 화면
        // 그 외 화면 이동은 MaterialRoute방식으로 사용

        //---- 테스트용
        '/list': (context) => const DailyList(), // 일기 리스트 화면
        // '/test' :(context) => const DailyContent(
        //       diaryList: {
        //         "ename": "슬퍼",
        //         "dcontent": "헤어졌다.",
        //         "epath": "images/sad.png"
        //       },)
      },
      initialRoute: '/list',
      debugShowCheckedModeBanner: false,
    );
  }
}
