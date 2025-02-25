import 'package:flutter/material.dart';

// 파이어베이스 쓰려면 넣어라.. 오류난다
import 'package:firebase_auth/firebase_auth.dart';
import 'package:upstock/account/login.dart';

final auth = FirebaseAuth.instance;

class UserSet extends StatefulWidget {
  const UserSet({super.key});

  @override
  State<UserSet> createState() => _UserSetState();
}

class _UserSetState extends State<UserSet> {
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
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text('계정 설정', style: TextStyle( fontWeight: FontWeight.bold) ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey[300],
            height: 1.0,
          ),
        ),
      ),

      body: Container(
        width: double.infinity,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage('https://ne7k.github.io/app/profile.jpg')
              ),

              SizedBox( height: 20 ),

              Text('ID : ${auth.currentUser!.displayName ?? '아이디'}', style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold )),

              SizedBox( height: 5 ),

              Text('Email : ${auth.currentUser!.email ?? '이멜 존재 ㄴㄴ'}', style: TextStyle( fontSize: 16, color: Colors.grey[800] )),

              SizedBox( height: 20 ),

              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green
                  ),
                  child: Column(
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text('프로필 변경', style: TextStyle( color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold ))
                      ),
                    ],
                  )
              ),

              Spacer(),

              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

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
              ),

            ],
          )),
    );
  }
}
