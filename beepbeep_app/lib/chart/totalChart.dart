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

  var columns = [
      JsonTableColumn("cstart", label: "출발시간대",),
      JsonTableColumn("cdriving", label: "소요시간"),
      JsonTableColumn("cdaytype", label: "설날 D-Day"),
      JsonTableColumn("choliday", label: "연휴길이"),
      JsonTableColumn("ctraffic1", label: "1종 교통량"),
      JsonTableColumn("ctraffic2", label: "2종 교통량"),
      JsonTableColumn("cspop", label: "서울 인구수"),
      JsonTableColumn("cweather", label: "강수여부"),
      JsonTableColumn("cdate", label: "날짜",),
    ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              SizedBox(
                width: 350,
                child: _resultData.isNotEmpty ? JsonTable(_resultData, columns: columns, showColumnToggle: true, paginationRowCount:18) : null,),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },),
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

