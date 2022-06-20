import 'package:beepbeep_app/predict/selectPredictPage.dart';
import 'package:flutter/material.dart';

import 'd0.dart';
import 'd1.dart';
import 'd2.dart';

class MyPredict extends StatelessWidget {
  const MyPredict({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const SelectPredictPage(),
        '/Dday': (context) => const Dday(), //설날당일 입력화면
        '/Dday1': (context) => const Dday1(), // 설날D-1 입력화면
        '/Dday2': (context) => const Dday2(), // 설날D-2 입력화면
      },
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}
