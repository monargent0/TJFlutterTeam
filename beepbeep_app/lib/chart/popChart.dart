import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PopChart extends StatefulWidget {
  const PopChart({Key? key}) : super(key: key);

  @override
  State<PopChart> createState() => _PopChartState();
}

class _PopChartState extends State<PopChart> {
  late List<BarChartGroupData> _resultData;

  @override
  void initState() {
    _resultData = [];

    getJSONData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back)),
      ),
      body: Center(
        //resultdata는 getJSON이 끝날 때 까지 Empty 상태 > 그 전에는 뭔가 표시하려 시도하면 에러 남
        child: _resultData.isNotEmpty ? BarChart(BarChartData(
          barGroups: _resultData,
          maxY: 12000000
        )) : null,
      ),
    );
  }

  Future<bool> getJSONData() async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/beep_getdata.jsp?queryType=pop');

    var response = await http.get(url); // 빌드가 끝날 때까지 기다려
    var dataConvertedJSON =
        json.decode(utf8.decode(response.bodyBytes)); // 한글깨짐방지, map방식으로 변환

    List result = dataConvertedJSON['results'];

    List<BarChartGroupData> data = [];

    for (var i = 0; i < result.length; i++) {
      data.add(generateGroupData(result[i]['x'],result[i]['y']));
    }

    setState(() {
      _resultData = data;
    });

    return true;
  }
}

BarChartGroupData generateGroupData(int x, int y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(toY: y.toDouble()),
      ],
    );
  }

  XY(this.x, this.y);
}

List<charts.Series<XY, int>> _createData(dynamic result) {
  return [
    charts.Series<XY, int>(
      id: 'Sales',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (XY sales, _) => sales.x,
      measureFn: (XY sales, _) => sales.y,
      data: result,
    )
  ];
}
