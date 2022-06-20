import 'package:beepbeep_app/predict/d0.dart';
import 'package:beepbeep_app/predict/resultPredict.dart';
import 'package:beepbeep_app/predict/selectPredictPage.dart';
import 'package:beepbeep_app/tabPage.dart';
import 'package:flutter/material.dart';

import 'd0.dart';
import 'd1.dart';
import 'd2.dart';

class MyPredict extends StatelessWidget {
  final Map busers;
  const MyPredict({Key? key, required this.busers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => SelectPredictPage(busers: busers),
        '/Dday': (context) => Dday(busers: busers), //설날당일 입력화면
        '/Dday1': (context) => Dday1(busers: busers), // 설날D-1 입력화면
        '/Dday2': (context) => Dday2(busers: busers),
        '/result': (context) => ResultPredict(busers: busers), // 설날D-2 입력화면
      },
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}
