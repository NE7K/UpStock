import 'package:flutter/material.dart';

// 파이어베이스 쓰려면 넣어라.. 오류난다
import 'package:firebase_auth/firebase_auth.dart';
import 'package:upstock/profile/announcement.dart';
import 'package:firebase_storage/firebase_storage.dart';

final auth = FirebaseAuth.instance;
final storage = FirebaseStorage.instance;

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {

  // 내용 저장
  List<Map<String, dynamic>> usercontext = [];
  // 이미지 변수고 이미지 url 여기다가 다 처 넣을거임 ? = null이 아니라는 것을 보장
  List<String?> imageUrl = [];

  // 글 내용 불러오기
  getData() async {
    var result = await firestore.collection('user').get();
    // .orderBy('date', descending: true) 이거 시간대 아직 안 넣어서 작동을 안 함
    // todo timestamp add oo?

    List<Map<String, dynamic>> result2 = [];
    // url 임시로 저장할 곳
    List<String?> imageUrlresult = [];

    // 문서 반복문으로 다 저장 ㅋㅋ 쿼리 쓴거임
    for (var doc in result.docs) {
      // imageNumber을 전달
      String? url = await loadContextImage(doc.id);
      // 이미지 변수에 url 저장
      imageUrlresult.add(url);
      // 텍스트 저장
      result2.add(doc.data());
    }
    setState(() {
      usercontext = result2;
      imageUrl = imageUrlresult;
    });
  }

  // 이미지 매개변수 받은거 사용
  loadContextImage(String imageNumber) async {
    try {
      final ref = storage.ref().child('userContext/$imageNumber');
      return await ref.getDownloadURL();
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
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
                  Text(usercontext[i]['username'] ?? 'name', style: TextStyle( fontSize: 16, fontWeight: FontWeight.bold )),
                ],
              ),
            ),

            SizedBox(height: 10),

            buildImageNotEmpty(imageUrl[i]),

            SizedBox( height: 20 ),

            Row(
              children: [
                SizedBox( width: 20 ),
                // 유저 아이디
                Text(usercontext[i]['username'] ?? 'name', style: TextStyle( fontSize: 14, fontWeight: FontWeight.bold)),
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

// 이미지 널이면 빈텍스트 보여줘야함 ㅋㅋㅋㅋ
Widget buildImageNotEmpty(String? imageUrl) {
  return imageUrl != null
      ? Image.network(imageUrl)
      : SizedBox();
}