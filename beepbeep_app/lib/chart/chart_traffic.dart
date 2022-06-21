import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class TrafficChart extends StatefulWidget {
  String num = "";
  TrafficChart({Key? key, required this.num}) : super(key: key);

  @override
  State<TrafficChart> createState() => _TrafficChartState();
}

class _TrafficChartState extends State<TrafficChart> {
  // property
  late List<FlSpot> data = [];
  late String kk = ';';
  // init
  @override
  void initState() {
    super.initState();
    getJSONData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: data.isEmpty ? const Text('그래프를 불러오고 있습니다!') : 
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text('시간대 별 ${widget.num}종 교통량',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Expanded(
                    child: LineChart(
                      chartRendererKey: Key(kk),
                      swapAnimationDuration: const Duration(seconds: 1),
                      swapAnimationCurve: Curves.bounceIn,
                      LineChartData(
                        lineTouchData: LineTouchData(
                            enabled: true,
                            touchTooltipData: LineTouchTooltipData(
                              tooltipBgColor: Colors.black87,
                              tooltipRoundedRadius: 20.0,
                              fitInsideHorizontally: true,
                              tooltipMargin: 20,
                            )),
                        minY: 0,
                        minX: -1,
                        maxX: 24,
                        maxY: widget.num == "1" ? 30000000 : 1500000,
                        lineBarsData: [
                          LineChartBarData(
                              spots: data,
                              isCurved: true,
                              dotData: FlDotData(show: false),
                              barWidth: 4,
                              color: widget.num == "1"
                                  ? Colors.deepOrange
                                  : Colors.lime)
                        ],
                        titlesData: FlTitlesData(
                          bottomTitles: AxisTitles(
                            sideTitles: bottomTitles,
                          ),
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text('출처: KOSIS 국가통계포털'),
            const Text('단위: 대/시'),
            const Text('기간: 2013 ~ 2020년'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple ,
        child: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  // x 축 스타일 설정
  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff72719b),
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('0시', style: style);
        break;
      case 4:
        text = const Text('4시', style: style);
        break;
      case 8:
        text = const Text('8시', style: style);
        break;
      case 12:
        text = const Text('12시', style: style);
        break;
      case 16:
        text = const Text('16시', style: style);
        break;
      case 20:
        text = const Text('20시', style: style);
        break;
      case 23:
        text = const Text('23시', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  Future<bool> getJSONData() async {
    data = [];
    var url = Uri.parse(
        'http://localhost:8080/Flutter/beep_getdata.jsp?queryType=traffic${widget.num}');

    var response = await http.get(url); // 빌드가 끝날 때까지 기다려
    var dataConvertedJSON =
        json.decode(utf8.decode(response.bodyBytes)); // 한글깨짐방지, map방식으로 변환

    List result = dataConvertedJSON['results'];

    setState(() {
      for (int i = 0; i < result.length; i++) {
        data.add(FlSpot(result[i]['x'].toDouble(), result[i]['y'].toDouble()));
      }
    });

    return true;
  }
}
