import 'package:flutter/material.dart';

// 외부 package import
import 'package:provider/provider.dart';
import 'package:upstock/upload/test.dart';

// 내부 파일 Import
import 'home/home.dart'; // fl_chart
import 'profile/profile.dart';
import 'package:upstock/style/style.dart' as style; // style.dart

import 'package:upstock/account/login.dart';
import 'package:upstock/account/register.dart'; // todo : 테스트용으로 냄겨둠 냅둬라

// firebase set import
import 'package:firebase_core/firebase_core.dart';
import 'firebase/firebase_options.dart';

// firebase register and login
import 'package:firebase_auth/firebase_auth.dart';
final auth = FirebaseAuth.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      MultiProvider(
          providers: [
            // todo : provider 쓰려고 일단 만들어뒀는데 나중에 코드 정리할 때에만 사용할 예정
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

  // state 담는 함수
  var tab = 0;

  checkLogin() {
    if(auth.currentUser?.uid == null) {
      print('로그인해라 ㅡㅡ');

      Navigator.push(context,
      MaterialPageRoute(builder: (c) => Login()));
    } else {
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    super.initState();

    // widgetsbinding을 사용한 이유는 첫 번째 프레임 랜더링 안되고 실행하면 오류 뿜뿜함
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.push(context,
          MaterialPageRoute(builder: (c) => Register()));

      // todo : 앱 실행 시 로그인 if 문 처리 (로그인되어 있지 않으면 바로 다시 navigator 적용), firebase에서도 rule처리 해줘야 함.
      checkLogin();
      // 이거 밖에다가 빼면 오류남 ㅋㅋ
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,

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
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '홈'),
            BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined), label: '게시글'),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: '프로필'),
          ]
      )
    );
  }
}