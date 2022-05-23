
import 'package:flutter/material.dart';
import 'package:tabbar_bmi_app/jjh_bmiForm.dart';
import 'package:tabbar_bmi_app/jjh_home.dart';
import 'package:tabbar_bmi_app/jjh_result.dart';

class JJH extends StatelessWidget {
  const JJH({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: "/",
      routes: {
        '/' :(context) => const Home(),
        '/bmi' :(context) => const MeasureBmi(),
        '/result' :(context) => const Result(),
      },
    );
  }
}

