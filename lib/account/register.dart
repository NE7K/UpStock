import 'package:flutter/material.dart';

// firebase register and login
import 'package:firebase_auth/firebase_auth.dart';
import 'package:upstock/account/login.dart';
final auth = FirebaseAuth.instance;

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // TODO : MediaQuery 사용해서 동적 UI 제공. 사진 포함

  // 유저
  TextEditingController userID = TextEditingController();
  // 이멜 controller
  TextEditingController email = TextEditingController();
  // 비번 controller
  TextEditingController password = TextEditingController();

  bool isRegistering = false;

  userRegister() async {
    setState(() {
      isRegistering = true;
    });
    try {
      var result = await auth.createUserWithEmailAndPassword(
        email: email.text.trim(), // email 가져와서 공백 제거하고 넣어
        password: password.text.trim(),
      );
      result.user?.updateDisplayName(userID.text.trim()); // ? 쓰는 이유는 null일까봐
      if (mounted) {
        Navigator.pop(context);
      }
    } catch (e) {
      print(e);
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(failRegister);
    } finally {
      setState(() {
        isRegistering = false;
      });
    }
  }

  final failRegister = SnackBar(
    content: Text('회원가입 실패함 ㅅㄱ'),
    duration: Duration( seconds: 2 ),
  );

  final shouldRegister = SnackBar(
    content: Text('회원가입하라면 하셈'),
    duration: Duration( seconds: 2),
  );

  // 유저 회원가입
  @override
  void initState() {
    super.initState();
    userRegister();
  }

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
                    Text('Register',
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
                controller: userID,
                decoration: InputDecoration(
                    labelText: 'User ID',
                    hintText: 'Insert your ID',
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

                  prefixIcon: Icon(Icons.email_outlined), // icon images

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
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (c) => Login() ));
                    },
                        child: Text('Does this ID already exist?',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.green
                            )
                        )),
                  ],
                ),
              ),

              SizedBox( height: 30 ),

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
                      onPressed: () { isRegistering ? null : userRegister(); },
                      child: Text( isRegistering ? '회원가입 중' : 'Register', style: TextStyle( color: Colors.white, fontSize: 18))
                  ),
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

                      if(auth.currentUser?.uid == null){
                        print('회원가입을 진행하셔야 사용가능합니다.');
                        ScaffoldMessenger.of(context).showSnackBar(shouldRegister);
                      } else {
                        Navigator.pop(context);
                      }

                    }, child: Text('Done', style: TextStyle( color: Colors.green, fontSize: 18))),
                  )
              ),

            ],
          ),
        ),
      )
    );
  }
}
