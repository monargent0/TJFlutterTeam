import 'package:beepbeep_app/predict/tabPage.dart';
import 'package:beepbeep_app/predict/tabPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beep Beep!',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
     routes: {
      '/':(context) => const TabPage(),
     },
     initialRoute: '/',
    );
  }
}
