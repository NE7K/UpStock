import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.settings_outlined))
        ],
      ),
      body: Text('3번째 페이지'),
    );
  }
}
