import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class TimeChart extends StatefulWidget {
  const TimeChart({Key? key}) : super(key: key);

  @override
  State<TimeChart> createState() => _TimeChartState();
}

class _TimeChartState extends State<TimeChart> {
  // property
  late List<FlSpot> data = [];
  late List<FlSpot> data2 = [];
  late List<FlSpot> data3 = [];
  bool day1Checked = true;
  bool day2Checked = true;
  bool dayChecked = true;
  late final FlSpot mostLeftSpot;

  // init
  @override
  void initState() {
    super.initState();
    getJSONData();
    getJSONData2();
    getJSONData3();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          child: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('시간대 별 서울-대전 이동 소요시간',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(
                height: 40,
              ),
              Container(
                height: 420,
                width: 380,
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
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('D-2'),
                        Checkbox(
                            value: day2Checked,
                            activeColor: Colors.pink,
                            onChanged: (bool? val) {
                              setState(() {
                                day2Checked = val!;
                              });
                            }),
                        const SizedBox(
                          width: 16,
                        ),
                        const Text('D-1'),
                        Checkbox(
                            value: day1Checked,
                            activeColor: Colors.cyan,
                            onChanged: (bool? val) {
                              setState(() {
                                day1Checked = val!;
                              });
                            }),
                        const SizedBox(
                          width: 16,
                        ),
                        const Text('D-Day'),
                        Checkbox(
                            value: dayChecked,
                            activeColor: Colors.amber,
                            onChanged: (bool? val) {
                              setState(() {
                                dayChecked = val!;
                              });
                            }),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: LineChart(
                          LineChartData(
                            lineTouchData: LineTouchData(
                                enabled: true,
                                touchCallback: (FlTouchEvent event,
                                    LineTouchResponse? touchResponse) {},
                                touchTooltipData: LineTouchTooltipData(
                                  tooltipBgColor: Colors.black87,
                                  tooltipRoundedRadius: 20.0,
                                  // showOnTopOfTheChartBoxArea: true,
                                  fitInsideHorizontally: true,
                                  tooltipMargin: 20,
                                )),
                            maxY: 230,
                            minY: 50,
                            minX: -1,
                            maxX: 24,
                            borderData: FlBorderData(
                                border: const Border(
                                    bottom: BorderSide(), left: BorderSide()),
                                show: true),
                            gridData: FlGridData(
                                show: true,
                                horizontalInterval: 500,
                                verticalInterval: 4),
                            lineBarsData: [
                              LineChartBarData(
                                spots: day2Checked ? data : [],
                                isCurved: true,
                                barWidth: 5,
                                dotData: FlDotData(show: false),
                                belowBarData: BarAreaData(
                                  show: true,
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color.fromARGB(159, 219, 30, 147),
                                      Color.fromARGB(91, 246, 228, 234),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                                color: Colors.pink,
                              ),
                              LineChartBarData(
                                spots: day1Checked ? data2 : [],
                                isCurved: true,
                                barWidth: 5,
                                isStrokeCapRound: true,
                                dotData: FlDotData(show: false),
                                belowBarData: BarAreaData(
                                  show: true,
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color.fromARGB(78, 27, 129, 246),
                                      Color.fromARGB(91, 246, 228, 234)
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                                color: Colors.cyan,
                              ),
                              LineChartBarData(
                                spots: dayChecked ? data3 : [],
                                isCurved: true,
                                barWidth: 5,
                                dotData: FlDotData(show: false),
                                belowBarData: BarAreaData(
                                  show: true,
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color.fromARGB(78, 246, 126, 27),
                                      Color.fromARGB(91, 246, 228, 234)
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                                color: Colors.amber,
                              ),
                            ],
                            titlesData: FlTitlesData(
                              bottomTitles: AxisTitles(
                                sideTitles: bottomTitles,
                                axisNameWidget: const Text(
                                  '출발 시간',
                                  style: TextStyle(
                                      color: Color(0xff75729e),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              rightTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              topTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              leftTitles: AxisTitles(
                                sideTitles: leftTitles(),
                                axisNameWidget: const Text(
                                  '소요 시간',
                                  style: TextStyle(
                                      color: Color(0xff75729e),
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          swapAnimationDuration: const Duration(seconds: 1),
                          swapAnimationCurve: Curves.bounceIn,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text('출처: 한국도로공사'),
              const Text('단위: 분 / 시'),
              const Text('기간: 2013 ~ 2020년'),
            ],
          ),
        ));
  }

// y축 스타일 설정
  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff75729e),
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );
    String text;
    switch (value.toInt()) {
      case 50:
        text = '50분 ';
        break;
      case 100:
        text = '100분 ';
        break;
      case 150:
        text = '150분 ';
        break;
      case 200:
        text = '200분 ';
        break;
      case 230:
        text = '230분 ';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  SideTitles leftTitles() => SideTitles(
        getTitlesWidget: leftTitleWidgets,
        showTitles: true,
        interval: 1,
        reservedSize: 30,
      );

// x 축 스타일 설정
  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      // color: Color(0xff72719b),
      color: Color(0xff75729e),
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

  // Function
  Future<bool> getJSONData() async {
    data = []; // 초기화
    var url = Uri.parse(
        'http://localhost:8080/Flutter/beep_getdata.jsp?queryType=D-2');

    var response = await http.get(url); // 빌드가 끝날 때까지 기다려
    var dataConvertedJSON =
        json.decode(utf8.decode(response.bodyBytes)); // 한글깨짐방지, map방식으로 변환

    List result = dataConvertedJSON['results'];

    print(result.length); // test

    setState(() {
      for (int i = 0; i < result.length; i++) {
        data.add(FlSpot(result[i]['x'].toDouble(), result[i]['y'].toDouble()));
      }
    });

    return true;
  }

  Future<bool> getJSONData2() async {
    data2 = []; // 초기화
    var url = Uri.parse(
        'http://localhost:8080/Flutter/beep_getdata.jsp?queryType=D-1');

    var response = await http.get(url); // 빌드가 끝날 때까지 기다려
    var dataConvertedJSON =
        json.decode(utf8.decode(response.bodyBytes)); // 한글깨짐방지, map방식으로 변환

    List result = dataConvertedJSON['results'];

    print(result.length); // test

    setState(() {
      for (int i = 0; i < result.length; i++) {
        data2.add(FlSpot(result[i]['x'].toDouble(), result[i]['y'].toDouble()));
      }
    });

    return true;
  }

  Future<bool> getJSONData3() async {
    data3 = []; // 초기화
    var url =
        Uri.parse('http://localhost:8080/Flutter/beep_getdata.jsp?queryType=D');

    var response = await http.get(url); // 빌드가 끝날 때까지 기다려
    var dataConvertedJSON =
        json.decode(utf8.decode(response.bodyBytes)); // 한글깨짐방지, map방식으로 변환

    List result = dataConvertedJSON['results'];

    print(result.length); // test

    setState(() {
      for (int i = 0; i < result.length; i++) {
        data3.add(FlSpot(result[i]['x'].toDouble(), result[i]['y'].toDouble()));
      }
    });

    return true;
  }
} //end
