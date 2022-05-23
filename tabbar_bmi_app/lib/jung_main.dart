import 'package:flutter/material.dart';
import 'package:tabbar_bmi_app/jung_home.dart';
import 'package:tabbar_bmi_app/jung_input.dart';
import 'package:tabbar_bmi_app/jung_result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/' :(context) => const JungHome(),
        '/input' :(context) => const Input(),
        '/result' :(context) => const Result(),
      },
      // initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}
