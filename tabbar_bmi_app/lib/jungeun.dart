import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tabbar_bmi_app/jung_home.dart';
import 'package:tabbar_bmi_app/jung_input.dart';
import 'package:tabbar_bmi_app/jung_result.dart';

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
        '/input' :(context) => const Input(),
        '/result' :(context) => const Result(),
      },
      // initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}