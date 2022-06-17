import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }

class Dday extends StatefulWidget {
  const Dday({Key? key}) : super(key: key);

  @override
  State<Dday> createState() => _DdayState();
}

class _DdayState extends State<Dday> {
  //field
  late TextEditingController hstart;
  late TextEditingController hholiday;
  late TextEditingController hweather;
  late TextEditingController htraffic1;
  late TextEditingController htraffic2;

  late String dropdownValue;
  late int Time;
  late String PLength;
  late String PWidth;
  late String result;

  @override
  void initState() {
    super.initState();
    hstart = TextEditingController();
    hholiday = TextEditingController();
    hweather = TextEditingController();
    htraffic1 = TextEditingController();
    htraffic2 = TextEditingController();

    result = "";
    dropdownValue="00";
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('d-day 소요시간 예측'),
        backgroundColor: Colors.purple
        ,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
               SizedBox(height: 20,),
              Text('설날 당일 출발',
              style: TextStyle(fontSize: 25),),
              SizedBox(height: 20,),
               Text('시간'),
              GestureDetector(
                child: DropdownButton(
                    value: dropdownValue,
                    items: 
                      ["00","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","!9","20","21","22","23"].map((e) => 
                        DropdownMenuItem(
                        value: e,
                        child: Text('$e시'),
                      )
                      ).toList(),
                      onTap: (){
                        value :e;
                      },
                    onChanged: (value) {
                      
                      
                    },
                    underline: Container( ),
                  ),
              ),
                

              // TextField(
              //   controller: sepalLength,
              //   decoration: const InputDecoration(
              //       labelText: 'Sepal Length의 크기를 입력하세요 '),
              //   keyboardType: TextInputType.text,
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // TextField(
              //   controller: sepalWidth,
              //   decoration:
              //       const InputDecoration(labelText: 'Sepal Width의 크기를 입력하세요 '),
              //   keyboardType: TextInputType.text,
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // TextField(
              //   controller: petalLength,
              //   decoration: const InputDecoration(
              //       labelText: 'Petal Length의 크기를 입력하세요 '),
              //   keyboardType: TextInputType.text,
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // TextField(
              //   controller: petalWidth,
              //   decoration:
              //       const InputDecoration(labelText: 'Pepal Width의 크기를 입력하세요 '),
              //   keyboardType: TextInputType.text,
              // ),
              // const SizedBox(
              //   height: 30,
              // ),
              ElevatedButton(
                onPressed: () {
                  // SLength = sepalLength.text;
                  // SWidth = sepalWidth.text;
                  // PLength = petalLength.text;
                  // PWidth = petalWidth.text;
                  // insertAction();
                },
                child: const Text("입력"),
              ),
              const SizedBox(
                height: 30,
              ),
              // CircleAvatar(
              //   backgroundImage: AssetImage(img),
              //   radius: 100,
              // ),
            ],
          ),
        ),
      ),
    );
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

  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('품종 예측 결과'),
            content: Text("입력하신 품종은 $result 입니다"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        });
  }
}

time(){
  for(int i=0; i<=23 ;i++){
    return i;
  }
}