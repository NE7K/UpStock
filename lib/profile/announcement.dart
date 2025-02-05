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

  var mastercontext ; // 공지사항 저장 공간

  getData() async {
      var result = await firestore.collection('product').doc('eUukvg8k8tzeEkqwd1vG').get();
        setState(() {
          mastercontext = result['announcement'];
        });
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
      body: Text(mastercontext),
    );
  }
}
