// ignore_for_file: prefer_const_literals_to_create_immutables, library_private_types_in_public_api, use_super_parameters

import 'package:flutter/material.dart';
import 'package:test12/Home/Learning/Food.dart';
import 'package:test12/Home/Learning/alphabet.dart';
import 'package:test12/Home/Learning/animals.dart';
import 'package:test12/Home/Learning/numbers.dart';
import 'package:test12/Home/home.dart';

import '../login/classes.dart';
import 'profile.dart';

class Learning extends StatefulWidget {
  const Learning({ Key? key }) : super(key: key);

  @override
  _LearningState createState() => _LearningState();
}

class _LearningState extends State<Learning> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      iconTheme:  const IconThemeData(),
      title: const Text('Learning Time',style:TextStyle(fontWeight: FontWeight.w500) ,),
      ),
      body: SingleChildScrollView(
          child: Center(
            child: Column(
                    children: [
            Container(
              height: 30,
            ),
            InkWell(
              child: costumB(
                text: "Alphabet    ",colorW:Colors.orange ,img: "assets/a1.png",
              ),
              onTap: (){
                   Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Alphabet()));
              },
            ),
            Container(
              height: 30
            ),
            //second
            InkWell(
              child: costumB(
                text: "Numbers   ",colorW: const Color.fromARGB(255, 194, 91, 125),img: "assets/123.png",
                ),
                 onTap: (){
                   Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const numbers()));
              },
            ),
              
                    
            Container(
              height: 30,
            ),
            //third
            InkWell(
              child: costumB(
                text: "Animals     ",colorW: Colors.purple ,img: "assets/dog.png",
              ),
                 onTap: (){
                   Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Animals()));
              },
            ),
            
            
            Container(
              height: 30,
            ),
            
            
            //forth
            InkWell(
              child: costumB(
                text: "Food           ",colorW: const Color.fromARGB(255, 186, 17, 85),img: "assets/babyfood.png",
              ),
                 onTap: (){
                   Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const food()));
              },
            ),
            
            Container(
              height: 60,
            ),          
                    ],
                  ),
          )
      ),
    
         bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
          child: BottomNavigationBar(
         onTap: (value) {
        if (value == 0) Navigator.push(context,MaterialPageRoute(builder: (context) => const home()),);
         if (value == 1) Navigator.push(context,MaterialPageRoute(builder: (context) => const Profile()),);
         if (value == 2) Navigator.push(context,MaterialPageRoute(builder: (context) => const Learning()),);
      },
        currentIndex: 2,
        backgroundColor: Colors.orange,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        selectedFontSize: 18,
        unselectedFontSize: 15,
        items:[ 
      const BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
      const BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined),label: "Profile"),
      const BottomNavigationBarItem(icon: Icon(Icons.book),label: "Learning",backgroundColor: Colors.white),

      ])),
    );
  }
}