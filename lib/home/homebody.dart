import 'package:flutter/material.dart';

// 파이어베이스 쓰려면 넣어라.. 오류난다
import 'package:firebase_auth/firebase_auth.dart';
import 'package:upstock/profile/announcement.dart';

final auth = FirebaseAuth.instance;

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {

  List<Map<String, dynamic>> usercontext = [];

  getData() async {
    var result = await firestore.collection('user').get();
    // .orderBy('date', descending: true)
    // todo timestamp add oo?

    List<Map<String, dynamic>> result2 = [];

    for (var doc in result.docs) {
      result2.add(doc.data());
    }
    setState(() {
      usercontext = result2;
    });
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

                  SizedBox(width: 10),

                  // todo 글쓴이 사용자 이름으로 바꿔야함
                  Text(auth.currentUser!.displayName ?? 'miss', style: TextStyle( fontSize: 16, fontWeight: FontWeight.bold ),)
                ],
              ),
            ),

            SizedBox(height: 10),

            Image.asset('assets/images/dall.webp', scale: 1 ),

            SizedBox(height: 10),

            Container(
              padding: EdgeInsets.symmetric( horizontal: 10 ),
              child: Text(usercontext[i]['context'],
                style: TextStyle( fontSize: 16 )
              ),
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
