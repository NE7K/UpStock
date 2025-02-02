import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
       children: [
         Text('회원가입 페이지'),

         Text('이메일 주소'),
         TextField(),

         Text('비밀번호'),
         TextField(),

         TextButton(onPressed: () {}, child: Text('회원가입'))
       ],
      )

    );
  }
}
