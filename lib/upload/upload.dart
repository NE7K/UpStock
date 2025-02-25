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
        title: Text('새 게시물', style: TextStyle( fontWeight: FontWeight.bold) ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey[300],
            height: 1.0,
          ),
        ),
      ),

      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text('이미지 업로드', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 18)),

            SizedBox( height: 10 ),

            // 사진 업로드 및 표시
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                border: Border.all( color: Colors.grey ),
                borderRadius: BorderRadius.circular(10)
              ),
              // todo 업로드된 사진들은 오른쪽으로 배치 (후에 이미지 여러 개 배치)
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt_outlined, color: Colors.grey[500])),
                      Text('0/1', style: TextStyle( fontSize: 14, fontWeight: FontWeight.bold))
                    ],
                  )
                ],
              ),
            ),

            SizedBox( height: 20 ),

            Text('내용', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 18)),

            SizedBox( height: 10 ),

            SizedBox(
              width: double.infinity,
              child: TextField(
                controller: userContext,
                decoration: InputDecoration(
                  hintText: '글 내용   ',
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                  ),

                    // 누르지 않았을 때
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide( color: Colors.grey.shade200, width: 1.5 ),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    // 눌렀을 때
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide( color: Colors.grey.shade200, width: 1.5 ),
                      borderRadius: BorderRadius.circular(10)
                    ),

                ),
              ),
            ),

            SizedBox( height: 30 ),

            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.green
              ),
              child: Column(
                children: [
                  TextButton(
                      onPressed: () {
                        userPost();
                      },
                      child: Text('업로드', style: TextStyle( color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold ))
                  ),
                ],
              )
            )

          ],
        ),
      ),
    );
  }
}
