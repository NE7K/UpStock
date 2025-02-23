import 'package:flutter/material.dart';
import 'package:upstock/account/register.dart';
import 'package:upstock/main.dart';

import 'package:firebase_auth/firebase_auth.dart';
final auth = FirebaseAuth.instance;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  // 로그인하는 중인지 체크할려고 만듦 ㅅㄱ
  bool isLoggingIn = false;

  // 로그인 함수
  userLogin() async {

    setState(() {
      isLoggingIn = true; // 체크 중이라고 보내고
    });

    try {
      await auth.signInWithEmailAndPassword(
          email: email.text.trim(),
          password: password.text.trim()
      );
      // 여기서 mounted 쓴 이유는 화면에 없는 위젯 조작 방지하려고 한거임
      if(mounted)  {
        Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (c)=> Mainpage()));
      }
    } catch(e) {
      print(e);
      // 이것도 위에랑 똑같음 이유 경고떠서 넣음 ㅋㅋ
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(failLogin);
    } finally {
      setState(() {
        isLoggingIn = false; // 로딩 끝났다고 해줘야지
      });
    }
  }

  // 스낵바
  final failLogin = SnackBar(
    content: Text('check your email or password'),
    duration: Duration(seconds: 2),
  );

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

                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Login',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600
                          )
                      ),
                    ],
                  ),
                ),

                SizedBox( height: 20 ),

                TextField(
                  controller: email,
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
                  controller: password,
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
                          child: Text('Forgot your Email or Password?',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.green
                              )
                          )),

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
                    child: TextButton(
                        onPressed: () { isLoggingIn ? null : userLogin(); },
                        child: Text( isLoggingIn ? '로그인 중' : 'Login', style: TextStyle( color: Colors.white, fontSize: 18))),
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
                        Navigator.push(context,
                        MaterialPageRoute(builder: (c) => Register()));
                      }, child: Text('Register', style: TextStyle( color: Colors.green, fontSize: 18))),
                    )
                ),

                SizedBox( height: 10 ),

                Text("Don't have an account?",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Colors.green
                    )
                ),

              ],
            ),
          ),
        )
    );
  }
}
