// ignore_for_file: prefer_const_literals_to_create_immutables, use_super_parameters, library_private_types_in_public_api, unused_field

import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:test12/Home/home.dart';
import 'package:test12/Home/learning.dart';
import 'package:test12/login/classes.dart';

import '../login/login.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

    Uint8List? _image;

void selectImage()async{
  Uint8List img = await PickImage(ImageSource.gallery);
 setState(() {
           _image = img;     
                });

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My  Profile ',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body:
          Consumer<UiProvider>(builder: (context, UiProvider notifier, child) {
        return Column(
          children: [

            ListTile(
              leading: const Icon(Icons.dark_mode),
              title: const Text("Dark mode"),
              trailing: Switch(
                activeTrackColor: Colors.black,
                activeColor: const Color.fromARGB(255, 255, 232, 28),
                inactiveThumbColor: Colors.grey,
                inactiveTrackColor: Colors.white,
                value: notifier.isDark,
                onChanged: (value) => setState(() {
                  notifier.changeTheme();
                }),
              ),
            ),
            Center(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 500.0, left: 100, right: 100),
                child: ElevatedButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const signin()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(260, 60),
                    backgroundColor: Colors.orange,
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
        );
      }),
      bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          child: BottomNavigationBar(
              onTap: (value) {
                if (value == 0)
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const home()),
                  );
                if (value == 1)
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Profile()),
                  );
                if (value == 2)
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Learning()),
                  );
              },
              currentIndex: 1,
              backgroundColor: Colors.orange,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.black,
              selectedFontSize: 18,
              unselectedFontSize: 15,
              items: [
                const BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: "Home",
                ),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.person_2_outlined),
                    label: "Profile",
                    backgroundColor: Colors.white),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.book), label: "Learning"),
              ])),
    );
  }
}

//img picker for future
            // Stack(
            //   children: [
            //     _image!= null ?
            //     CircleAvatar(
            //        radius: 64,
            //       backgroundImage: MemoryImage(_image!),
            //     ):
                
            //     const CircleAvatar(
            //       radius: 64,
            //       backgroundImage: AssetImage('assets/avatar.png'),
            //     ),
            //     Positioned(
            //         child: IconButton(
            //       onPressed: () {

            //       },
            //       icon: const Icon(Icons.add_a_photo),
            //     ),
            //     bottom: -10,
            //     left: 80,
            //     )
            //   ],
            // ),