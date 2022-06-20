import 'package:beepbeep_app/chart/chartPage.dart';
import 'package:beepbeep_app/chart/popChart.dart';
import 'package:beepbeep_app/chart/totalChart.dart';
import 'package:flutter/material.dart';

class MyChart extends StatelessWidget {
  const MyChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const ChartPage(),
        '/pop':(context) => const PopChart(),
        '/total':(context) => const TotalChart(),
      },
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}
