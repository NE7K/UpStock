import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart'; // shimmer import


//
class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SizedBox( height: 30 ),

        Row(
          children: [
            SizedBox( width: 10 ),
            Text('커뮤니티', style: TextStyle( fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold ))
          ],
        ),

        // 커뮤니티 부분임 ㅋㅋ
        Container(
          width: double.infinity,
          height: 300,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
              border: Border.all( color: Colors.grey[300]! ),
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 0.1,
                )
              ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Text(' shimmer 테스트 ')
              )
            ],
          ),
        )
      ],
    );
  }
}
