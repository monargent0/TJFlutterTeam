import 'package:flutter/material.dart';
import 'package:tabbar_bmi_app/jungeun/jung_home.dart';
import 'package:tabbar_bmi_app/jungeun/jung_input.dart';
import 'package:tabbar_bmi_app/jungeun/jung_result.dart';

class JungEun extends StatefulWidget {
  const JungEun({Key? key}) : super(key: key);

  @override
  State<JungEun> createState() => _JungEunState();
}

class _JungEunState extends State<JungEun> {
 
 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/' :(context) => const JungHome(),
        '/input' :(context) => const JungInput(),
        '/result' :(context) => const JungResult(),
      },
      // initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}