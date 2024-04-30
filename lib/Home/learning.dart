import 'package:flutter/material.dart';
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
      
        bottomNavigationBar: BottomNavigationBar(
         onTap: (value) {
        if (value == 0) Navigator.push(context,MaterialPageRoute(builder: (context) => home()),);
         if (value == 1) Navigator.push(context,MaterialPageRoute(builder: (context) => Profile()),);
         if (value == 2) Navigator.push(context,MaterialPageRoute(builder: (context) => Learning()),);
      },
        currentIndex: 2,
        backgroundColor: Colors.orange,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        selectedFontSize: 18,
        unselectedFontSize: 15,
        items:[ 
      BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined),label: "Profile"),
      BottomNavigationBarItem(icon: Icon(Icons.saved_search_outlined),label: "Saves",backgroundColor: Colors.white),

      ]),
      appBar: AppBar(
        toolbarHeight: 60,
        leading: CircleAvatar(
         backgroundImage: AssetImage("assets/shirt.png")
        ),
      iconTheme:  IconThemeData(),
      title: Text('Learning Time',style:TextStyle(fontWeight: FontWeight.w500) ,),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            height: 30,
          ),
          costumB(
            text: "Alphabet    ",colorW:Colors.orange ,img: "assets/a1.png",
          ),
          Container(
            height: 30
          ),
          //second
          costumB(
            text: "Numbers   ",colorW: Color.fromARGB(255, 194, 91, 125),img: "assets/123.png",
            ),
            
        
          Container(
            height: 30,
          ),
          //third
          costumB(
            text: "Animals     ",colorW: Colors.purple ,img: "assets/dog.png",
            
          ),


          Container(
            height: 30,
          ),


          //forth
          costumB(
            text: "Food           ",colorW: Color.fromARGB(255, 186, 17, 85),img: "assets/babyfood.png",
            
          ),

          Container(
            height: 30,
          ),          
          costumB(
            text: "Clothes      ",colorW: Color.fromARGB(255, 204, 93, 74) ,img: "assets/shirt.png",
            
          ),
           Container(
            height: 30,
          ),
        ],
      )
      ),
    );
  }
}