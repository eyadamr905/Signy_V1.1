

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:test12/Auth/auth.dart';
import 'package:test12/Home/home.dart';

import 'classes.dart';
import 'signUp.dart';

// ignore: camel_case_types
class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

// ignore: camel_case_types
class _signinState extends State<signin> {
  final TextEditingController controllerpassword = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final _Key =GlobalKey<FormState>();
   get validator => null;
    Auth auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 250, top: 50,bottom: 25),
            child: Text(
              'Sign In',
              style: TextStyle(
                fontSize: 32,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          //first one
          Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 50),
                    child: TextFormField(
                      controller: controllerEmail,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This email is a required';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: '    Email',
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 3,
                            color: Colors.amber,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        labelStyle: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                        ),
                        errorStyle: TextStyle(fontSize: 18.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                  ),
          const SizedBox(
            height: 30,
          ),
          //second
          Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 20, bottom: 10),
                    child: TextFormField(
                      controller: controllerpassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This password is a required';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "    Password",
                        hintStyle: TextStyle(color: Colors.amber),
                        filled: true,
                        fillColor: Colors.white,
                        errorStyle: TextStyle(fontSize: 18.0),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 3,
                            color: Colors.amber,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        labelStyle: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                  ),
          const SizedBox(
            height: 20,
          ),
          //signin button
         ElevatedButton(
                    onPressed: () {                      
                        auth.loginFirebase(controllerEmail.text,
                            controllerpassword.text, context);
                      
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
                      "Login",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
          //other options
          signUpOption(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Divider(
                  indent: 20.0,
                  endIndent: 10.0,
                  thickness: 1,
                ),
              ),
              Text(
                "OR",
                style: TextStyle(color: Colors.blueGrey),
              ),
              Expanded(
                child: Divider(
                  indent: 10.0,
                  endIndent: 20.0,
                  thickness: 1,
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SignInButton(
              Buttons.Google,
              text: "Sign up with Google",
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SignInButton(
              mini: false,
             
              Buttons.Facebook,
              text: "Sign up with Google",
              onPressed: () {},
            ),
          ),
           Padding(
             padding: const EdgeInsets.only(top: 20.0),
             child: GestureDetector(
                       onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const home()));
                       },
                       child: const Text(
              " Go as a guest",
              style: TextStyle(
                  color: Color.fromARGB(255, 1, 1, 1),
                  fontWeight: FontWeight.bold),
                       ),
                     ),
           ),
        ],
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Color.fromARGB(179, 16, 16, 16))),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const signUp()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(
                color: Color.fromARGB(255, 1, 1, 1),
                fontWeight: FontWeight.bold),
          ),
        ),
       
      ],
      
    );
  }
}
//hello