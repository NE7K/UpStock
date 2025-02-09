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
      body: Container(
        margin: EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          children: [
            SizedBox( height: 100 ),

            Image.asset('assets/images/icon.png',
                width: 300,
                height: 300,
            ),

            SizedBox( height: 50 ),

            Text('Welcome to app "UpStock"',
                style: TextStyle(
                  fontSize: 20
                )
            ),

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

                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade200, width: 1.5),
                  borderRadius: BorderRadius.circular(10)
                )

              ),
            )

          ],
        ),
      )
    );
  }
}
