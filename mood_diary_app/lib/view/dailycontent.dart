import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:mood_diary_app/view/dailylist.dart';

class DailyContent extends StatefulWidget {
  final Map diaryList;
  const DailyContent({Key? key, required this.diaryList}) : super(key: key);

  @override
  State<DailyContent> createState() => _DailyContentState();
}

class _DailyContentState extends State<DailyContent> {
  // 타이틀, 이모지 사진경로, 이모지 이름
  late String enameEdit; //ename
  late String emotionPath; //epath
  late TextEditingController contentEdit; //dcontent
  late int did; //did
  late int eid;
  late String result;

  @override
  void initState() {
    super.initState();

    contentEdit = TextEditingController();
    enameEdit = widget.diaryList['ename'];
    emotionPath = widget.diaryList['epath'];
    contentEdit.text = widget.diaryList['dcontent'];
    did = widget.diaryList['did'];
    eid = widget.diaryList['eid'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: const Text('나의 감정 기록'),
        backgroundColor: Colors.brown[100],
        elevation: 0,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        SingleChildScrollView(
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
                      });
                    },
                    child: Column(
                      children: [
                        const CircleAvatar(
                          // db에서 받아온 이미지패스경로받기
                          backgroundImage:
                              AssetImage('images/soso.png' /*emotionPath */),
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
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: contentEdit,
                maxLines: 20,
              ),
            ],
          ),
        ),
        // SizedBox(
        //   height: 300,
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //수정
            FloatingActionButton(
                foregroundColor: Colors.black,
                child: const Icon(Icons.edit_note_rounded),
                onPressed: () {
                  _showDialog(context);
                }),
            //삭제
            FloatingActionButton(
                foregroundColor: Colors.black,
                child: const Icon(Icons.delete_forever_rounded),
                onPressed: () {
                  _showDeleteDialog(context);
                  //// 데이터가 있을수도 없을수도 있기 때문
                }),
          ],
        ),
      ]),
    );
  }

  //function
  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Icon(Icons.edit_note_rounded),
          content: const Text('수정하시겠습니까?'),
          actions: [
            Center(
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: const Text('취소'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                      updateAction();
                      _showfinishDialog(context);
                    },
                    child: const Text('확인'),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  updateAction() async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/daily_update.jsp?dcontent=$contentEdit&eid=$eid&did=$did');
    var response = await http.get(url);
    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      List result = dataConvertedJSON['result'];
    });
  }

  _showfinishDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Icon(Icons.edit_note_rounded),
            content: const Text('수정이 완료되었습니다.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                  Navigator.of(context).pop();
                },
                child: const Text('확인'),
              ),
            ],
          );
        });
  }

  DeleteAction() async {
    var url =
        Uri.parse('http://localhost:8080/Flutter/daily_delete.jsp?&did=$did');
    var response = await http.get(url);
    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      result = dataConvertedJSON['result'];
      if (result == 'OK') {
        _showDeleteDialog2(context);
      } else {
        errorSnackBar(context);
      }
    });
  }

  _showDeleteDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Icon(
              Icons.delete_forever_outlined,
              color: Colors.red,
              size: 30,
            ),
            content: const Text('삭제하시겠습니까?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                  Navigator.of(context).pop();
                },
                child: const Text(
                  '취소',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  // Navigator.of(ctx).pop();
                  // Navigator.of(context).pop();
                  DeleteAction();
                },
                child: const Text('확인'),
              ),
            ],
          );
        });
  }

  _showDeleteDialog2(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Icon(
              Icons.task_alt,
              color: Colors.blue,
              size: 30,
            ),
            content: const Text('삭제가 완료 되었습니다.'),
            actions: [
              TextButton(
                onPressed: () {
                  // Navigator.of(ctx).pop();
                  // Navigator.of(context).pop();

                  setState(() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DailyList(),
                        )).then((value) => getData());
                  });
                },
                child: const Text('확인'),
              ),
            ],
          );
        });
  }

  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('데이터 삭제에 문제가 발생하였습니다.'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

  getData() {
    enameEdit;
    emotionPath;
    contentEdit.text;
    did;
    eid;
  }
}
// -- Functions           비동기 방식
// Future<bool> getJSONData() async {
//   data = []; // window는 ip어드레스 적어주어야 한다***
//   var url =
//       Uri.parse('http://localhost:8080/Flutter/daily_detailView_select.jsp');
//   var response = await http.get(url); // get방식을 많이사용 -> 사용 후 암호화

//   // 화면구성이 되었을 때 setState를 사용해준다.
//   setState(() {
//     var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
//     List result = dataConvertedJSON['results'];
//     // result value의 해당 데이터 2개를 가져옴

//     data.addAll(result);
//   });
//   return true;
// }
