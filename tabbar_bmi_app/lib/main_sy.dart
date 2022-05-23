
import 'package:flutter/material.dart';
import 'package:tabbar_bmi_app/check.dart';
import 'package:tabbar_bmi_app/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class sybmi extends StatelessWidget {
  const sybmi({Key? key}) : super(key: key);

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
            const CircleAvatar(
              backgroundImage: AssetImage('images/mainpage.jpeg'),
              radius: 100,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const CheckBMI();
                    },
                  ),
                );
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.green[400])),
              child: const Text(
                "Start!",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
