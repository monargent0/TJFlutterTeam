
import 'package:flutter/material.dart';
import 'package:tabbar_bmi_app/sy/message.dart';

class CheckBMI extends StatefulWidget {
  const CheckBMI({Key? key}) : super(key: key);

  @override
  State<CheckBMI> createState() => _CheckBMIState();
}

class _CheckBMIState extends State<CheckBMI> {
  late TextEditingController textEditingController1;
  late TextEditingController textEditingController2;
  late TextEditingController textEditingController3;

  @override
  void initState() {
    textEditingController1 = TextEditingController();
    textEditingController2 = TextEditingController();
    textEditingController3 = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector
    (
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My BMI'),
          backgroundColor: Colors.green[200],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 5, 50, 10),
                child: TextField(
                  controller: textEditingController1,
                  decoration: const InputDecoration(labelText: '키(cm)를 입력하세요'),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 5, 50, 10),
                child: TextField(
                  controller: textEditingController2,
                  decoration: const InputDecoration(labelText: '몸무게(kg)를 입력하세요'),
                  keyboardType: TextInputType.number,
                ),
              ),
              ElevatedButton(
                
                onPressed: () {
                  if (textEditingController1.text.trim().isEmpty &&
                      textEditingController2.text.trim().isEmpty) {
                    errorsnackbar(context);
                  }else if (textEditingController1.text.trim().isEmpty) {
                    errorsnackbar1(context);
                  }else if (textEditingController2.text.trim().isEmpty) {
                    errorsnackbar2(context);
                  }else{
                    setState(
                      () {
                      
                   double num1 =
                   int.parse(textEditingController2.text)/((int.parse(textEditingController1.text)/100)*(int.parse(textEditingController1.text)/100));
              
                   textEditingController3.text=num1.toStringAsFixed(2);
                   Message.resultBMI=textEditingController3.text;
                    },
                    );
                    Navigator.pushNamed(context, '/result');
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                child: const Text('BMI 확인하기'),
                
              ),
            ],
          ),
        ),
      ),
    );
  }

  errorsnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('키와 몸무게를 입력하세요'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

  errorsnackbar1(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('키를 입력하세요'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }

  errorsnackbar2(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('몸무게를 입력하세요'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }
}
