import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

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
            Text('이미지 칸', textAlign: TextAlign.left,),
            Text('게시글 제목'),
            TextField(),
            Text('게시글 내용'),
            TextField(),
            Image.asset('assets/images/icon.png')
          ],
        ),
      ),
        bottomNavigationBar: ElevatedButton(onPressed: () {}, child: Text('공유'))
    );
  }
}
