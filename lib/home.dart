import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('UpStock'),
            IconButton(onPressed: () {}, icon: Icon(Icons.expand_more))
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.menu))
        ],
      ),

      body: Text('test')
    );
  }
}