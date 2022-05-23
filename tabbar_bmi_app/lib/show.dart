
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'message.dart';

class Showresult extends StatefulWidget {
  const Showresult({Key? key}) : super(key: key);

  @override
  State<Showresult> createState() => _ShowresultState();
}

class _ShowresultState extends State<Showresult> {
 double resultb= double.parse(Message.resultBMI);
 late String img;
 late String name1;
 @override
  void initState() {
 img='images/1.png';
 name1="정상";
 showimage();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      
      appBar: AppBar(
        title: const Text('My BMI'),
        backgroundColor: Colors.green[200],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '당신의 BMI 지수는?',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              Message.resultBMI,
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
      CircleAvatar(
        backgroundImage: AssetImage(img),
        radius: 50,
      ),
      Text(
        name1,
        style: TextStyle(fontSize: 25),
      ),
      Image.asset(
          'images/chart.png',
          width: 400,
          height: 400,
      ),
          ],
        ),
      ),
    );
  }

showimage() {
  if (resultb >= 30) {
    setState(() {
     img='images/3.png';
     name1="고도비만";
      
    });
  
  } else if (resultb>= 25) {
   setState(() {
      img='images/2.png';
     name1="비만";
   });
    
  } else if (resultb >= 23) {
     setState(() {
      img='images/1.png';
      name1="과체중";
     
   });
  } else if (resultb >= 18.5) {
   setState(() {
      img='images/normal.png';
     name1="정상체중";
   });
  } else {
    setState(() {
      img='images/low.png';
      name1="저체중";
     
   });
  }
}
}
