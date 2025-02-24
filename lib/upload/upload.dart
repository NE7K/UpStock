import 'package:flutter/material.dart';

// 파이어베이스 쓰려면 넣어라.. 오류난다
import 'package:firebase_auth/firebase_auth.dart';
import 'package:upstock/profile/announcement.dart';

final auth = FirebaseAuth.instance;

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {

  TextEditingController userContext = TextEditingController();

  @override
  void initState() {
    super.initState();
    // count 숫자 받아오는 함수
    checkCount();
  }

  checkCount() async {
    try {
      var countResult = await firestore.collection('user').get();
    } catch(e) {
      print(e);
    }
  }

  userPost() async {
    try {
      // 이거 유저 컨트롤러 받아와서 포스팅하면댐 ㅋㅋ
      await firestore
          .collection('user')
      // todo 서버에서 게시글 번호를 받아와서 +1씩해서 저장해야 할듯?
          .doc('1')
          .set({
        'context' : userContext.text,
        'like' : 0
      });
      if(mounted) ScaffoldMessenger.of(context).showSnackBar(finishUpload);
    } catch(e) {
      print(e);
    }
  }

  final finishUpload = SnackBar(
      content: Text('업로드함 ㅋㅋ'),
    duration: Duration( seconds: 2),
  );

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
