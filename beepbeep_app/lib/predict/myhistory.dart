import 'dart:convert';

import 'package:flutter/material.dart';
//http setting
import 'package:http/http.dart' as http;

class MyHistory extends StatefulWidget {
  final Map busers;
  const MyHistory({Key? key, required this.busers}) : super(key: key);

  @override
  State<MyHistory> createState() => _MyHistoryState();
}

class _MyHistoryState extends State<MyHistory> {
  late List data;
  late String buid;
  late String result;

  @override
  void initState() {
    super.initState();
    data = [];
    buid = widget.busers['buid'];
    result = '';
    getJSONData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: data.isEmpty
            ? const Text('검색 기록이 없습니다.')
            : ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 100,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        color: const Color.fromARGB(255, 227, 207, 231),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 240,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'D-${data[index]['hdaytype']} ${data[index]['hstart']}시 출발 ',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    '소요시간 :${data[index]['hpredict']}분',
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            // 삭제버튼
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    deleteAction(data[index]['hid'])
                                        .then((value) => getJSONData());
                                  },
                                  child: const Text('X'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
      ),
    );
  }

  //future 는 다른거 다한 다음 순서라는 의미
  Future<bool> getJSONData() async {
    data = [];
    //async가 비동기라는 의미 38번째줄이랑 42번째줄이 같이 시작됨
    var url = Uri.parse('http://localhost:8080/Flutter/beep_mylist.jsp?buid=$buid');
    var response = await http.get(url); //get방식으로 많이씀 그래야 암호화해서 압축해서옴, await는 정보받아올때까지 기다렸다가 띄우기 위해
    setState(() {
      //가져온 데이터 알아보기 쉽게 변형시키기
      try {
        var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
        //results 안에 데이터를 리스트로 넣기
        print(response);
        List result = dataConvertedJSON['results'];
        print(result);
        //add는 리스트 한줄씩 넣는건데 한꺼번에 넣기 위해 addall을 사용함
        data.addAll(result);
      } catch (e) {
        //
      }
    });
    return true;
  }

  // 삭제 JSON
  Future<String> deleteAction(int hid) async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/beep_predictDelete.jsp?hid=$hid');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    result = dataConvertedJSON['result'];

    setState(() {
      if (result == 'OK') {
        _deleteFinishDialog(context);
      } else {
        deleteerrorSnackBar(context);
      }
    });
    return result;
  }

  // 삭제 완료 후 확인창
  _deleteFinishDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Icon(
              Icons.task_alt,
              color: Colors.red,
              size: 30,
            ),
            content: const Text('          삭제가 완료 되었습니다.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('확인'),
              ),
            ],
          );
        });
  }

// 삭제 실패 에러바
  deleteerrorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('데이터 삭제에 문제가 발생하였습니다.'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }
}
