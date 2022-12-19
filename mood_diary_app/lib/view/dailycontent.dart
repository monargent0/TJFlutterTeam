import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
  late int did; // diary
  late int eid; // emotion
  late String content; // diary Json에 사용
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
    result = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'My Mood',
        ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // 수정
              CircleAvatar(
                backgroundColor: Colors.lime[200],
                radius: 35,
                child: IconButton(
                    onPressed: () {
                      content = contentEdit.text;
                      _editShowDialog(context);
                    },
                    icon: const Icon(Icons.edit_note_rounded)),
              ),
              // 삭제
              CircleAvatar(
                backgroundColor: Colors.pink[200],
                radius: 35,
                child: IconButton(
                    onPressed: () {
                      _showDeleteDialog(context);
                    },
                    icon: const Icon(Icons.delete_forever_rounded)),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  //---function

  // 수정 의사 확인 알림창
  _editShowDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Icon(
            Icons.edit_note_rounded,
            color: Colors.amber,
          ),
          content: const Text('            수정하시겠습니까?'),
          actions: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: const Text(
                      '취소',
                      style: TextStyle(color: Colors.amber),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // print('$content , $eid , $did'); // 내용 확인
                      Navigator.of(ctx).pop();
                      updateAction();
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

// 수정 JSON
  Future<String> updateAction() async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/daily_update.jsp?dcontent=$content&eid=$eid&did=$did');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    result = dataConvertedJSON['result'];

    //print(result);

    setState(() {
      if (result == 'OK') {
        _showfinishDialog(context);
      } else {
        editerrorSnackBar(context);
      }
    });

    return result;
  }

// 수정 완료 후 List로 pop
  _showfinishDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Icon(
              Icons.task_alt,
              color: Colors.amber,
            ),
            content: const Text('         수정이 완료되었습니다.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                  Navigator.of(context).pop();
                },
                child: const Center(child: Text('확인')),
              ),
            ],
          );
        });
  }

// 수정 실패 시 에러바
  editerrorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('수정에 실패하였습니다.'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.redAccent,
      ),
    );
  } // error

//-------------------------------------------

// 삭제 의사 확인 알림창
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
            content: const Text('            삭제하시겠습니까?'),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
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
                      Navigator.of(ctx).pop();
                      deleteAction();
                    },
                    child: const Text('확인'),
                  ),
                ],
              ),
            ],
          );
        });
  }

// 삭제 JSON
  Future<String> deleteAction() async {
    var url =
        Uri.parse('http://localhost:8080/Flutter/daily_delete.jsp?did=$did');
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
                  Navigator.of(ctx).pop();
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
} // end
