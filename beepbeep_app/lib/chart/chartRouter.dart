import 'package:beepbeep_app/chart/chartPage.dart';
import 'package:beepbeep_app/chart/chart_spop.dart';
import 'package:beepbeep_app/chart/popChart.dart';
import 'package:beepbeep_app/chart/totalChart.dart';
import 'package:flutter/material.dart';

class MyChart extends StatelessWidget {
  const MyChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const ChartPage(), // 차트 선택
        '/spop': (context) => const SpopChart(), // 인구수 그래프
        '/pop': (context) => const PopChart(), // 동원 연습
        '/total':(context) => const TotalChart(),
      },
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}
