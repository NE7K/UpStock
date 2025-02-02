import 'package:flutter/material.dart';

import 'dart:convert'; // json 자료 변환

// 외부 package import
import 'package:http/http.dart' as http;

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  // var user = [];
  //
  // getUserImage() async {
  //   var result = await http.get(Uri.parse('https://ne7k.github.io/app/profile.jpg'));
  //   var result2 = jsonDecode(result.body);
  //   user = result2;
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings_outlined))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage('https://ne7k.github.io/app/profile.jpg')
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text('User name', style: TextStyle(fontSize: 20),) // firebase user nickname get
            )
          ],
        ),
      )
    );
  }
}
