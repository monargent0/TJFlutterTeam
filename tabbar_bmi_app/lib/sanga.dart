import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Sanga(),
    );
  }
}

class Sanga extends StatefulWidget {
  const Sanga({Key? key}) : super(key: key);

  @override
  State<Sanga> createState() => _SangaState();
}

class _SangaState extends State<Sanga> {
  // Peroperty
  late TextEditingController heightController;
  late TextEditingController weightController;
  late String calcResult;

  @override
  void initState() {
    super.initState();
    heightController = TextEditingController();
    weightController = TextEditingController();
    calcResult = '';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('고장난 BMI 계산기'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: heightController,
                decoration: const InputDecoration(
                  labelText: '신장을 입력하세요.(단위:cm)'
                  ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: weightController,
                decoration: const InputDecoration(labelText: '몸무게를 입력하세요.(단위:kg)'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  // ---
                   calcFunction();
                  },
                   
                
                child: const Text('BMI 계산'),
              ),
              const SizedBox(
                width: 30,
              ),
              Text(calcResult,style: const TextStyle
              (color: Colors.red,fontSize:20, fontWeight:FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

 // Function
  calcFunction() {
        if(heightController.text.trim().isEmpty||weightController.text.trim().isEmpty){
                      errorSnackBar(context);
        }
  }

errorSnackBar(BuildContext context) {
  setState(() {
    calcResult = '';
  });
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('숫자를 입력하세요!'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red
    ));
  }

  removeResult() {
    heightController.clear();
     weightController.clear();
  }


} // End