import 'package:beepbeep_app/chart/chartPage.dart';
import 'package:beepbeep_app/chart/popChart.dart';
import 'package:flutter/material.dart';

class MyRouter extends StatelessWidget {
  const MyRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const ChartPage(),
        '/pop':(context) => PopChart.withRandomData()
      },
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}
