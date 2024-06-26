// ignore_for_file: depend_on_referenced_packages
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:test12/login/classes.dart';
import 'package:test12/onbording/onbording.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Home/home.dart';
import 'firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login/login.dart';

User? logged;
bool? start;
//to check if you opendThe App before 
void openFun() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? flag = prefs.getBool('started');
  if (flag == null) {
    await prefs.setBool('started', true);
    start = true;
  } else {
    start = false;
  }
}
void main() async {
  openFun();
  //decleare the platform 
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
//looged = current user in the app
  logged = FirebaseAuth.instance.currentUser;
  runApp( Signy());
}

class Signy extends StatelessWidget {
   Signy({super.key});




  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => UiProvider()..init(),
      child:
          Consumer<UiProvider>(builder: (context, UiProvider notifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
        themeMode: notifier.isDark ? ThemeMode.dark : ThemeMode.light,
            darkTheme:
                notifier.isDark ? notifier.darkTheme : notifier.lightTheme,
            theme: notifier.lightTheme,
          home:
          start == true? 
            const welcom()
              : logged == null? 
                  const signin()
                  : const home(),
        );
      }),
    );
  }
}
