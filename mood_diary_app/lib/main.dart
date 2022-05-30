import 'package:flutter/material.dart';
import 'package:mood_diary_app/view/dailylist.dart';
import 'package:mood_diary_app/view/dailycontent.dart';
import 'package:mood_diary_app/view/login.dart';
import 'package:mood_diary_app/view/signin.dart';

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
        '/': (context) => const DailyContent(
              diaryList: {
                "ename": "슬퍼",
                "dcontent": "헤어졌다.",
                "epath": "images/sad.png"
              },
            ), // 로그인 화면
        '/sign': (context) => const SignIn(), // 회원 가입 화면
        '/list': (context) => const DailyList(), // 회원 가입 화면
        // 그 외 화면 이동은 MaterialRoute방식으로 사용
      },
      initialRoute: '/list',
      debugShowCheckedModeBanner: false,
    );
  }
}
