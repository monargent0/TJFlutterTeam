import 'package:beepbeep_app/login/searchPwPage.dart';
import 'package:flutter/material.dart';
import 'searchIdPage.dart';

class SearchMainPage extends StatefulWidget {
  const SearchMainPage({Key? key}) : super(key: key);

  @override
  State<SearchMainPage> createState() => _SearchMainPageState();
}

class _SearchMainPageState extends State<SearchMainPage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            '아이디 ・ 비밀번호 찾기',
            style: TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.deepPurple,
          elevation: 0,
          centerTitle: true,
          bottom: TabBar(
              controller: controller,
              labelColor: Colors.deepPurple,
              tabs: const [
                Tab(
                  text: '아이디 찾기',
                ),
                Tab(
                  text: '비밀번호 찾기',
                ),
              ]),
          // 뒤로가기 버튼
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: TabBarView(
          controller: controller, 
          children: const [
          SearchIdPage(),
          SearchPwPage(),
          ]),
      );
}