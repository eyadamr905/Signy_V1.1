
// ignore_for_file: unused_field, file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test12/Auth/auth.dart';
import '../Home/home.dart';
import 'classes.dart';

// ignore: camel_case_types
class signUp extends StatefulWidget {
  const signUp({super.key});
  @override
  State<signUp> createState() => _signUpState();
}

// ignore: camel_case_types
class _signUpState extends State<signUp> {
  final TextEditingController controllerpassword = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final _key =GlobalKey<FormState>();
  get validator => null;
  Auth auth = Auth();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Column(
          children: [
        
            SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Enter UserName", Icons.person_outline, false,
                      _userNameController),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Enter Email Id", Icons.person_outline, false,
                      controllerEmail),
                  const SizedBox(
                    height: 20,
                  ),
                  reusableTextField("Enter Password", Icons.lock_outlined, true,
                      controllerpassword),
                  const SizedBox(
                    height: 20,
                  ),
                  firebaseUIButton(context, "Sign Up", () {
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: controllerEmail.text,
                            password: controllerpassword.text)
                        .then((value) {
                      // print("Created New Account");
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const home()));
                    }).onError((error, stackTrace) {
                      // print("Error ${error.toString()}");
                    });
                  })
                ],
              ),
            )
        ),
        ],),
      ),
    );
  }
}