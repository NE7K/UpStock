import 'package:flutter/material.dart';
import 'package:upstock/bottom/bottom.dart';

import 'package:upstock/header/header.dart'; // header.dart
import 'package:upstock/profile.dart';

import 'package:upstock/style/style.dart' as style; // style.dart

import 'package:fl_chart/fl_chart.dart';

import 'home.dart'; // fl_chart
import 'profile.dart';

void main() {
  runApp(
      MaterialApp(
        theme: style.theme,
          home: MyApp()
      )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // 함수
  var tab = 0; // tab index

  @override
  void initState() {
    super.initState();
    // 앱 실행 시 로그인 if 문 처리, firebase에서도 rule처리 해줘야 함.

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: header,
      body: [Home(), Text('2번째 페이지'), Profile()][tab],
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false, // 선택된 라벨 표시 false
          showUnselectedLabels: false,
          onTap: (i) {
            setState(() {
              tab = i;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '프로필'),
            BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined), label: '미정'),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: '프로필'),
          ]
      )
    );
  }
}