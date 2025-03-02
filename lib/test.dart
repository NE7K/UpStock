import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  Test({super.key});

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text('Shimmer Test Layout'),),
      backgroundColor: Colors.white,
      // Shimmer Test Layout
      body: Container(
        child: Column(
          children: [
            Text('테스트')
          ],
        ),
      ),
    );
  }
}
