import 'package:flutter/material.dart';
import 'package:upstock/bottom/bottom.dart';

import 'package:upstock/header/header.dart'; // header.dart

import 'package:upstock/style/style.dart' as style; // style.dart

void main() {
  runApp(
      MaterialApp(
        theme: style.theme,
          home: MyApp()
      )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header,
      body: Text('.'),
      bottomNavigationBar: bottom
    );
  }
}