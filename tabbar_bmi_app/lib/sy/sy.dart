import 'package:flutter/material.dart';
import 'package:tabbar_bmi_app/sy/check.dart';
import 'package:tabbar_bmi_app/sy/main_sy.dart';
import 'package:tabbar_bmi_app/sy/show.dart';

class SY extends StatefulWidget {
  const SY({Key? key}) : super(key: key);

  @override
  State<SY> createState() => _SYState();
}

class _SYState extends State<SY> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/' :(context) => const Sybmi(),
        '/input' :(context) => const CheckBMI(),
        '/result' :(context) => const Showresult(),
      },
      // initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}