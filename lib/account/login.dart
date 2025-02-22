import 'package:flutter/material.dart';
import 'package:upstock/account/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  userLogin() async {
    try {
      await auth.signInWithEmailAndPassword(
          email: email.text.trim(),
          password: password.text.trim()
      );

    } catch(e) {
      print(e);
    }
  }

  final failLogin = SnackBar(
    content: Text('로그인 실패함 ㅅㄱ'),
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

                // todo : 일단 제목으로 넣어두긴 했는데 없는게 차라리 이쁜듯 ㅋㅋ
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
                    child: TextButton(onPressed: () {

                      userLogin();
                      // todo : if문 써서 정상적으로 로그인된거 확인하면 pop 때리삼

                      if(auth.currentUser?.uid == null){
                        print('로그인되지 않았습니다.');
                        ScaffoldMessenger.of(context).showSnackBar(failLogin);
                      } else {
                        Navigator.pop(context);
                      }

                    }, child: Text('Login', style: TextStyle( color: Colors.white, fontSize: 18))),
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
                        Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (c) => Register()));
                      }, child: Text('Register', style: TextStyle( color: Colors.green, fontSize: 18))),
                    )
                ),

                SizedBox( height: 10 ),

                Text("Don't have an account?",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
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
