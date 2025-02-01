import 'package:flutter/material.dart';

var bottom = BottomNavigationBar(
    showSelectedLabels: false, // tab 눌렀을 때 라벨 글자 나오지 않게 설정
    showUnselectedLabels: false,
  items: [
    BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '프로필'),
    BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: '프로필'),
  ]
);