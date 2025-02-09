import 'package:flutter/material.dart';
import 'package:upstock/home.dart';
import 'package:upstock/main.dart';

class Register extends StatelessWidget {
  Register({super.key});

  // TODO : MediaQuery 사용해서 동적 UI 제공. 사진 포함
  // TODO : context도 main.dart에서 가져와야 함
  // var screenWidth = MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        // 스크롤 안되서 추가함 ㅅㄱ
        child: Container(
          margin: EdgeInsets.all(20),
          width: double.infinity,
          child: Column(
            children: [
              SizedBox( height: 100 ),
        
              Image.asset('assets/images/icon.png',
                  width: 200,
                  height: 200,
              ),
        
              SizedBox( height: 30 ),

              // todo : 일단 제목으로 넣어두긴 했는데 없는게 차라리 이쁜듯 ㅋㅋ
              // SizedBox(
              //   width: double.infinity,
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text('Stock Comunication',
              //           style: TextStyle(
              //             fontSize: 25,
              //             fontWeight: FontWeight.w600
              //           )
              //       ),
              //     ],
              //   ),
              // ),
        
              SizedBox( height: 20 ),

              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Insert your e-mail',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                  ),

                  prefixIcon: Icon(Icons.person_outline), // icon images

                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade200, width: 1.5),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  floatingLabelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.5),
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
              ),

              SizedBox(height: 20),

              TextField(
                obscureText: true, // 비번인거 감춤 ㅅㄱ
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Insert your Password',
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                  ),

                  prefixIcon: Icon(Icons.vpn_key_outlined),

                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade200, width: 1.5),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  floatingLabelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade200, width: 1.5),
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
              ),

              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextButton(onPressed: () {
                      // todo : 간단하게 페이지 이동 넣지머
                    },
                        child: Text('Do you need any help?',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.grey
                            )
                        ))
                  ],
                ),
              ),

              SizedBox( height: 50 ),

              Container(
                height: 50,
                margin: EdgeInsets.symmetric( horizontal: 80 ),
                decoration: BoxDecoration(
                  color: Colors.green[500],
                  borderRadius: BorderRadius.circular(50)
                ),
                child: SizedBox.expand(
                  // .expend 쓰면 container 크기만큼 클릭 ㅆㄱㄴ
                  child: TextButton(onPressed: () {
                    // todo : 회원가입 firebase 연동하셈
                  }, child: Text('Register', style: TextStyle( color: Colors.white, fontSize: 18))),
                ),
              ),

              SizedBox( height: 20 ),


              Container(
                  height: 50,
                  margin: EdgeInsets.symmetric( horizontal: 80 ),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.green[500]!,
                          width: 1
                      ),
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: SizedBox.expand(
                    child: TextButton(onPressed: () {
                      // 사용자가 안할거래
                      Navigator.pop(context);
                    }, child: Text('Done', style: TextStyle( color: Colors.green, fontSize: 18))),
                  )
              ),
              // Todo : 추가할거 추가하자
            ],
          ),
        ),
      )
    );
  }
}
