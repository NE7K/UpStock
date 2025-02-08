import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

// firebase function
final firestore = FirebaseFirestore.instance;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [

            SizedBox( height: 90),

            Align(
              alignment: Alignment.topLeft,
              child:  Text('홈', style: TextStyle( fontSize: 25, fontWeight: FontWeight.w700 )),
            ),

            SizedBox( height: 40),

            Text('주식 리스트'),

            SizedBox( height: 40),

            // scroll하면 홈이랑 주식 리스트 사라져야함

            Align(
              alignment: Alignment.topLeft,
              child:  Text('커뮤니티', style: TextStyle( fontSize: 25, fontWeight: FontWeight.w700 )),
            ),

            Expanded(
              child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (c, i) {
                    return Card(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        elevation: 4,
                        color: Colors.white,
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Column(
                            children: [

                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    backgroundImage: NetworkImage('https://ne7k.github.io/app/profile.jpg'),
                                    radius: 20,
                                  ),

                                  SizedBox(width: 10),

                                  Text('NE7K', style: TextStyle( fontSize: 15))
                                ],
                              ),

                              SizedBox( height: 10 ),

                              Image.asset('assets/images/test.jpg'),

                              SizedBox( height: 10 ),

                              Container(
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.favorite_outline),

                                    SizedBox( width: 5),

                                    Text('1098'),

                                    SizedBox( width: 10),

                                    Icon(Icons.chat_outlined),

                                    SizedBox( width: 5),

                                    Text('37'),

                                    SizedBox( width: 10),

                                    Icon(Icons.send_outlined),

                                    SizedBox( width: 5),

                                    Text('3,333'),

                                  ],
                                ),
                              ),

                              SizedBox( height: 10 ),

                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Text('사용자 이름 : 게시글 내용'), //${사용자 이름} ${글 내용}
                              ),

                            ],
                          ),
                        )
                    );
                  }
              ),
            )

          ],
        ),
      )

    );
  }
}