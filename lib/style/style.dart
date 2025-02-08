import 'package:flutter/material.dart';

var theme = ThemeData(
    splashColor: Colors.transparent,  // 전역 스플래시 색상
    highlightColor: Colors.transparent,  // 전역 하이라이트 색상

    appBarTheme: AppBarTheme(
        color: Colors.white
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.black,
        backgroundColor: Colors.white
    )
);
