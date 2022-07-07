import 'package:beepbeep_app/predict/d2.dart';
import 'package:beepbeep_app/predict/selectPredictPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// 결과값 파라미터로 넘겨받아서 받는걸로 변경함
class ResultPredict extends StatefulWidget {
  final Map busers;
  final String result;
  final String hstart;
  final String htraffic1; 
  final String htraffic2;
  final String hspop;
  const ResultPredict({Key? key, required this.busers, required this.result, required this.htraffic1, required this.hspop, required this.hstart, required this.htraffic2})
      : super(key: key);

  @override
  State<ResultPredict> createState() => _ResultPredictState();
}

class _ResultPredictState extends State<ResultPredict> {
  late List predictList;
  late String buid;
  late String result;
  late int hid;
  // get으로 넘겨줄 용
  late String hdaytype;
  late int hstart;
  late int hholiday;
  late int hweather;
  late int htraffic1;
  late int htraffic2;
  late int hspop;

  @override
  void initState() {
    super.initState();
    predictList = [];
    buid = widget.busers['buid'];
    result = "${widget.result}분";
    // getJSONData();
    hdaytype = '';
    hstart = 0;
    hholiday = 0;
    hweather = 0;
    htraffic1 = 0;
    htraffic2 = 0;
    hspop = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('예상 소요 시간',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold , color: Colors.black),),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  result,
                  style: const TextStyle(fontSize: 35, color: Colors.deepPurple),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
              
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                const Text(
                  '< 입력 정보 >',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            SizedBox(
              width: 220,
              child: Column(
                children: [
                 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        '- 출발 시간 :',
                        
                      ),
                      const SizedBox(width: 10,),
                      Text(
                        // predictList.isNotEmpty ? predictList[0]['hstart'].toString():"0"
                        widget.hstart
                      , style: const TextStyle(color: Colors.deepPurple ,fontSize: 15, fontWeight: FontWeight.bold),),
                    const Text(
                        ' 시',
                        
                      ),
                    ],
                  ),
                  
                 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        '- 제 1종 교통량 :'
                      ),
                      const SizedBox(width: 10,),
                      Text(
                        //predictList.isNotEmpty ? predictList[0]['htraffic1'].toString():"0"
                        widget.htraffic1
                      , style: const TextStyle(color: Colors.deepPurple ,fontSize: 15, fontWeight: FontWeight.bold)),
                    const Text(
                        ' 대',
                        
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        '- 제 2종 교통량 :'
                      ),
                      const SizedBox(width: 10,),
                      Text(
                        // predictList.isNotEmpty ? predictList[0]['htraffic2'].toString():"0"
                        widget.htraffic2
                      , style: const TextStyle(color: Colors.deepPurple ,fontSize: 15, fontWeight: FontWeight.bold)),
                    const Text(
                        ' 대',
                        
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        '- 서울인구수 :'
                      ),
                      const SizedBox(width: 10,),
                      Text(
                        //predictList.isNotEmpty ? predictList[0]['hspop'].toString():"0"
                        widget.hspop
                     , style: const TextStyle(color: Colors.deepPurple ,fontSize: 15, fontWeight: FontWeight.bold) ),
                    const Text(
                        ' 명',
                        
                      ),
                    ],
                  ),
                      const SizedBox(height: 20,),
                    Row(
                    children: const [
                      Text(
                        '*나의 이력에서 조회 가능',
                        style: TextStyle(fontSize: 15 , color: Colors.deepPurpleAccent),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Dday2(busers: widget.busers);
                  },
                ));
              },
              child: const Text("다시 측정하기",style: TextStyle(fontSize: 15)),
              style: ElevatedButton.styleFrom(
                            fixedSize: const Size(150, 50),
                            primary: Colors.deepPurple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
             
            ),
          ],
        ),
      ),
    );
  }

  // resultPredict() async {
  //   var url = Uri.parse(
  //       'http://localhost:8080/Flutter/beep_result.jsp?hstart=$hstart&hholiday=$hholiday&hweather=$hweather&htraffic1=$htraffic1&htraffic2=$htraffic2');
  //   var response = await http.get(url);
  //   setState(() {
  //     var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
  //     result = dataConvertedJSON['result'];

  //     // 비동기 처리로 인해 같이 넣어줘야 함
  //     _showResult(context);
  //   });
  // }

  //   Future<bool> getJSONData() async {
  //   predictList = [];
  //   print(widget.result); // 초기화
  //   var url = Uri.parse(
  //       'http://localhost:8080/Flutter/beep_resultPredict.jsp?hpredict=${widget.result}&htraffic1=${widget.htraffic1}&hspop=${widget.hspop}&buser_buid=${widget.busers}');

  //   var response = await http.get(url); // 빌드가 끝날 때까지 기다려

  //   setState(() {
  //     var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes)); // 한글깨짐방지, map방식으로 변환

  //     List result = dataConvertedJSON['results'];
  //     predictList.addAll(result);
  //     // hdaytype = result[0]['hdaytype'];
  //     // hstart = result[0]['hstart'];
  //     // hholiday = result[0]['hholiday'];
  //     // hweather = result[0]['hweather'];
  //     // htraffic1 = result[0]['htraffic1'];
  //     // htraffic2 = result[0]['htraffic2'];
  //     // hspop = result[0]['hspop'];
  //   });

  //   return true;
  // }

}
