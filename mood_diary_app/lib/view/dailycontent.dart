import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DailyContent extends StatefulWidget {
  const DailyContent({Key? key}) : super(key: key);

  @override
  State<DailyContent> createState() => _DailyContentState();
}

class _DailyContentState extends State<DailyContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: const Text('-'),
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
                GestureDetector(
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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      emotionPath = 'images/sohappy.png';
                      enameEdit = '너무행복해';
                    });
                  },
                  child: Column(
                    children: [
                      CircleAvatar(
                        // db에서 받아온 이미지패스경로받기
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
                            ? TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold)
                            : TextStyle(
                                color: Colors.black,
                              ), /*enameEdit*/
                      ),
                    ],
                  ),
                ),
                GestureDetector(
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
                GestureDetector(
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
                GestureDetector(
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
                GestureDetector(
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
                GestureDetector(
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
            FloatingActionButton(
                foregroundColor: Colors.black,
                child: const Icon(Icons.edit_note_rounded),
                backgroundColor: Colors.blue,
                onPressed: () {
                  //// 데이터가 있을수도 없을수도 있기 때문
                }),
            FloatingActionButton(
                foregroundColor: Colors.black,
                child: const Icon(Icons.delete_forever_rounded),
                backgroundColor: Colors.blue,
                onPressed: () {
                  //// 데이터가 있을수도 없을수도 있기 때문
                }),
          ],
        ),
      ]),
    );
  }
}
