import 'package:flutter/material.dart';

// 외부 import
import 'package:webview_flutter/webview_flutter.dart';

class Peedback extends StatefulWidget {
  const Peedback({super.key});
  @override
  State<Peedback> createState() => _PeedbackState();
}

class _PeedbackState extends State<Peedback> {

  late final WebViewController controller;
  // late는 나중에 이 함수가 초기화될 것이라는 것을 보장

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
    ..loadRequest(
      Uri.parse('https://docs.google.com/forms/d/e/1FAIpQLSfr6Cn7MaDUhqYRgM6HCEqmDmeIvgb3Y9fQMVvlJv26t8zP7A/viewform?usp=dialog')
    );
  }
   // 자바 스크립트 활성화 해줘야함
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('피드백'),
      ),
      body: WebViewWidget(controller: controller)

      // https://docs.google.com/forms/d/e/1FAIpQLSfr6Cn7MaDUhqYRgM6HCEqmDmeIvgb3Y9fQMVvlJv26t8zP7A/viewform?usp=dialog
    );
  }
}
