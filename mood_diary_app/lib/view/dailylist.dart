import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mood_diary_app/view/dailyadd.dart';
import 'package:mood_diary_app/view/dailycontent.dart';
import 'package:mood_diary_app/view/tree.dart';

class DailyList extends StatefulWidget {
  final Map users;
  const DailyList({Key? key, required this.users}) : super(key: key);

  @override
  State<DailyList> createState() => _DailyListState();
}

class _DailyListState extends State<DailyList> {
  // property
  late List diaryList;

  late String id;

  // init
  @override
  void initState() {
    super.initState();
    diaryList = [];
    id = widget.users['uid'];
    getJSONData();
  }

  //scafold
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // 배경색
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: Colors.grey[100],
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, '/signin');
            },
            icon: const Icon(
              Icons.logout_outlined,
              color: Color.fromARGB(255, 119, 216, 164),
              size: 30,
            )),
        actions: [
          SizedBox(
            width: 70,
            height: 50,
            child: IconButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const TreeWgt(
                            weather: 'sunny', treeGrowth: 80); // Map으로 보내
                      },
                    )).then((value) => getJSONData());
                  });
                },
                icon: Image.asset(
                  'images/tree.png',
                  color: const Color.fromARGB(255, 119, 216, 164),
                )),
          )
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
                      setState(() {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return DailyContent(
                                diaryList: diaryList[index]); // Map으로 보내
                          },
                        )).then((value) => getJSONData());
                      });
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          height: index == 0 ? 40 : 10,
                          child: Text(
                            index == 0
                                ? '${diaryList[index]['ddate'].substring(0, 4)}년'
                                : '',
                            style: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 350,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                color: Colors.brown[100],
                                elevation: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: AssetImage(
                                            diaryList[index]['epath']),
                                        radius: 30,
                                      ),
                                      SizedBox(
                                        width: 250,
                                        child: Column(
                                          children: [
                                            Text(
                                              diaryList[index]['dcontent']
                                                          .length >
                                                      13
                                                  ? '${diaryList[index]['dcontent'].substring(0, 13)}...'
                                                  : diaryList[index]
                                                      ['dcontent'],
                                              style: const TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.black87),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  '${diaryList[index]['ddate'].substring(6, 7)}월 ${diaryList[index]['ddate'].substring(8, 10)}일',
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.brown),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 119, 216, 164),
          child: const Icon(Icons.edit_note_rounded),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return DailyAdd(uID: widget.users['uid']); // Map으로 보내
              },
            )).then((value) => getJSONData());
          }),
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 89, 159, 122),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                //bottomRight: Radius.circular(40),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        widget.users['uname'],
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.lime[100]),
                      ),
                      const SizedBox(
                        width: 15,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        widget.users['uid'],
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightGreenAccent[100]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                '< My Mood Tracker >',
                style: TextStyle(
                    color: Colors.brown,
                    fontSize: 18,
                    fontWeight: FontWeight.w900),
              ),
              Text(
                '\n오늘 하루의 기분을 \n간단한 메모와 귀여운 이모티콘으로 \n기록해 보아요! ',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.brown,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  '< Grow My Tree! >',
                  style: TextStyle(
                      color: Colors.brown,
                      fontSize: 18,
                      fontWeight: FontWeight.w900),
                ),
                Text(
                  '\n오른쪽 상단의 나뭇잎 버튼을 누르면 \n나만의 나무가 나타납니다!\n매일 매일 일기를 써갈수록 \n성장하는 나무를 기대해 주세요!',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.brown,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

// Function
  Future<bool> getJSONData() async {
    diaryList = []; // 초기화
    var url = Uri.parse(
        'http://localhost:8080/Flutter/daily_list_flutter.jsp?uid=$id');

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
