// ignore_for_file: depend_on_referenced_packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  logged = FirebaseAuth.instance.currentUser;
  runApp(const Signy());
}

class Signy extends StatelessWidget {
  const Signy({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => UiProvider()..init(),
      child:
          Consumer<UiProvider>(builder: (context, UiProvider notifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ToDo App',
          // themeMode: notifier.isDark ? ThemeMode.dark : ThemeMode.light,
          themeMode: ThemeMode.dark,
          // darkTheme: notifier.isDark ? notifier.darkTheme : notifier.lightTheme,
          // darkTheme = notifier.darkTheme,
          theme: notifier.darkTheme,
          home: start == true
              ? const welcom()
              : logged == null
                  ? const signin()
                  : const home(),
        );
      }),
    );
  }
}
