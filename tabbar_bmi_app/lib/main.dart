import 'package:flutter/material.dart';

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
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
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
      appBar: AppBar(
        title: const Text('BMI Team'),
      ),
      body: TabBarView(
        controller: controller,
        children: const [sybmi()],
      ),
      bottomNavigationBar: Container(
        color: Colors.deepOrange[200],
        height: 100,
        child: TabBar(
          controller: controller,
          labelColor: Colors.redAccent,
          indicatorColor: Colors.red,
          tabs: const [
            Tab(
              icon: Icon(
                Icons.looks_one,
                color: Colors.green,
              ),
              text: "동원",
            ),
            Tab(
              icon: Icon(
                Icons.looks_two,
                color: Colors.blue,
              ),
              text: '상아',
            ),
            Tab(
              icon: Icon(
                Icons.looks_two,
                color: Colors.blue,
              ),
              text: '수연',
            ),
            Tab(
              icon: Icon(
                Icons.looks_two,
                color: Colors.blue,
              ),
              text: '재환',
            ),
            Tab(
              icon: Icon(
                Icons.looks_two,
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
