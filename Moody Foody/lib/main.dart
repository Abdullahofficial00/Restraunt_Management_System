//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food/login.dart';
import 'package:food/signup.dart';
import 'package:food/test.dart';
import 'package:food/home.dart' as myHome;
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
        '/login': (context) => LoginPage(),
        '/sign_up': (context) => SignUp(),
        '/home': (context) => myHome.MyHomePage2(),
        '/test': (context) => MyHomePage1(),
      },
      //home: myHome.MyHomePage2(),
      home: SignUp(),
      debugShowCheckedModeBanner: false,
    );
  }
}
