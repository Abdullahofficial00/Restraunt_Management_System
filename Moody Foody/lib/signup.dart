import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:flutter/gestures.dart';
import 'package:food/index.dart';
import 'login.dart';
void main() => runApp(SignUp());

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Foody Moody",
      routes: {
        '/home': (context) => Home(),
        '/login': (context) => Login(),
      },
      home: SignUpPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<SignUpPage> {
  double screenWidth = 0;
  double screenHeight = 0;
  double MoodySize = 0;
  double FoodySize = 0;
  double WelcomeSize = 0;
  bool _obscureText = true;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    // Access MediaQuery properties in the build method
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    MoodySize = screenWidth * 0.08;
    FoodySize = screenWidth * 0.05;
    WelcomeSize = screenWidth * 0.025;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/BG.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            //Welcome to Moody Foody
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: '\n \n', style: TextStyle(height: 2.0)),
                    TextSpan(
                      text: '       Welcome To',
                      style: TextStyle(
                        fontSize: WelcomeSize,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(64, 64, 63, 1),
                      ),
                    ),
                    TextSpan(text: '\n', style: TextStyle(height: 2.0)),
                    TextSpan(
                      text: '   M',
                      style: TextStyle(
                        fontSize: FoodySize,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(219, 35, 38, 1.0),
                      ),
                    ),
                    TextSpan(
                      text: 'OO',
                      style: TextStyle(
                        fontSize: FoodySize,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(244, 194, 13, 1.0),
                      ),
                    ),
                    TextSpan(
                      text: 'DY',
                      style: TextStyle(
                        fontSize: FoodySize,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(219, 35, 38, 1.0),
                      ),
                    ),
                    TextSpan(text: '\n', style: TextStyle(height: 2.0)),
                    TextSpan(
                      text: 'F',
                      style: TextStyle(
                        fontSize: MoodySize,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(244, 194, 13, 1.0),
                      ),
                    ),
                    TextSpan(
                      text: 'OO',
                      style: TextStyle(
                        fontSize: MoodySize,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(219, 35, 38, 1.0),
                      ),
                    ),
                    TextSpan(
                      text: 'DY',
                      style: TextStyle(
                        fontSize: MoodySize,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(244, 194, 13, 1.0),
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.start,
              ),
            ),
            //Please Login or Sign up to continue using our app.
            Center(
              child: Container(
                  child: RichText(
                      text: TextSpan(children: [
                TextSpan(text: '\n \n', style: TextStyle(height: 2.0)),
                TextSpan(
                  text: 'Please ',
                  style: TextStyle(
                    fontSize: WelcomeSize,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
                TextSpan(
                  text: 'Login ',
                  style: TextStyle(
                      fontSize: WelcomeSize,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(244, 194, 13, 1.0)),
                ),
                TextSpan(
                  text: 'or ',
                  style: TextStyle(
                    fontSize: WelcomeSize,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
                TextSpan(
                  text: 'Sign up ',
                  style: TextStyle(
                    fontSize: WelcomeSize,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(219, 35, 38, 1.0),
                  ),
                ),
                TextSpan(
                  text: 'to continue using our app.',
                  style: TextStyle(
                    fontSize: WelcomeSize,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
              ]))),
            ),
            //Data Entry Block and check box
            Center(
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                width: screenWidth * 1 - 150,
                height: screenHeight / 2.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: 16.0,
                          top: 16.0), // Adjust the padding as needed
                      child: Container(
                        width: screenWidth * 1 - 150,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(128, 194, 194, 194),
                          borderRadius: BorderRadius.circular(7),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x3fa01212),
                              offset: Offset(1, 1),
                              blurRadius: 2.5,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Username',
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 93, 93, 93),
                                  fontSize: WelcomeSize,
                                  fontFamily: 'Inter',
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 16.0),
                      // Adjust the padding as needed
                      child: Container(
                        width: screenWidth * 1 - 150,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(128, 194, 194, 194),
                          borderRadius: BorderRadius.circular(7),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x3fa01212),
                              offset: Offset(1, 1),
                              blurRadius: 2.5,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Email',
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 93, 93, 93),
                                  fontSize: WelcomeSize,
                                  fontFamily: 'Inter',
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: 16.0), // Adjust the padding as needed
                      child: Container(
                        width: screenWidth * 1 - 150,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(128, 194, 194, 194),
                          borderRadius: BorderRadius.circular(7),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x3fa01212),
                              offset: Offset(1, 1),
                              blurRadius: 2.5,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: TextField(
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 93, 93, 93),
                                  fontSize: WelcomeSize,
                                  fontFamily: 'Inter',
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(10.0),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                  onPressed: togglePasswordVisibility,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: 16.0), // Adjust the padding as needed
                      child: Container(
                        width: screenWidth * 1 - 150,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(128, 194, 194, 194),
                          borderRadius: BorderRadius.circular(7),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x3fa01212),
                              offset: Offset(1, 1),
                              blurRadius: 2.5,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: TextField(
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                hintText: 'Confirm Password',
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 93, 93, 93),
                                  fontSize: WelcomeSize,
                                  fontFamily: 'Inter',
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(10.0),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                  onPressed: togglePasswordVisibility,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Checkbox(
                                  value: isChecked,
                                  onChanged: (bool? newValue) {
                                    setState(() {
                                      isChecked = newValue ?? false;
                                    });
                                  },
                                  activeColor: Color.fromRGBO(219, 35, 38, 1.0),
                                  checkColor: Color.fromRGBO(244, 194, 13, 1.0),
                                ),
                                Text("Agree with Privacy Policy"),
                              ],
                            )
                          ]),
                    ),
                  ],
                ),
              ),
            ),
            //Enter via Social Media
            Center(
              child: Container(
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Enter via ",
                      style: TextStyle(
                        fontSize: WelcomeSize,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      )),
                  TextSpan(
                      text: "Social Networks",
                      style: TextStyle(
                        fontSize: WelcomeSize,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(244, 194, 13, 1.0),
                      ))
                ])),
              ),
            ),
            //Social media icons
            Center(
                child: Container(
              width: screenWidth * 1 - 150,
              margin: EdgeInsets.all(25.0), // Adjust the margin as needed
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FlutterSocialButton(
                        onTap: () {},
                        mini: true,
                        buttonType: ButtonType.facebook,
                      ),
                      FlutterSocialButton(
                        onTap: () {},
                        mini: true,
                        buttonType: ButtonType.google,
                        iconColor: Colors.white,
                      ),
                      FlutterSocialButton(
                        onTap: () {},
                        mini: true,
                        buttonType: ButtonType.linkedin,
                      ),
                    ],
                  ),
                ],
              ),
            )
            ),
            //Or login with email
            Center(
              child: Container(
                padding: EdgeInsets.all(10.0), // Add padding to the Container
                  child: RichText(
                      text: TextSpan(children: [
                TextSpan(
                  text: 'Or ',
                  style: TextStyle(
                    fontSize: WelcomeSize,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
                TextSpan(
                  text: 'Login ',
                  style: TextStyle(
                      fontSize: WelcomeSize,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(219, 35, 38, 1.0)),
                ),
                TextSpan(
                  text: 'with ',
                  style: TextStyle(
                    fontSize: WelcomeSize,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
                TextSpan(
                  text: 'Email',
                  style: TextStyle(
                    fontSize: WelcomeSize,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(219, 35, 38, 1.0),
                  ),
                ),
              ]))),
            ),
            //Sign Up Button
            Center(
              child: Container(
                width: screenWidth * 1 - 150,
                height: 40,
                padding: EdgeInsets.all(8.0), // Add padding to the Container
                decoration: BoxDecoration(
                  color: Color.fromRGBO(219, 35, 38,
                      0.8), // Set alpha value to 0.8 for some transparency
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: TextButton(
                  onPressed: () {
                    // Handle the Sign Up button tap
                    print('Sign Up tapped!');
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            //You already have an Account? Log In
            Center(
              child: Container(
                padding: EdgeInsets.all(10.0), // Add padding to the Container
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'You already have an Account? ',
                        style: TextStyle(
                          fontSize: WelcomeSize,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                      TextSpan(
                        text: 'Log In',
                        style: TextStyle(
                          fontSize: WelcomeSize,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(219, 35, 38, 1.0),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, '/login');
                            print("Successfully pressed login");
                            // Press login to navigate to the login page code here
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(),
    );
  }

  void togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText; // Toggle password visibility
    });
  }

  //fromARGB(int i, int j, int k, int l) {}
}
