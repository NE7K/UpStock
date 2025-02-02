import 'package:flutter/material.dart';

// 외부 package import
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';

// 내부 파일 Import
import 'home.dart'; // fl_chart
import 'profile.dart';
import 'package:upstock/profile.dart';
import 'package:upstock/style/style.dart' as style; // style.dart

void main() {
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (c) => Store())
          ],
          child: MaterialApp(
              theme: style.theme,
              home: MyApp()
          )
      )
  );
}

class Store extends ChangeNotifier { // 함수 관리
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // 함수
  var tab = 0;

  @override
  void initState() {
    super.initState();
    // 앱 실행 시 로그인 if 문 처리, firebase에서도 rule처리 해줘야 함.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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