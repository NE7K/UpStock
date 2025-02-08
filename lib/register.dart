import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        // 가로 넓이 최대
        decoration: BoxDecoration( // 도형 그라데이션
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.deepPurple[500]!,
                  // !를 주는 이유는 null이 아닌 것을 보장해준다는 의미
                  Colors.deepPurple[400]!,
                  Colors.deepPurple[400]!
                ]
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Register', style: TextStyle( fontSize: 40, color: Colors.white)),
                  Text('Create account and using app.', style: TextStyle( fontSize: 20, color: Colors.white)),
                ],
              ),
            ),

            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
                ),

                child: Column(
                  children: [
                    SizedBox(height: 50),

                    Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 20,
                                  offset: Offset(0, 10)
                              )
                            ]
                        ),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: TextField(
                              decoration: InputDecoration(
                                  hintText: "Insert ID here.",
                                  hintStyle: TextStyle( color: Colors.grey),
                                  border: InputBorder.none
                              )
                          ),
                        )
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                          decoration: InputDecoration(
                              hintText: "Insert ID here.",
                              hintStyle: TextStyle( color: Colors.grey),
                              border: InputBorder.none
                          )
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
