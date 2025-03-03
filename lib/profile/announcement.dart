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
            return Column(
              children: [
                SizedBox(height: 20),
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 0, 0, 0.78),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      //제목
                      Row(
                        children: [
                          SizedBox(width: 20),
                          Text(mastercontext[index]['title'],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),

                      SizedBox(height: 20),

                      Row(
                        children: [
                          SizedBox(width: 20),
                          Expanded(
                            child: Text(mastercontext[index]['context'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),


                      SizedBox(
                        height: MediaQuery.of(context).size.height*0.13,
                        width: MediaQuery.of(context).size.width*0.85,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(width: 20),
                            Text( (mastercontext[index]['date'] as Timestamp)
                                  .toDate()
                                  .toString()
                                  .substring(0, 16),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}