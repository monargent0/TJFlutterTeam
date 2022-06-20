import 'package:beepbeep_app/chart/chartRouter.dart';
import 'package:beepbeep_app/predict/myhistory.dart';
import 'package:beepbeep_app/predict/predictRouter.dart';
import 'package:beepbeep_app/predict/selectPredictPage.dart';
import 'package:beepbeep_app/predict/resultPredict.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TabPage extends StatefulWidget {
  final Map busers;
  const TabPage({Key? key, required this.busers}) : super(key: key);

  @override
  State<TabPage> createState() => _TabPageState();
}

// 탭바 메인 페이지
class _TabPageState extends State<TabPage> with SingleTickerProviderStateMixin {
  late TabController controller;

  late String buid;
  late String bname;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
    buid = widget.busers['buid'];
    bname = widget.busers['bname'];
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
        title: const Text('BEEP BEEP!'),
      ),
      body: Center(
        child: TabBarView(controller: controller, children: [
          MyPredict(busers: widget.busers),
          const MyChart(),
          MyHistory(busers: widget.busers)
        ]),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('안녕하세요 @@님'),
              accountEmail: Text('Pikachu@gmail.com'),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                //
              },
              leading: const Icon(
                Icons.route_outlined,
                color: Colors.black,
              ),
              title: const Text('시간예측'),
            ),
            ListTile(
              onTap: () {
                //
              },
              leading: const Icon(
                Icons.bar_chart_outlined,
                color: Colors.black,
              ),
              title: const Text('데이터분석'),
            ),
            ListTile(
              onTap: () {
                //
              },
              leading: const Icon(
                Icons.person,
                color: Colors.black,
              ),
              title: const Text('나의 이력'),
            ),
            SizedBox(
              height: 170,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.settings,
                ),
                TextButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, '/update');
                  },
                  child: const Text(
                    '회원정보 수정',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ),
              ],
            ),
          ],
        ),
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
}
