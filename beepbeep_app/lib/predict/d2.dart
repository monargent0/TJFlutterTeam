import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Dday2 extends StatefulWidget {
  const Dday2({Key? key}) : super(key: key);

  @override
  State<Dday2> createState() => _Dday2State();
}

class _Dday2State extends State<Dday2> {
  //입력 받을 변수들

  int hdaytype = 2;
  //1.시간 설정
  final _timelist = [
    "00",
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
    "09",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23"
  ];
  var hstart = "00";

//4.1종교통량
  late TextEditingController htraffic1text;
  late String htraffic1;
//5.2종 교통량
  late TextEditingController htraffic2text;
  late String htraffic2;
////6.인구수
  late TextEditingController hspoptext;
  late String hspop;

  //계산결과  즉 소요시간
  late String result;

  @override
  void initState() {
    super.initState();

    htraffic1text = TextEditingController();
    htraffic2text = TextEditingController();
    hspoptext = TextEditingController();
    result = "";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        FocusScope.of(context).unfocus();
      }),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('d-2 소요시간 예측'),
          backgroundColor: Colors.purple,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),

              //제목
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '설날 전전날 출발',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              //시간선택
              Padding(
                padding: const EdgeInsets.fromLTRB(100, 20, 100, 0),
                child: Text(
                  '출발시간',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(100, 0, 100, 20),
                child: DropdownButton(
                  isExpanded: true,
                  underline: Container(
                    height: 2,
                    color: Colors.purple,
                  ),
                  value: hstart,
                  items: _timelist.map(
                    (e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text('$e시'),
                      );
                    },
                  ).toList(),
                  onChanged: (value) {
                    setState(() {
                      hstart = value.toString();
                    });
                  },
                  elevation: 2,
                  style: TextStyle(color: Colors.purple, fontSize: 20),
                  iconSize: 50,
                ),
              ),

              //1종 교통량 입력
              Padding(
                padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                child: Text(
                  '1종 교통량',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                child: TextField(
                  controller: htraffic1text,
                  decoration: const InputDecoration(labelText: '1종 교통량 입력하기 '),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              //2종 교통량 입력
              Padding(
                padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                child: Text(
                  '2종 교통량',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(100, 0, 100, 20),
                child: TextField(
                  controller: htraffic2text,
                  decoration: const InputDecoration(labelText: '2종 교통량 입력하기 '),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                child: Text(
                  '서울 인구수',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),

              //인구수 입력
              Padding(
                padding: const EdgeInsets.fromLTRB(100, 0, 100, 20),
                child: TextField(
                  controller: hspoptext,
                  decoration: const InputDecoration(labelText: '서울 인구수 입력하기 '),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(120, 0, 100, 20),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.purple)),

                  onPressed: () {
                    if (htraffic1text.text.trim().isEmpty ||
                        htraffic2text.text.trim().isEmpty ||
                        hspoptext.text.trim().isEmpty) {
                      errorsnackbar(context);
                    } else {
                      htraffic1 = htraffic1text.text;
                      htraffic2 = htraffic2text.text;
                      hspop = hspoptext.text;
                      setState(
                        () {},
                      );
                      Navigator.of(context, rootNavigator: true)
                          .pushNamed('/result');
                    }
                  },

                  // 소요시간 보러가기 버튼
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "소요시간 보러가기",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  insertAction() async {
    var url = Uri.parse(
        'http://192.168.150.132:8080/Rserve/beep_predict.jsp?hdaytype=$hdaytype&hstart=$hstart&htraffic1=$htraffic1&htraffic2=$htraffic2&hspop=$hspop');
    var response = await http.get(url);
    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      result = dataConvertedJSON['result'];
    });
  }

  errorsnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('1,2종 교통량과 서울인구수를 입력하세요'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }
}