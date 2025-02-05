import 'package:flutter/material.dart';

class Peedback extends StatelessWidget {
  const Peedback({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('피드백'),
      ),
      body: Text('피드백 페이지 : 구글 설문 폼으로 대체 예정'),
    );
  }
}
