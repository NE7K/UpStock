import 'package:flutter/material.dart';

// 파이어베이스 쓰려면 넣어라.. 오류난다
import 'package:firebase_auth/firebase_auth.dart';
import 'package:upstock/profile/announcement.dart';

final auth = FirebaseAuth.instance;

class Fixcontext extends StatefulWidget {
  const Fixcontext({super.key});

  @override
  State<Fixcontext> createState() => _FixcontextState();
}

class _FixcontextState extends State<Fixcontext> {


  TextEditingController userContext = TextEditingController();

  userPost() async {
    try {
      // 이거 유저 컨트롤러 받아와서 포스팅하면댐 ㅋㅋ
      await firestore
          .collection('user')
          .doc('1')
          .set({'context' : userContext.text});
    } catch(e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('새 게시물'),
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [

              Text('이미지 칸', textAlign: TextAlign.left ),

              Text('게시글 내용'),

              TextField(
                controller: userContext,
              ),

            ],
          ),
        ),
        bottomNavigationBar: ElevatedButton(onPressed: () {
          // add 함수
          userPost();
        }, child: Text('공유'))
    );
  }
}
