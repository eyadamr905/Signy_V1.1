

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test12/Cam/Xcam.dart';
import 'package:test12/Home/learning.dart';
import 'package:test12/login/classes.dart';
import 'package:test12/login/login.dart';

import 'profile.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
           onTap: (value) {
          if (value == 0) Navigator.push(context,MaterialPageRoute(builder: (context) => const home()),);
           if (value == 1) Navigator.push(context,MaterialPageRoute(builder: (context) => Profile()),);
          if (value == 2)Navigator.push(context,MaterialPageRoute(builder: (context) => const Learning()),
          );
        },
          currentIndex: 0,
          backgroundColor: Colors.orange,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          selectedFontSize: 18,
          unselectedFontSize: 15,
          items:[ 
        const BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: "Home",backgroundColor: Colors.white),
        const BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined),label: "Profile"),
        const BottomNavigationBarItem(icon: Icon(Icons.saved_search_outlined),label: "Saves"),
      
        ]),
        appBar:  AppBar(
          backgroundColor: const Color.fromARGB(255, 249, 249, 249),
          toolbarHeight: 60,
          leading: const CircleAvatar(
           backgroundImage: AssetImage("assets/shirt.png")
          ),
        iconTheme:  const IconThemeData(),
        title: const Text('Harbi',style:TextStyle(fontWeight: FontWeight.w500,color: Color.fromARGB(255, 0, 0, 0)) ,),
        ),
        body: SingleChildScrollView(
           
          child: Center(
            child: Column(
              children: [
                   const SizedBox(
                  height: 60,
                   ),
              InkWell(
                child: costumB(
                  text: "Learn    ",colorW:Colors.orange ,img: "assets/woman1.png", 
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
                  text: "From sign to words",colorW:const Color.fromARGB(255, 0, 255, 60) ,img: "assets/woman2.png",
                ),
                  onTap: (){
                     Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>  Xcamera()));
                },
              ),
               const SizedBox(
                height: 30,
              ),
              costumB(
                text: "From words to sign    ",colorW:const Color.fromARGB(255, 0, 51, 255) ,img: "assets/woman3.png",
              ),
               const SizedBox(
                height: 30,
              ),
               const SizedBox(
                height: 30,
              ),
                    
              ],
            ),
          )
        ),
      ),
    );
  }
}