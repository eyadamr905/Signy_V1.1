import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test12/Home/home.dart';
import 'package:test12/Home/learning.dart';

import '../login/login.dart';


class Profile extends StatefulWidget {
  const Profile({ Key? key }) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
              bottomNavigationBar: BottomNavigationBar(
         onTap: (value) {
        if (value == 0) Navigator.push(context,MaterialPageRoute(builder: (context) => home()),);
        if (value == 1) Navigator.push(context,MaterialPageRoute(builder: (context) => Profile()),);
         if (value == 2) Navigator.push(context,MaterialPageRoute(builder: (context) => Learning()),);
      },
        currentIndex: 1,
        backgroundColor: Colors.orange,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        selectedFontSize: 18,
        unselectedFontSize: 15,
        items:[ 
      BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home",),
      BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined),label: "Profile",backgroundColor: Colors.white),
      BottomNavigationBarItem(icon: Icon(Icons.saved_search_outlined),label: "Saves"),

      ]),
      appBar: AppBar(
        toolbarHeight: 60,
        leading: CircleAvatar(
         backgroundImage: AssetImage("assets/shirt.png")
        ),
      iconTheme:  IconThemeData(),
      title: Text('Learning Time',style:TextStyle(fontWeight: FontWeight.w500) ,),
      ),
      body: Column(
          children: [
             Center(
            child: Padding(
              padding: const EdgeInsets.only(top:500.0,left: 100,right: 100),
              child:ElevatedButton(
                      onPressed: () {                      
                           FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => signin()),
              );
                        
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(260, 60),
                        backgroundColor: Colors.amber,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text(
                        "Log out",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
            ),
          )

          ],

      ),
         
    );
  }
}