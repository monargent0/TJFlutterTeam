import 'dart:convert';

import 'package:beepbeep_app/chart/chartRouter.dart';
import 'package:beepbeep_app/login/myPage.dart';
import 'package:beepbeep_app/predict/myhistory.dart';
import 'package:beepbeep_app/predict/predictRouter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TabPage extends StatefulWidget {
  final Map busers; // 생성자, Map으로 회원 아이디 받기
  const TabPage({Key? key, required this.busers}) : super(key: key);

  @override
  State<TabPage> createState() => _TabPageState();
}

// 탭바 메인 페이지
class _TabPageState extends State<TabPage> with SingleTickerProviderStateMixin {
  late TabController controller; // 탭바 컨트롤러

  late String buid; // 회원 아이디 받을 변수

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this); // 탭바 3개
    buid = widget.busers['buid']; // Map방식으로 받은 회원아이디
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
          // 상단바 오른쪽
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MyPage(
                        busers: widget.busers); // 마이페이지로 이동, map 정보 포함
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
          MyPredict(busers: widget.busers), // 시간 예측 화면
          const MyChart(), // 그래프 화면
          MyHistory(busers: widget.busers) // 예측 이력 화면
        ]),
      ),
      backgroundColor: Colors.indigo[50], // 탭바 색
      bottomNavigationBar: TabBar(
        onTap: (value) {
          setState(() {
            //
          });
        },
        controller: controller, // 탭바 컨트롤러
        labelColor: Colors.deepPurple, // 선택시 라벨 색
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
        indicatorColor: Colors.deepPurple, // 선택시 하단 바
        unselectedLabelColor: Colors.black, // 기본 라벨 색
        tabs: [
          Tab(
            icon: Icon(
              Icons.browse_gallery_outlined,
              color: controller.index == 0
                  ? Colors.deepPurple
                  : Colors.black, // 선택시 아이콘 색 변경
            ),
            text: "시간 예측",
          ),
          Tab(
            icon: Icon(
              Icons.insert_chart_outlined_outlined,
              color: controller.index == 1
                  ? Colors.deepPurple
                  : Colors.black, // 선택시 아이콘 색 변경
            ),
            text: "데이터 차트",
          ),
          Tab(
            icon: Icon(
              Icons.person_outline,
              color: controller.index == 2
                  ? Colors.deepPurple
                  : Colors.black, // 선택시 아이콘 색 변경
            ),
            text: "나의 내역",
          ),
        ],
      ),
    );
  }

  // 회원정보 불러오기
  Future<bool> getJSONData() async {
    // data = [];
    var url = Uri.parse(
        'http://172.30.27.43:8080/Flutter/beep_mypage.jsp?buid=$buid');
    var response = await http.get(url);

    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      List result = dataConvertedJSON['results'];
      // data.addAll(result);
    });

    return true;
  }
}
