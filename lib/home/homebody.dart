import 'package:flutter/material.dart';

// 파이어베이스 쓰려면 넣어라.. 오류난다
import 'package:firebase_auth/firebase_auth.dart';

final auth = FirebaseAuth.instance;

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(childCount: 300, (c, i) {
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

                  Text(auth.currentUser!.displayName ?? 'miss')
                ],
              ),
            ),

            SizedBox(height: 10),

            Image.asset('assets/images/dall.webp', scale: 1 ),

            SizedBox(height: 10),

            Container(
              padding: EdgeInsets.symmetric( horizontal: 10 ),
              child: Text('내용이다 ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ',
                style: TextStyle( fontSize: 16 )
              ),
            ),

            Container(
              padding: EdgeInsets.symmetric( horizontal: 5 ),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.favorite_outline)),
                  Text('1'),
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
