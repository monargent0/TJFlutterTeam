import 'dart:convert';

import 'package:beepbeep_app/chart/developer_data.dart';
import 'package:beepbeep_app/chart/developer_spop.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:http/http.dart' as http;

class SpopChart extends StatefulWidget {
  const SpopChart({Key? key}) : super(key: key);

  @override
  State<SpopChart> createState() => _SpopChartState();
}

class _SpopChartState extends State<SpopChart> {
  // property
  late List<DeveloperData> data = [];
  var _dropList = ['POP', 'DAY', 'traffic'];
  String _selected = 'POP';
  // init
  @override
  void initState() {
    super.initState();
    getPOPData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset('images/beeplogo.png'),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            DropdownButton(
                value: _selected,
                icon: const Icon(Icons.arrow_downward_rounded),
                items: _dropList.map(
                  (String _dropList) {
                    return DropdownMenuItem(
                      value: _dropList,
                      child: Text(_dropList),
                    );
                  },
                ).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selected = newValue!;
                  });
                }),
            DeveloperPop(data: data),
          ],
        ),
      ),
    );
  }

  // Function
  Future<bool> getPOPData() async {
    data = []; // 초기화
    var url = Uri.parse(
        'http://localhost:8080/Flutter/beep_getdata.jsp?queryType=pop');

    var response = await http.get(url); // 빌드가 끝날 때까지 기다려
    var dataConvertedJSON =
        json.decode(utf8.decode(response.bodyBytes)); // 한글깨짐방지, map방식으로 변환

    List result = dataConvertedJSON['results'];

    // print(result[0]['x']); // test

    setState(() {
      data.add(DeveloperData(
        x: result[0]['x'], //13
        y: result[0]['y'],
        barColor: charts.ColorUtil.fromDartColor(Colors.deepPurple),
      ));
      data.add(DeveloperData(
        x: result[1]['x'], //14
        y: result[1]['y'],
        barColor: charts.ColorUtil.fromDartColor(Colors.grey),
      ));
      data.add(DeveloperData(
        x: result[2]['x'], //15
        y: result[2]['y'],
        barColor: charts.ColorUtil.fromDartColor(Colors.deepPurple),
      ));
      data.add(DeveloperData(
        x: 2016,
        y: 10204057, // 16data
        barColor: charts.ColorUtil.fromDartColor(Colors.grey),
      ));
      data.add(DeveloperData(
        x: result[3]['x'], //17
        y: result[3]['y'],
        barColor: charts.ColorUtil.fromDartColor(Colors.deepPurple),
      ));
      data.add(DeveloperData(
        x: result[4]['x'], //18
        y: result[4]['y'],
        barColor: charts.ColorUtil.fromDartColor(Colors.grey),
      ));
      data.add(DeveloperData(
        x: 2019,
        y: 10010983, // 19data
        barColor: charts.ColorUtil.fromDartColor(Colors.deepPurple),
      ));
      data.add(DeveloperData(
        x: result[5]['x'], //20
        y: result[5]['y'],
        barColor: charts.ColorUtil.fromDartColor(Colors.grey),
      ));
    });

    return true;
  }
} //end
