import 'package:flutter/material.dart';
import 'package:tabbar_bmi_app/jjh_main.dart';
import 'package:tabbar_bmi_app/dongwon.dart';
import 'package:tabbar_bmi_app/jungeun.dart';
import 'package:tabbar_bmi_app/sanga.dart';

import 'main_sy.dart';

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
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  // property
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      // appBar: AppBar(
      //   title: const Text('BMI Team'),
      // ),
      body: TabBarView(
        controller: controller,
        children: const [BMIPage(), Sanga(), Sybmi(),JJH(),JungEun()], //동원 , 상아, 수연, 재환, 정은
      ),
      bottomNavigationBar: Container(
        color: Colors.lightBlue[100],
        height: 100,
        child: TabBar(
          controller: controller,
          labelColor: Colors.deepPurple,
          indicatorColor: Colors.blue,
          tabs: const [
            Tab(
              icon: Icon(
                Icons.looks_one,
                color: Colors.red,
              ),
              text: "동원",
            ),
            Tab(
              icon: Icon(
                Icons.looks_two,
                color: Colors.orange,
              ),
              text: '상아',
            ),
            Tab(
              icon: Icon(
                Icons.looks_3,
                color: Colors.yellow,
              ),
              text: '수연',
            ),
            Tab(
              icon: Icon(
                Icons.looks_4,
                color: Colors.green,
              ),
              text: '재환',
            ),
            Tab(
              icon: Icon(
                Icons.looks_5,
                color: Colors.blue,
              ),
              text: '정은',
            ),
          ],
        ),
      ),
    );
  }
}
