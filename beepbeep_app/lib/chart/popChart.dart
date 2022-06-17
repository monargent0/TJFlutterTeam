import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:http/http.dart' as http;
import 'dart:convert';

class PopChart extends StatefulWidget {

  const PopChart({Key? key}) : super(key: key);

  @override
  State<PopChart> createState() => _PopChartState();
}

class _PopChartState extends State<PopChart> {
  late List<charts.Series<XY, int>> _resultData;

  @override
  void initState(){
    _resultData = [];

    getJSONData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // child: charts.LineChart(_resultData, animate: true),
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
    print(result);

    setState(() {
      _resultData = _createData(result);
    });

    return true;
  }
}

class XY {
  final int x;
  final int y;

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