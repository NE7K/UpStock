import 'package:flutter/material.dart';

// 파이어베이스 쓰려면 넣어라.. 오류난다
import 'package:firebase_auth/firebase_auth.dart';
import 'package:upstock/account/login.dart';

final auth = FirebaseAuth.instance;

class Logout extends StatefulWidget {
  const Logout({super.key});

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  // user Logout system
  userLogout() async {
    await auth.signOut();
  }

  final snackLogout = SnackBar(
    content: Text('로그아웃함 ㅋㅋ'),
    duration: Duration(seconds: 2),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('계정 설정')),
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('현재 계정 로그인 및 로그아웃 상태'),

              SizedBox( height: 20 ),

              Divider( color: Colors.grey ),

              TextButton(
                  onPressed: () {
                    userLogout();
                    ScaffoldMessenger.of(context).showSnackBar(snackLogout);
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (c) => Login()));
                  },
                  child: Text('로그아웃하시겠습니까?',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ))),
            ],
          )),
    );
  }
}
