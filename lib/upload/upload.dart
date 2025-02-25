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

  // 파이어베이스 내에 존재하는 contextdata post count 초기화
  final countdocumment = firestore.collection('contextdata').doc('post');

  checkFirebaseCountData() async {
      final checkCount = await countdocumment.get();
      // 게시글이 존재하지 않으면 0으로 초기화
      if (!checkCount.exists) {
        await countdocumment.set({'count' : 0});
      }
  }

  // 업로드
  userPost() async {
    // initstate에 넣는 것보다는 포스트할 때에만 작동되게 끔하는게 좋을듯
    checkFirebaseCountData();
    // 트랜잭션했음 이유는 데이터베이스 작업을 하나로 묶어서 함 ㅇㅇ 그래서 하나가 실패하면 아예 취소되는거임 그래야 카운트가 잘 되니까
    try {
      firestore.runTransaction((transaction) async {
        final checkCount = await transaction.get(countdocumment);
        int currentCount = checkCount.get('count');
        int newCount = currentCount + 1;

        // 이거 future 쓰라는거 같은데 머지 ㅋㅋㅋ > await 삭제함
         transaction
            .set(firestore
            .collection('user')
            .doc(newCount.toString()), {
              'context' : userContext.text,
              'like' : 0,
            });

        // 카운트 +1해준 값 데베로 보내기
        transaction.update(countdocumment, {'count' : newCount});
        // 업로드 되었다는 표시
        if(mounted) ScaffoldMessenger.of(context).showSnackBar(finishUpload);
      });
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

      body: SingleChildScrollView(
        child: Container(
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
                        Text('0/1', style: TextStyle( fontSize: 14, fontWeight: FontWeight.bold)),
                      ],
                    )
                  ],
                ),
              ),
        
              SizedBox( height: 20 ),
        
              Text('이미지 임시 업로드 확인 위치'),
        
              SizedBox( height: 20 ),
        
              Text('내용', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 18)),
        
              SizedBox( height: 10 ),
        
              SizedBox(
                width: double.infinity,
                child: TextField(
                  controller: userContext,
                  maxLength: 2000,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    // hintText: '글 내용',
                    // 글 내용이라서 수직줘서 크기 키움
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    contentPadding: EdgeInsets.symmetric( vertical: 100 ),
        
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
                height: 50,
                margin: EdgeInsets.symmetric( horizontal: 10 ),
                decoration: BoxDecoration(
                    color: Colors.green[500],
                    borderRadius: BorderRadius.circular(50)
                ),
                child: SizedBox.expand(
                  // .expend 쓰면 container 크기만큼 클릭 ㅆㄱㄴ
                  child: TextButton(
                      onPressed: () {
                        userPost();
                      },
                      child: Text('업로드', style: TextStyle( color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold ))
                  ),
                ),
              ),

        
            ],
          ),
        ),
      ),
    );
  }
}
