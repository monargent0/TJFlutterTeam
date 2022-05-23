import 'package:bmi_app/message.dart';
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  late String result;
//  late Color bmiColor;

  @override
  void initState() {
    result = "";
    // bmiColor = Colors.blue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("측정결과"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(
                height: 20,
              ),
              CircleAvatar(
                  backgroundImage: AssetImage(
                    BMI.imagePath,
                    ),radius: 80,
                ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'BMI: ${(BMI.bmi).toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                BMI.resultBmi,
                style: const TextStyle(fontSize: 80),
              ),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    }, 
                    child: const Text('처음으로',),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {

                        Navigator.pushNamed(context, '/bmi');

                    }, 
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green)
                    ),
                    child: const Text('다시 측정하기'),
                  )
                ],
              ),
              Image.asset(
                    'images/bmi2.jpeg',
                    width: 250,
                    height: 250,
              )
            ]),
          ),
        ),
      ),
    );
  }
}
