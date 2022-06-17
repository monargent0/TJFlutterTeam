import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;



class Dday1 extends StatefulWidget {
  const Dday1({Key? key}) : super(key: key);

  @override
  State<Dday1> createState() => _Dday1State();
}

class _Dday1State extends State<Dday1> {
  //field
int hdaytype=1;
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
  final _holidaylist = ["3일", "4일", "5일"];
  var hholiday = "3일";
//   //날씨선택
//  bool hweather =false;

 
//1종2종 교통량
  // late TextEditingController htraffic1;
  // late TextEditingController htraffic2;

  //인구수
  late TextEditingController hspop;
  

  

  @override
  void initState() {
    super.initState();

    // htraffic1 = TextEditingController();
    // htraffic2 = TextEditingController();
    hspop = TextEditingController();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('설날 D-1 소요시간 예측'),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start
        ,
        children: [
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '설날 전날 출발',
                
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              
                
              ),
            ],
          ),
        
  
          Padding(
            padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
            child: Text('출발시간',
            style: TextStyle(fontSize: 18,
            fontWeight: FontWeight.bold),),
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
          Padding(
            padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
            child: Text('연휴길이',
             style: TextStyle(fontSize: 18,
            fontWeight: FontWeight.bold),),
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
                    child: Text('$e'),
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
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(100, 0, 100, 20),
          //   child: Row(
          //     children: [
          //       Text("눈/비 오는날 ",
          //        style: TextStyle(fontSize: 18,
          //   fontWeight: FontWeight.bold),),
          //   Checkbox(value: hweather,
          //    onChanged: (check){
          //     setState(() {
          //       hweather=check!;
          //     });
          //    }),
          //     ],
          //   ),
          // ),
        
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
          //   child: Text('1종 교통량',
          //    style: TextStyle(fontSize: 18,
          //     fontWeight: FontWeight.bold),),
          // ),
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
          //   child: TextField(
          //     controller: htraffic1,
          //     decoration: const InputDecoration(labelText: '1종 교통량 입력하기 '),
          //     keyboardType: TextInputType.number,
          //   ),
          // ),
          // const SizedBox(
          //   height: 20,
          // ),
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
          //   child: Text('2종 교통량',
          //    style: TextStyle(fontSize: 18,
          //     fontWeight: FontWeight.bold),),
          // ),
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(100, 0, 100, 20),
          //   child: TextField(
          //     controller: htraffic2,
          //     decoration: const InputDecoration(labelText: '2종 교통량 입력하기 '),
          //     keyboardType: TextInputType.number,
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
            child: Text('서울 인구수',
             style: TextStyle(fontSize: 18,
              fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(100, 0, 100, 20),
            child: TextField(
              controller: hspop,
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
              style:ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.purple)
              ),
              
              onPressed: () {
             if (hspop.text.trim().isEmpty) {
                      errorsnackbar(context);
                   
                    }else{
                      setState(
                        () {
                        
                     
                      },
                      );
                    //   Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) {
                    //       return const Showresult();
                    //     },
                    //   ),
                    // );
                    };
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("소요시간 보러가기",
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
    );
  }
}
  // insertAction() async {
  //   var url = Uri.parse(
  //       'http://192.168.150.132:8080/Rserve/response_iris.jsp?sepalLength=$SLength&sepalWidth=$SWidth&petalLength=$PLength&petalWidth=$PWidth');
  //   var response = await http.get(url);
  //   setState(() {
  //     var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
  //     result = dataConvertedJSON['result'];
  //     if (result == 'setosa') {
  //       // img = "images/setosa.jpg";
  //     }
  //     if (result == 'versicolor') {
  //       // img = "images/versicolor.jpg";
  //     }
  //     if (result == 'virginica') {
  //       // img = "images/virginica.jpg";
  //     }
  //     _showDialog(context);
  //   });
  // }


   errorsnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('서울인구수를 입력하세요'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }
