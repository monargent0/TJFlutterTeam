import 'package:beepbeep_app/main/selectPredictPage.dart';
import 'package:beepbeep_app/main/resultPredict.dart';
import 'package:beepbeep_app/main/userPredict.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TabPage extends StatefulWidget {
  const TabPage({Key? key}) : super(key: key);

  @override
  State<TabPage> createState() => _TabPageState();
}
// 탭바 메인 페이지
class _TabPageState extends State<TabPage> 
  with SingleTickerProviderStateMixin {

  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BEEP BEEP!'),
      ),
      body: Center(
        child: TabBarView(
          controller: controller,
          children: const [MainPage(), UserRecord()]
        ),
        
      ),
      bottomNavigationBar: Container(
        child: TabBar(
          onTap:(value) {
            //
          },
          controller: controller,
          labelColor: Colors.cyan,
          indicatorColor: Colors.indigo,
          tabs: const [
              Tab(
                
                icon: Icon(
                  Icons.pie_chart,
                  color: Colors.black,
                ),
                text: "데이터분석",
              ),
               Tab(
                icon: Icon(
                  Icons.person_outline,
                  color: Colors.black,
                ),
                text: "나의 내역",
              ),
          ],
        ),
      ),
    );
  }
}