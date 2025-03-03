import 'package:flutter/material.dart';

// 외부 package import
import 'package:provider/provider.dart';
import 'package:upstock/upload/upload.dart';

// 내부 파일 Import
import 'home/home.dart'; // fl_chart
import 'profile/profile.dart';
import 'package:upstock/style/style.dart' as style; // style.dart

import 'package:upstock/account/login.dart';

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
  runApp(MultiProvider(providers: [
    // todo : provider 쓰려고 일단 만들어뒀는데 나중에 코드 정리할 때에만 사용할 예정
    ChangeNotifierProvider(create: (c) => Store())
  ], child: MaterialApp(theme: style.theme, home: Mainpage())));
}

class Store extends ChangeNotifier {
}

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {

  // state 담는 함수
  var tab = 0;

  checkLogin() {
    if (auth.currentUser?.uid == null) {
      print('로그인해라 ㅡㅡ');
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (c) => Login()));
    } else {
      print('로그인했어요.');
    }
  }

  @override
  void initState() {
    super.initState();

    // widgetsbinding을 사용한 이유는 첫 번째 프레임 랜더링 안되고 실행하면 오류 뿜뿜함
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkLogin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(title: Text('zz'), backgroundColor: Colors.black,),
        // appbar 추가 안할거면 safearea 추가해줘야함
        body: SafeArea(child: [Home(), UploadPage(), Profile()][tab]),
        bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false, // 선택된 라벨 표시 false
            showUnselectedLabels: false,
            onTap: (i) {
              setState(() {
                tab = i;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: tab == 0 ? Icon(Icons.home, color: Colors.black87) : Icon(Icons.home_outlined, color: Colors.grey[800]), label: '홈'),
              BottomNavigationBarItem(
                  icon: tab == 1 ? Icon(Icons.add_box, color: Colors.black87) : Icon(Icons.add_box_outlined, color: Colors.grey[800],), label: '게시글'),
              BottomNavigationBarItem(
                  icon: tab == 2 ? Icon(Icons.person, color: Colors.black87) : Icon(Icons.person_outline, color: Colors.grey[800],), label: '프로필'),
            ]));
  }
}
