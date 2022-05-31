import 'package:flutter/material.dart';
import 'package:mood_diary_app/view/login.dart';
import 'package:mood_diary_app/view/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mood Diary',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      routes: {
        '/signin': (context) => const LoginPage(), // 로그인 화면
        '/signup': (context) => const RegisterPage(), // 회원 가입 화면
        // 그 외 화면 이동은 MaterialRoute방식으로 사용
      },
      initialRoute: '/signin',
      debugShowCheckedModeBanner: false,
    );
  }
}

// @@@@ user 테이블 이름 워크벤치에서 오류나서 users로 수정!! @@@@ 
// tree 연결 , add화면 추가 하면 끝! 

// 로그인 페이지 완성 
// 회원가입 기능 확인
// 리스트 완성 , 로그아웃 버튼 추가
// List에서 카드 누르면 상세페이지로 이동 확인
// 수정 삭제 완성 - 돌아오면 새로고침 확인 

// Constructor 넘기는 dart
// DailyList페이지 Map방식으로 users 정보 받음 ( 최소 uid 필수)
// DailyContent Map방식으로 diaryList받음 (emotion,diary table)
// DailyAdd페이지 String uid 받음  

// TO.동원오빠..
// jsp 파일 daily_로 시작하게 수정부탁.. , treeWgt constructor 뭐 넘겨야 하는지 알려주세요,, 
// 회원가입 할 때 비밀번호 확인 입력 안해도 넘어가는것 같음 isEmpty 조건 추가,, 부탁,,
// 회원 가입 성공 후 로그인 화면으로 이동도.....! 

// DailyAdd 아무도 안 만들었어 ㅠㅠ ?? -> dailyContent 복사하고 조금만 수정하면 될 듯!