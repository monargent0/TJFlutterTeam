import 'dart:convert';

import 'package:beepbeep_app/chart/chartRouter.dart';
import 'package:beepbeep_app/login/myPage.dart';
import 'package:beepbeep_app/predict/myhistory.dart';
import 'package:beepbeep_app/predict/predictRouter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TabPage extends StatefulWidget {
  final Map busers;
  const TabPage({Key? key, required this.busers}) : super(key: key);

  @override
  State<TabPage> createState() => _TabPageState();
}

// 탭바 메인 페이지
class _TabPageState extends State<TabPage> with SingleTickerProviderStateMixin {
  late TabController controller;

  late List data;
  late String buid;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
    buid = widget.busers['buid'];
    data = [];
    getJSONData();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('images/beeplogo.png'),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MyPage(busers: widget.busers['buid']); // Map으로 보내
                  },
                ),
              ).then((value) => getJSONData());
            },
            icon: const Icon(Icons.settings),
            color: Colors.deepPurple,
          )
        ],
      ),
      body: Center(
        child: TabBarView(controller: controller, children: [
          MyPredict(busers: widget.busers),
          const MyChart(),
          MyHistory(busers: widget.busers)
        ]),
      ),
      backgroundColor: Colors.indigo[50],
      bottomNavigationBar: TabBar(
        onTap: (value) {
          setState(() {
            //
          });
        },
        controller: controller,
        labelColor: Colors.deepPurple,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
        indicatorColor: Colors.indigo,
        unselectedLabelColor: Colors.black,
        tabs: [
          Tab(
            icon: Icon(
              Icons.browse_gallery_outlined,
              color: controller.index == 0 ? Colors.deepPurple : Colors.black,
            ),
            text: "시간 예측",
          ),
          Tab(
            icon: Icon(
              Icons.insert_chart_outlined_outlined,
              color: controller.index == 1 ? Colors.deepPurple : Colors.black,
            ),
            text: "데이터 차트",
          ),
          Tab(
            icon: Icon(
              Icons.person_outline,
              color: controller.index == 2 ? Colors.deepPurple : Colors.black,
            ),
            text: "나의 내역",
          ),
        ],
      ),
    );
  }

  // 회원정보 불러오기
  Future<bool> getJSONData() async {
    data = [];
    var url = Uri.parse(
        'http://172.30.27.43:8080/Flutter/beep_mypage.jsp?buid=$buid');
    var response = await http.get(url);

    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      List result = dataConvertedJSON['results'];
      data.addAll(result);
    });

    return true;
  }
}
