import 'package:beepbeep_app/chart/chartPage.dart';
import 'package:beepbeep_app/chart/chartRouter.dart';
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
      home: const MyRouter(),
      debugShowCheckedModeBanner: false,
    );
  }
}
