import 'package:flutter/material.dart';
import 'package:json_table/json_table.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TotalChart extends StatefulWidget {
  const TotalChart({Key? key}) : super(key: key);

  @override
  State<TotalChart> createState() => _TotalChartState();
}

class _TotalChartState extends State<TotalChart> {

  late List _resultData;

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
        //https://pub.dev/packages/json_table
        child: _resultData.isNotEmpty ? JsonTable(_resultData) : null,
      ),
    );
  }


  Future<bool> getJSONData() async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/beep_gettotal.jsp?');

    var response = await http.get(url); // 빌드가 끝날 때까지 기다려
    var dataConvertedJSON =
        json.decode(utf8.decode(response.bodyBytes)); // 한글깨짐방지, map방식으로 변환

    List result = dataConvertedJSON['results'];

    setState(() {
      _resultData.addAll(result);
    });

    return true;
  }
}

