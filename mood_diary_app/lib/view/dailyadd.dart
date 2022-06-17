import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DailyAdd extends StatefulWidget {
  final String uID;
  const DailyAdd({Key? key, required this.uID}) : super(key: key);

  @override
  State<DailyAdd> createState() => _DailyAddState();
}

class _DailyAddState extends State<DailyAdd> {
  // 타이틀, 이모지 사진경로, 이모지 이름
  late String enameEdit; //ename
  late String emotionPath; //epath
  late TextEditingController contentEdit; //dcontent
  late int eid; // emotion
  late String dcontent;
  late String result;
  late String uid;
  @override
  void initState() {
    super.initState();

    contentEdit = TextEditingController();
    enameEdit = "";
    emotionPath = "";
    eid = 0;
    result = '';
    uid = widget.uID;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('My Mood'),
        backgroundColor: Colors.grey[100],
        foregroundColor: Colors.brown,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            color: Colors.brown[100],
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    // 기분 상태 아이콘
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            emotionPath = 'images/perfect.png';
                            enameEdit = '완벽해';
                            eid = 7;
                          });
                        },
                        child: Column(
                          children: [
                            const CircleAvatar(
                              // db에서 받아온 이미지패스경로받기
                              backgroundImage: AssetImage('images/perfect.png'),
                              radius: 50,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              // 이미지 이름
                              '완벽해',
                              style: enameEdit == '완벽해'
                                  ? const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold)
                                  : const TextStyle(
                                      color: Colors.black,
                                    ), /*enameEdit*/
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            emotionPath = 'images/sohappy.png';
                            enameEdit = '너무행복해';
                            eid = 6;
                          });
                        },
                        child: Column(
                          children: [
                            const CircleAvatar(
                              backgroundImage: AssetImage('images/sohappy.png'),
                              radius: 50,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              // 이미지 이름
                              '너무행복해',
                              style: enameEdit == '너무행복해'
                                  ? const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold)
                                  : const TextStyle(
                                      color: Colors.black,
                                    ), /*enameEdit*/
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            emotionPath = 'images/happy.png';
                            enameEdit = '행복해';
                            eid = 5;
                          });
                        },
                        child: Column(
                          children: [
                            const CircleAvatar(
                              // db에서 받아온 이미지패스경로받기
                              backgroundImage: AssetImage('images/happy.png'),
                              radius: 50,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              // 이미지 이름
                              '행복해',
                              style: enameEdit == '행복해'
                                  ? const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold)
                                  : const TextStyle(
                                      color: Colors.black,
                                    ), /*enameEdit*/
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            emotionPath = 'images/soso.png';
                            enameEdit = '그냥그래';
                            eid = 4;
                          });
                        },
                        child: Column(
                          children: [
                            const CircleAvatar(
                              // db에서 받아온 이미지패스경로받기
                              backgroundImage: AssetImage(
                                  'images/soso.png' /*emotionPath */),
                              radius: 50,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              // 이미지 이름
                              '그냥그래',
                              style: enameEdit == '그냥그래'
                                  ? const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold)
                                  : const TextStyle(
                                      color: Colors.black,
                                    ), /*enameEdit*/
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            emotionPath = 'images/sad.png';
                            enameEdit = '슬퍼';
                            eid = 3;
                          });
                        },
                        child: Column(
                          children: [
                            const CircleAvatar(
                              backgroundImage: AssetImage('images/sad.png'),
                              radius: 50,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              // 이미지 이름
                              '슬퍼',
                              style: enameEdit == '슬퍼'
                                  ? const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold)
                                  : const TextStyle(
                                      color: Colors.black,
                                    ), /*enameEdit*/
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            emotionPath = 'images/sick.png';
                            enameEdit = '아파';
                            eid = 2;
                          });
                        },
                        child: Column(
                          children: [
                            const CircleAvatar(
                              backgroundImage: AssetImage('images/sick.png'),
                              radius: 50,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              // 이미지 이름
                              '아파',
                              style: enameEdit == '아파'
                                  ? const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold)
                                  : const TextStyle(
                                      color: Colors.black,
                                    ), /*enameEdit*/
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            emotionPath = 'images/bad.png';
                            enameEdit = '기분나빠';
                            eid = 1;
                          });
                        },
                        child: Column(
                          children: [
                            const CircleAvatar(
                              backgroundImage: AssetImage('images/bad.png'),
                              radius: 50,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              // 이미지 이름
                              '기분나빠',
                              style: enameEdit == '기분나빠'
                                  ? const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold)
                                  : const TextStyle(
                                      color: Colors.black,
                                    ), /*enameEdit*/
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 300,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextField(
                    controller: contentEdit,
                    keyboardType: TextInputType.text,
                    maxLines: 10,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 2, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 2, color: Colors.brown),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          CircleAvatar(
            backgroundColor: Colors.lime[200],
            radius: 35,
            child: IconButton(
                onPressed: () {
                  dcontent = contentEdit.text;
                  insertAction();
                },
                icon: const Icon(Icons.add_circle_rounded)),
          ),
        ]),
      ),
    );
  }

  insertAction() async {
    var url = Uri.parse(
        'http://192.168.5.83:8080/Flutter/daily_add.jsp?dcontent=$dcontent&eid=$eid&uid=$uid');
    var response = await http.get(url);
    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      result = dataConvertedJSON['result'];
      if (result == 'OK') {
        _showDialog(context);
      } else {
        errorSnackBar(context);
      }
    });
  }

  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Icon(Icons.check_circle_rounded),
            content: const Text('등록이 완료 되었습니다.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
  }

  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('사용자 정보 입력에 문제가 발생하였습니다.'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }
}
