import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F0F6),

      appBar: AppBar(
        backgroundColor: Color(0xFFF0F0F6),
      ),

      // appBar: AppBar(
      //   title: Row(
      //     children: [
      //       Text('UpStock'),
      //       IconButton(onPressed: () {}, icon: Icon(Icons.expand_more), iconSize: 15)
      //     ],
      //   ),
      //   actions: [
      //     IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded)),
      //     IconButton(onPressed: () {}, icon: Icon(Icons.menu))
      //   ],
      // ),

      body: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('홈', style: TextStyle( fontSize: 25, fontWeight: FontWeight.w700 )),

            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Text('테스트 카드뷰')
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}