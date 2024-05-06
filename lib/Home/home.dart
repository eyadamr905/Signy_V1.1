

// ignore_for_file: camel_case_types

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:test12/Cam/Xcam.dart';
import 'package:test12/Home/learning.dart';
import 'package:test12/login/classes.dart';
import 'package:test12/login/login.dart';

import 'profile.dart';
import 'signToWord.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar:  
              AppBar(
          
          title: const Text(' Welcome To Signy',style:TextStyle (fontSize: 32,fontWeight: FontWeight.w500,color: Color.fromARGB(255, 0, 0, 0)), ),
          
          ),
       bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
          child: BottomNavigationBar(
           onTap: (value) {
          if (value == 0) Navigator.push(context,MaterialPageRoute(builder: (context) => const home()),);
           if (value == 1) Navigator.push(context,MaterialPageRoute(builder: (context) => const Profile()),);
          if (value == 2) {
            Navigator.push(context,MaterialPageRoute(builder: (context) => const Learning()),
          );
          }
        },
          currentIndex: 0,
          backgroundColor: const Color.fromARGB(255, 244, 183, 131),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          selectedFontSize: 18,
          unselectedFontSize: 15,
          items:const [ 
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: "Home",backgroundColor: Colors.white),
        BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined),label: "Profile"),
        BottomNavigationBarItem(icon: Icon(Icons.book),label: "Learning"),
      
        ])),

        body: SingleChildScrollView(
              
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 30.0,right: 90),
                      child: Text("How can We help you ?... ",
                      style: TextStyle(
                        fontSize: 20
                      ),),
                    ),
                       const SizedBox(
                      height: 40,
                       ),
                  InkWell(
                    child: costumB(
                      text: "Learn    ",colorW:const Color.fromARGB(255, 244, 183, 131) ,img: "assets/woman1.png", 
                    ),
                     onTap: (){
                         Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const Learning()));
                    },
                  ),
                      
                   const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    child: costumB(
                      text: "From sign to words",colorW:const Color.fromARGB(255, 244, 183, 131) ,img: "assets/woman2.png",
                    ),
                      onTap: (){
                         Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>  Xcamera()));
                    },
                  ),
                   const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    child: costumB(
                      text: "From words to sign    ",colorW:const Color.fromARGB(255, 244, 183, 131) ,img: "assets/woman3.png",
                    ),
                     onTap: (){
                         Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>  const SignToWord()));
                          }
                  ),
                   const SizedBox(
                    height: 30,
                  ),
                   const SizedBox(
                    height: 30,
                  ),    
                  ],
                ),
              ),
            )
         ,
    );
  }
}