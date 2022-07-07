import 'package:beepbeep_app/predict/resultPredict.dart';
import 'package:beepbeep_app/predict/selectPredictPage.dart';
import 'package:beepbeep_app/tabPage.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
=======


>>>>>>> 9f0d2cbab2b912ef1723fc10cd656c3f47d8c162
import 'd2.dart';

class MyPredict extends StatelessWidget {
   final Map busers;
  const MyPredict({Key? key, required this.busers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => SelectPredictPage(busers: busers),
        '/Dday2': (context) => Dday2(busers: busers),
      },
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}
