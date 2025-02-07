import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

// firebase function
final firestore = FirebaseFirestore.instance;

class Announcement extends StatefulWidget {
  const Announcement({super.key});

  @override
  State<Announcement> createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> {

  List<Map<String, dynamic>> mastercontext = []; // 공지사항 저장 공간

  getData() async {
    var  result = await firestore.collection('announcement').get(); // all get
    List<Map<String, dynamic>> result2 = []; // result2 역할 type 지정

    for (var doc in result.docs) { // for문으로 result 데이터 저장
      result2.add(doc.data()); // result2에 담아온 데이터 insert
      setState(() {
        mastercontext = result2;
      });
    }
  }

  countFunction() {
    var i = 0;
    var x = 0;


  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('공지사항'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Text('공지사항 1 : ${mastercontext[0]['1']}')
          ],
        ),
      )
    );
  }
}
