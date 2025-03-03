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
    try {
      var result = await firestore
          .collection('announcement')
          .orderBy('date', descending: true)
          .get();

      List<Map<String, dynamic>> newResults = [];

      if (result.docs.isNotEmpty) {
        for (var doc in result.docs) {
          newResults.add(doc.data());
        }
      }

      setState(() {
        mastercontext = newResults;
      });
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('공지사항'),
      ),
      body: ListView.builder(
          itemCount: mastercontext.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Text('d')
                ],
              ),
            );
          }),
    );
  }
}

// Card(
// // 그림자 방향 바꾸려면 다른거
// color: Colors.white,
// elevation: 8,
// shadowColor: Colors.grey[300],
//
// margin: EdgeInsets.symmetric(vertical: 15),
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(8)),
//
// child: Container(
// padding: EdgeInsets.all(25),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// mastercontext[index]['title'],
// style: TextStyle(
// color: Colors.black,
// fontSize: 30,
// fontWeight: FontWeight.w300,
// letterSpacing: 1.5,
// ),
// ),
// SizedBox(height: 20),
// Divider(height: 1, color: Colors.grey[200]),
// SizedBox(height: 20),
// Text(
// mastercontext[index]['context'],
// style: TextStyle(
// fontSize: 15,
// ),
// ),
// SizedBox(height: 50),
// Align(
// alignment: Alignment.bottomRight,
// child: Text(
// (mastercontext[index]['date'] as Timestamp)
//     .toDate()
//     .toString()
//     .substring(0, 16),
// style: TextStyle(
// fontSize: 10,
// color: Colors.grey[800],
// ),
// ),
// )
// ],
// ),
// ),
// );
