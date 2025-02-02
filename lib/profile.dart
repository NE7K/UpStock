import 'package:flutter/material.dart';

import 'dart:convert'; // json 자료 변환

// 외부 package import
import 'package:http/http.dart' as http;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:upstock/register.dart';

final auth = FirebaseAuth.instance;

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('프로필'),
        
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings_outlined))
        ],
      ),

      body: Container(
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage('https://ne7k.github.io/app/profile.jpg')
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Text('NE7K', style: TextStyle(fontSize: 20)),
                     Text('sjjang16@naver.com', style: TextStyle( color: Colors.grey[600])),
                   ]
                  )
                )
              ]
            ),

            // if 문 로그인 되어있는 경우에는 로그인 버튼, 로그인이 되어 있으면 로그아웃 버튼
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Divider(color: Colors.grey[200],),

                Text('설정', style: TextStyle( fontSize: 11, color: Colors.grey)),

                ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                  leading: Icon(Icons.wb_sunny_outlined),
                  title: Text('화면 테마'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 15),
                  onTap: () {},
                ),

                Divider(color: Colors.grey[200],),

                Text('앱', style: TextStyle( fontSize: 11, color: Colors.grey)),

                ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                  leading: Icon(Icons.mail_outline),
                  title: Text('피드백'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 15),
                  onTap: () {},
                ),

                ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                  leading: Icon(Icons.campaign_outlined),
                  title: Text('공지사항'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 15),
                  onTap: () {},
                ),

                Text('개인정보보호방침 및 이용약관',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 9,
                        color: Colors.grey[600]
                    )
                ),

                TextButton(onPressed: () {}, child: Text('테스트 로그인 버튼')),
                TextButton(onPressed: () {}, child: Text('테스트 로그아웃 버튼')),
                TextButton(onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (c) => Register()));
                  }, child: Text('테스트 회원가입 페이지 버튼')),

              ],
            ),

          ],
        ),
      )
    );
  }
}
