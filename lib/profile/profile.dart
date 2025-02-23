import 'package:flutter/material.dart';

// 외부 package import

// 내부 파일 연동
import 'package:upstock/profile/announcement.dart';
import 'package:upstock/profile/information.dart';
import 'package:upstock/profile/peedback.dart';
import 'package:upstock/profile/screen.dart';
import 'package:upstock/account/login.dart';

// 파이어베이스 쓰려면 넣어라.. 오류난다
import 'package:firebase_auth/firebase_auth.dart';
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

  // user Logout system
  userLogout() async {
    await auth.signOut();
  }

  final snackLogout = SnackBar(
    content: Text('로그아웃함 ㅋㅋ'),
    duration: Duration( seconds: 2 ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,

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
                    radius: 40,
                    backgroundImage: NetworkImage('https://ne7k.github.io/app/profile.jpg')
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 15, 0, 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center, // 세로 center
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 사용자 아이디 그리고 이멜 받아와서 프로필에 출력
                     Text(auth.currentUser!.displayName ?? '아이디가 존재하지 않습니다.', style: TextStyle(fontSize: 20)),
                     Text(auth.currentUser!.email ?? '로그인하지 않았습니다.', style: TextStyle( color: Colors.grey[600])),
                   ]
                  )
                )
              ]
            ),


            // if 문 로그인 되어있는 경우에는 로그인 버튼, 로그인이 되어 있으면 로그아웃 버튼
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Divider(color: Colors.grey[200]),

                Text('설정', style: TextStyle( fontSize: 12, color: Colors.grey)),

                ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                  leading: Icon(Icons.wb_sunny_outlined),
                  title: Text('화면 테마'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 15),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (c) => Screen()));
                    },
                ),

                Divider(color: Colors.grey[200],),

                Text('앱', style: TextStyle( fontSize: 12, color: Colors.grey)),

                ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                  leading: Icon(Icons.mail_outline),
                  title: Text('피드백'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 15),
                  onTap: () {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (c) => Peedback()));
                  },
                ),

                ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                  leading: Icon(Icons.campaign_outlined),
                  title: Text('공지사항'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 15),
                  onTap: () {Navigator.push(context,
                  MaterialPageRoute(builder: (c) => Announcement()));
                    },
                ),

                TextButton(onPressed: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (c) => Information()));
                }, child: Text('개인정보보호방침 및 이용약관',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 9,
                        color: Colors.grey[600]
                    )),
                ),

                TextButton(onPressed: () {
                  userLogout();
                  ScaffoldMessenger.of(context).showSnackBar(snackLogout);
                  Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (c) => Login()));
                }, child: Text('로그아웃 버튼',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 15,
                  color: Colors.grey[800]
                ))),


              ],
            ),

          ],
        ),
      )
    );
  }
}
