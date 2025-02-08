import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

// firebase function
final firestore = FirebaseFirestore.instance;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('data')
    );
  }
}