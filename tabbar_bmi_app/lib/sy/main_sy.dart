
import 'package:flutter/material.dart';

class Sybmi extends StatelessWidget {
  const Sybmi({Key? key}) : super(key: key);

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
                Navigator.pushNamed(context, '/input');
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
