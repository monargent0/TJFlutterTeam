import 'package:beepbeep_app/predict/resultPredict.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Dday1 extends StatefulWidget {
  final Map busers; 
  const Dday1({Key? key, required this.busers}) : super(key: key);

  @override
  State<Dday1> createState() => _Dday1State();
}

class _Dday1State extends State<Dday1> {
  //입력 받을 변수들

  int hdaytype = 1;
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
  //2.연휴길이 설정
  final _holidaylist = ["3", "4", "5"];
  var hholiday = "3";

////6.인구수
  late TextEditingController hspoptext;
  late String hspop;

  //계산결과  즉 소요시간
  late String result;

  late String buid;

  @override
  void initState() {
    super.initState();
    buid = widget.busers['buid'];
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
                    '설날 전날 출발',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              //시간선택
              Padding(
                padding: const EdgeInsets.fromLTRB(100, 100, 100, 0),
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
                  style: TextStyle( fontSize: 20),
                  iconSize: 50,
                ),
              ),

              //연휴길이 선택
              Padding(
                padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                child: Text(
                  '연휴길이',
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
                  value: hholiday,
                  items: _holidaylist.map(
                    (e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text('$e일'),
                      );
                    },
                  ).toList(),
                  onChanged: (value) {
                    setState(() {
                      hholiday = value.toString();
                    });
                  },
                  elevation: 2,
                  style: TextStyle(color: Colors.purple, fontSize: 20),
                  iconSize: 50,
                ),
              ),

              //인구수 입력

              Padding(
                padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                child: Text(
                  '서울 인구수',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
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

                  style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple[100],
                fixedSize: const Size(200, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: const BorderSide(color: Colors.deepPurple),
                ),
              ),
                  onPressed: () async{
                    if (hspoptext.text.trim().isEmpty) {
                      errorsnackbar(context);
                    } else {
                      hspop = hspoptext.text;
                      await insertAction();
                      Navigator.push(context, 
                      MaterialPageRoute(
                        builder: (context) {
                          // 예측값 보내기
                          return ResultPredict(busers: widget.busers, result: result);
                        },),
                        );
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
                           fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
         floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },),
      ),
    );
  }

  insertAction() async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/beep_predict_1.jsp?hdaytype=$hdaytype&hstart=$hstart&hholiday=$hholiday&hspop=$hspop&buser_buid=$buid');
    var response = await http.get(url);
    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      result = dataConvertedJSON['result'];
    });
  }

  errorsnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('서울인구수를 입력하세요'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }
}
