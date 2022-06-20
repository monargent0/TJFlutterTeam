import 'dart:convert';

import 'package:flutter/material.dart';
//http setting
import 'package:http/http.dart' as http;






class MyList extends StatefulWidget {
  final Map busers;
  const MyList({Key? key, required this.busers}) : super(key: key);

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  late List data;
  late String bid;

  @override
  void initState() {
    super.initState();
    data = [];
    bid=widget.busers['bid'];
    getJSONData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('기록 '),
        backgroundColor: Colors.purple,
      ),
      body: Center(
          child: data.isEmpty
              ? const Text('데이터가 없습니다.')
              : ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Text(
                                  '소요시간 :',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  data[index]['hpredict'],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Text(
                                  '출발시간 :',
                                  
                                ),
                                Text(
                                  data[index]['hstart'],
                                ),
                              ],
                            ),
                            
                          ],
                        ),
                      ),
                    );
                  })),
    );
  }

  //future 는 다른거 다한 다음 순서라는 의미
  Future<bool> getJSONData() async {
    data=[];
    //async가 비동기라는 의미 38번째줄이랑 42번째줄이 같이 시작됨
    var url = Uri.parse('http://localhost:8080/Flutter/beep_mylist.jsp?bid=$bid');
    var response = await http.get(url); //get방식으로 많이씀 그래야 암호화해서 압축해서옴, await는 정보받아올때까지 기다렸다가 띄우기 위해

    setState(() {
      //가져온 데이터 알아보기 쉽게 변형시키기
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      //results 안에 데이터를 리스트로 넣기
      List result = dataConvertedJSON['results'];
      //add는 리스트 한줄씩 넣는건데 한꺼번에 넣기 위해 addall을 사용함
      data.addAll(result);
    });

    //print(result);
    // print(result[0]['code']);
    //print(data[0]);
    return true;
  }
}
