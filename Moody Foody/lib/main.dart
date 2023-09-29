import 'package:flutter/material.dart';
import 'package:food/login.dart';
import 'signup.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main',
      routes: {
        '/login': (context) => LoginPage(), // Correct the class name
        '/sign_up': (context) => SignUp(),
        '/home': (context) => Home(),
      },
      home: Home(), // Set the LoginScreen as the initial screen
      debugShowCheckedModeBanner: false,
    );
  }
}
