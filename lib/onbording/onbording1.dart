// ignore_for_file: constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';

import 'onbording2.dart';




class onbording extends StatefulWidget {
  const onbording({super.key});

  @override
  State<onbording> createState() => _onbordingState();
}

class _onbordingState extends State<onbording> {
   int counter = 0;
   String img='assets/lang.png';
static const Color C1=Color(0xffEFB58A);
static const Color C2= Color.fromARGB(145, 239, 182, 138);
static const Color C3= Color.fromARGB(145, 239, 182, 138);

  

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
  resizeToAvoidBottomInset : false,
      body: Column(
        children: [
      Padding(
        padding: const EdgeInsets.only(left: 20,right: 10,top: 90,bottom: 140),
        child: Image.asset(
          img
          ),
      ),
      
     const Row(
      mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Center(
           child: Icon(Icons.circle,
           key: Key('icon1'),
           size: 15,
           color: C1),
         ),
         SizedBox(width: 5,),
          Icon(Icons.circle,
          key: Key('icon2'),
         size: 15,
         color: C2 ,
         ),
         SizedBox(width: 5,),
          Icon(Icons.circle,
          key: Key('icon3'),
         size: 15,
         color:C3),
       ],
     ),
     const SizedBox(height: 20,),
     ElevatedButton(
      onPressed: (){
        Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const onbording2()),
  );
      },
       style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffEFB58A),
            fixedSize: const Size(180, 55),
            shape: RoundedRectangleBorder(
              
    borderRadius: BorderRadius.circular(25.0),
     )
     ),
      child: const Text('Next',
      style: TextStyle(
        fontSize: 32
      ),)
      )
     ]
     ),
    );
  }
}