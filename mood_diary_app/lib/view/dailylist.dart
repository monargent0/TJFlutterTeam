import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class DailyList extends StatefulWidget {
  const DailyList({Key? key}) : super(key: key);

  @override
  State<DailyList> createState() => _DailyListState();
}

class _DailyListState extends State<DailyList> {
  // property
  late List diaryList;

  // init
  @override
  void initState() {
    super.initState();
    diaryList = [];
    getJSONData();
   
  }

  //scafold
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.brown[100],
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                // setState(() {
                //   Navigator.pushNamed(context, '/')
                //       .then((value) => getJSONData());
                // });
              },
              icon: const Icon(
                Icons.emoji_nature,
                color: Colors.lightGreen,
                size: 40,
              ))
        ],
      ),
      body: Center(
        child: diaryList.isEmpty
            ? Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text(
                    '   아직 일기가 없어요!! \n일기를 작성해 주세요! >ㅅ<',
                    style: TextStyle(
                        color: Colors.brown,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ))
            : ListView.builder(
                itemCount: diaryList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      //
                      

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          color: Colors.white54,
                          elevation: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage(diaryList[index]['epath']),
                                  radius: 30,
                                ),
                                Column(
                                  children: [
                                    Text(diaryList[index]['dcontent']),
                                    Text(
                                      '${DateFormat().parse(diaryList[index]['ddate'])}'
                                      //diaryList[index]['ddate'].toString()
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
      ),
    );
  }

// Function
  Future<bool> getJSONData() async {
    diaryList = []; // 초기화
    var url = Uri.parse('http://localhost:8080/Flutter/daily_list_flutter.jsp');

    var response = await http.get(url); // 빌드가 끝날 때까지 기다려
    var dataConvertedJSON =
        json.decode(utf8.decode(response.bodyBytes)); // 한글깨짐방지, map방식으로 변환

    List result = dataConvertedJSON['results'];

    setState(() {
      diaryList.addAll(result);
      
    });

    return true;
  }
}
