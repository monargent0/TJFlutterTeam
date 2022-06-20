import 'package:beepbeep_app/predict/resultPredict.dart';
import 'package:beepbeep_app/predict/selectPredictPage.dart';
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
        '/': (context) => const ResultPredict(),
      },
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}
