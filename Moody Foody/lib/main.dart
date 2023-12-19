//import 'package:firebase_core/firebase_core.dart';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:foody/login.dart';
import 'package:foody/signup.dart';
import 'package:foody/test.dart';
import 'package:foody/home.dart';
import 'package:foody/Image.dart' as Image;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main',
      routes: {
        '/login': (context) => Login(),
        '/sign_up': (context) => SignUp(),
        '/home': (context) => Home(),
        //'/test': (context) => Test(),
        '/image': (context) => Image.FoodGallery(),
      },
      home: Login(),
      //home: Image.FoodGallery(),
      debugShowCheckedModeBanner: false,
    );
  }
}
