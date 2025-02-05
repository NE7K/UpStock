import 'package:flutter/material.dart';

// 외부 package import
import 'package:provider/provider.dart';
import 'package:http/http.dart';
import 'package:upstock/test.dart';

// 내부 파일 Import
import 'home.dart'; // fl_chart
import 'profile/profile.dart';
import 'package:upstock/profile/profile.dart';
import 'package:upstock/style/style.dart' as style; // style.dart


// firebase set import
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
    // 앱 실행 시 로그인 if 문 처리 (로그인되어 있지 않으면 바로 다시 navigator 적용), firebase에서도 rule처리 해줘야 함.

    // 앱 실행 시 로그인 체크 -> 계정 관련된 것 저장

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: [Home(), Test(), Profile()][tab],

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