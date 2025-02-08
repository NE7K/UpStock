import 'package:flutter/material.dart';
import 'package:upstock/home.dart';
import 'package:upstock/main.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                colors: [
                  Color(0xFFE67E22),
                  Colors.orange[300]!
                ]
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox( height: 80 ),
                    Text('Stock Comunicatity', style: TextStyle( fontSize: 40, color: Colors.white, fontWeight: FontWeight.w600)),
                    Text('Register Now', style: TextStyle( fontSize: 20, color: Colors.white)),

                    SizedBox( height: 40 )
                  ],
                )
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only( topLeft: Radius.circular(40), topRight: Radius.circular(40))
                ),

                child: Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox( height: 60 ),

                      Text('Create ID', style: TextStyle( fontSize: 15, color: Colors.grey[600]),),

                      SizedBox( height: 10 ),

                      // Card
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 20,
                                  offset: Offset(0, 5)
                              )
                            ]
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Insert Email',
                              hintStyle: TextStyle( color: Colors.grey ),
                              border: InputBorder.none
                          ),
                        ),
                      ),

                      // password
                      SizedBox( height: 40 ),

                      Text('Create Password', style: TextStyle( fontSize: 15, color: Colors.grey[600]),),

                      SizedBox( height: 10 ),

                      // Card
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 20,
                                  offset: Offset(0, 5)
                              )
                            ]
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Insert Password',
                              hintStyle: TextStyle( color: Colors.grey ),
                              border: InputBorder.none
                          ),
                        ),
                      ),

                      SizedBox( height: 50 ),


                      Column(
                        children: [
                          Text('I forgot my Email', style: TextStyle( fontSize: 12, color: Colors.grey)),

                          SizedBox( height: 50 ),

                          Container(
                              height: 60,
                              margin: EdgeInsets.symmetric(horizontal: 60),
                              decoration: BoxDecoration(
                                  color: Colors.orange[400],
                                  borderRadius: BorderRadius.circular(50)
                              ),
                              child: Center(
                                child: TextButton(onPressed: () {}, child: Text('Register', style: TextStyle( color: Colors.white, fontSize: 20)))
                              )
                          ),

                          SizedBox( height: 30 ),

                          Container(
                              height: 60,
                              margin: EdgeInsets.symmetric(horizontal: 60),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                      color: Colors.orange[600]!,
                                      width: 2
                                  )
                              ),
                              child: Center(
                                child: TextButton(onPressed: () {
                                  Navigator.pop(context);
                                }, child:  Text('Done', style: TextStyle( color: Colors.grey[900]!, fontSize: 20)))
                              )
                          )

                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
