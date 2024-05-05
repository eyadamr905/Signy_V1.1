import 'package:flutter/material.dart';

class SignToWord extends StatefulWidget {
  const SignToWord({ Key? key }) : super(key: key);

  @override
  _SignToWordState createState() => _SignToWordState();
}

class _SignToWordState extends State<SignToWord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   body: Column(
    children: [
      SizedBox(
        height: 450,
      ),
       Center(child: Text("Coming Soon",style: TextStyle(
        fontSize: 32
       ),)),
    ],
   ),   
    );
  }
}