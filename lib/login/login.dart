// ignore_for_file: unused_field, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:test12/Auth/auth.dart';
import 'package:test12/Home/home.dart';
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
  final _Key = GlobalKey<FormState>();
  get validator => null;
  Auth auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(
              right: 250,
              top: 90,
            ),
            child: Text(
              'Sign In',
              style: TextStyle(
                fontSize: 32,
              ),
            ),
          ),
          //Email===============================
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 80),
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
                fillColor: Color.fromARGB(4, 241, 241, 241),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 5,
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
          //password========================================
          Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 50, bottom: 30),
            child: TextFormField(
              controller: controllerpassword,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'This password is a required';
                }
                return null;
              },
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "    Password",
                filled: true,
                fillColor: Colors.white,
                errorStyle: TextStyle(fontSize: 18.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 5,
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
                  borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
              ),
            ),
          ),
          //signin button=======================================
          ElevatedButton(
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
            onPressed: () {
              auth.loginFirebase(
                  controllerEmail.text, controllerpassword.text, context);
            },
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
              text: "Sign In with Google",
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SignInButton(
              mini: false,
              Buttons.Facebook,
              text: "Sign In with Google",
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: InkWell(
              child: const Text(
                " Go as a guest",
                style: TextStyle(
                    color: Color.fromARGB(255, 1, 1, 1),
                    fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const home()));
              },
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
        InkWell(
          child: const Text(
            " Sign Up",
            style: TextStyle(
                color: Color.fromARGB(255, 1, 1, 1),
                fontWeight: FontWeight.bold),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const signUp()));
          },
        ),
      ],
    );
  }
}
