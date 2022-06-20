import 'package:beepbeep_app/chart/chartPage.dart';
import 'package:beepbeep_app/chart/chart_spop.dart';
import 'package:beepbeep_app/chart/chart_time.dart';
import 'package:beepbeep_app/chart/chart_traffic.dart';
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
        '/total':(context) => const TotalChart(), //전체 DB
        '/traffic1':(context) => TrafficChart(num:"1"), //교통량 그래프
        '/traffic2':(context) => TrafficChart(num:"2"), //교통량 그래프
      },
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}
