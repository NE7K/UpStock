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
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[100]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox( height: 80 ),

            Text('Stock List', style: TextStyle( fontSize: 20)),

            SizedBox( height: 30 ),

            Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.symmetric(horizontal: 50),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5,
                    offset: Offset(0, 2)
                  )
                ]
              ),
              child: Text('다우존스, 나스닥 100, 러셀 지수 들어가는 곳'),
            ),

            SizedBox( height: 30 ),

            Text('New Context', style: TextStyle( fontSize: 20)),

            SizedBox( height: 30 ),

            Expanded(
                child: ListView(

                )
            )


          ],
        ),
      )
    );
  }
}