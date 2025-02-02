import 'package:flutter/material.dart';

var header = AppBar(
  title: Row(
    children: [
      Text('UpStock'),
      IconButton(onPressed: () {}, icon: Icon(Icons.expand_more))
    ],
  ),
  actions: [
    IconButton(onPressed: () {}, icon: Icon(Icons.menu))
  ],
);