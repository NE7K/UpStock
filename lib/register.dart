import 'package:flutter/material.dart';
import 'package:upstock/home.dart';
import 'package:upstock/main.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          children: [
            SizedBox( height: 100 ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.person_outline),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),

            ),
          ],
        ),
      )
    );
  }
}
