import 'package:flutter/material.dart';

// 파이어베이스 쓰려면 넣어라.. 오류난다
import 'package:firebase_auth/firebase_auth.dart';
import 'package:upstock/profile/announcement.dart';
import 'package:firebase_storage/firebase_storage.dart';

final auth = FirebaseAuth.instance;
final base = FirebaseStorage.instance;

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {

  // 내용 저장
  List<Map<String, dynamic>> usercontext = [];

  // 이미지 저장
  List<String> usercontextimage = [];

  // 글 내용 불러오기
  getData() async {
    var result = await firestore.collection('user').get();
    // .orderBy('date', descending: true) 이거 시간대 아직 안 넣어서 작동을 안 함
    // todo timestamp add oo?

    List<Map<String, dynamic>> result2 = [];

    for (var doc in result.docs) {
      result2.add(doc.data());
    }
    setState(() {
      usercontext = result2;
    });
  }

  getImageData() async {
    // Firebase Storage에서 이미지 URL 가져오기
    String filePath = 'userContext/1';
    Reference storageRef = FirebaseStorage.instance.ref().child(filePath);
    String url = await storageRef.getDownloadURL();
    return url;
  }

  @override
  void initState() {
    super.initState();
    getData();
    getImageData();
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
            childCount: usercontext.length, (c, i) {
      return SizedBox(
        width: double.infinity,
        child: Column(
          children: [

            Container(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: Row(
                children: [
                  CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage('https://ne7k.github.io/app/profile.jpg')),

                  SizedBox(width: 15),

                  // todo 글쓴이 사용자 이름으로 바꿔야함
                  Text(auth.currentUser!.displayName ?? 'miss', style: TextStyle( fontSize: 16, fontWeight: FontWeight.bold )),
                ],
              ),
            ),

            SizedBox(height: 10),

            // 여기
            Image.network('https://firebasestorage.googleapis.com/v0/b/upstock-b54e4.firebasestorage.app/o/userContext%2F1?alt=media&token=ac62183d-b086-4a7a-a923-6bf84a12b50c'),

            SizedBox( height: 20 ),

            Row(
              children: [
                SizedBox( width: 20 ),
                // 유저 아이디
                Text(auth.currentUser!.displayName.toString(), style: TextStyle( fontSize: 14, fontWeight: FontWeight.bold)),
                SizedBox( width: 10 ),
                Text('${usercontext[i]['context']}',
                    style: TextStyle( fontSize: 14 )
                ),
              ],
            ),

            Container(
              padding: EdgeInsets.symmetric( horizontal: 5 ),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.favorite_outline)),
                  Text(usercontext[i]['like'].toString()),
                  // 댓글
                  // IconButton(
                  //     onPressed: () {}, icon: Icon(Icons.messenger_outline)),
                  // Text('2')
                ],
              ),
            )
          ],
        ),
      );
    }));
  }
}
