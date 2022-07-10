import 'package:beepbeep_app/predict/d2.dart';
import 'package:beepbeep_app/predict/selectPredictPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// 파라미터, user id, 예측 결과값, 출발시간, 1종교통량, 2종교통량, 서울인구수
class ResultPredict extends StatefulWidget {
  final Map busers;
  final String result;
  final String hstart;
  final String htraffic1;
  final String htraffic2;
  final String hspop;
  const ResultPredict(
      {Key? key,
      required this.busers,
      required this.result,
      required this.htraffic1,
      required this.hspop,
      required this.hstart,
      required this.htraffic2})
      : super(key: key);

  @override
  State<ResultPredict> createState() => _ResultPredictState();
}

class _ResultPredictState extends State<ResultPredict> {
  // late List predictList;
  late String buid;
  late String result;
  late int hid;
  late String hdaytype;
  late String hstart;
  late String htraffic1;
  late String htraffic2;
  late String hspop;

  @override
  void initState() {
    super.initState();
    // predictList = [];
    buid = widget.busers['buid'];
    result = "${widget.result}분";
    // getJSONData();
    hdaytype = '';
    hstart = widget.hstart;
    htraffic1 = widget.htraffic1;
    htraffic2 = widget.htraffic2;
    hspop = widget.hspop;
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
                const Text(
                  '예상 소요 시간',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  result,
                  style:
                      const TextStyle(fontSize: 35, color: Colors.deepPurple),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  '< 입력 정보 >',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
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
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        // 출발시간 입력값
                        hstart,
                        style: const TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        ' 시',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text('- 제 1종 교통량 :'),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                          // 1종 교통량 입력값
                          htraffic1,
                          style: const TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                      const Text(
                        ' 대',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text('- 제 2종 교통량 :'),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                          // 2종 교통량 입력값
                          htraffic2,
                          style: const TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                      const Text(
                        ' 대',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text('- 서울인구수 :'),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                          // 서울인구수 입력값
                          hspop,
                          style: const TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                      const Text(
                        ' 명',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: const [
                      Text(
                        '*나의 이력에서 조회 가능',
                        style: TextStyle(
                            fontSize: 15, color: Colors.deepPurpleAccent),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Dday2(busers: widget.busers);
                  },
                ));
              },
              child: const Text("다시 측정하기", style: TextStyle(fontSize: 15)),
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
}
