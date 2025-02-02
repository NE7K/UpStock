import 'package:flutter/material.dart';

// 외부 패키지
import 'package:fl_chart/fl_chart.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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

      body: Text('df')
    );
  }
}