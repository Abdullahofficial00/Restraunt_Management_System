import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:flutter/gestures.dart';
import 'package:food/index.dart';
import 'login.dart';
//for api
import 'dart:convert';
import 'package:http/http.dart' as http;

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

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =TextEditingController();
  Future<void> createUser() async {
    final url = Uri.parse('http://localhost:3000/api/user');
    try {
      print('Entered in api successfully');
      //print(usernameController, emailController ,passwordController,confirmPasswordController );
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': usernameController.text,
          'email': emailController.text,
          'password': passwordController.text,
          'ConfirmPassword': confirmPasswordController.text,
          'role': "User",
          'address': "",
          'phone': "",
        }),
      );

      if (response.statusCode == 201) {
        print('User created successfully');
        print(jsonDecode(response.body));
      } else {
        print('Failed to create user: ${response.statusCode}');
        print(jsonDecode(response.body));
      }
    } catch (error) {
      print('Error creating user: $error');
    }
  }

  Future<bool> _validateAndSubmit() async {
  bool isPolicyAgreed = await _validateInput();

  if (!isPolicyAgreed) {
    // Display error message using SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Please agree with the policies."),
        backgroundColor: Colors.red,
      ),
    );
    return false;
  }

  // Continue with your submission logic here

  // For example, if you have some asynchronous submission logic,
  // replace the following line with your actual logic.
  await Future.delayed(Duration(seconds: 2));

  // If submission logic was successful, return true
  return true;
}


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
                              controller: usernameController,
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
                              controller: emailController,
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
                              controller: passwordController,
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
                              controller: confirmPasswordController,
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
                  onPressed: () async {
                    if (await _validateAndSubmit()) {
                      // Perform signup logic if validation passes
                      createUser();
                      print('Sign Up tapped!');
                      Navigator.pushNamed(context, '/login');
                      print("Successfully login page");


                    } else {
                      // Show error popup if validation fails
                      _showErrorPopup(
                          context, 'Invalid input. Please check your data.');
                    }
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
    );
  }

  void togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText; // Toggle password visibility
    });
  }

  Future<bool> _validateInput() async {
  // Placeholder methods for backend validation
  bool isEmailValid = await _checkEmailExists(emailController.text);
  bool isUsernameUnique = await _checkUsernameUnique(usernameController.text);
  bool isPasswordValid = _checkPasswordValid(passwordController.text);
  bool isCPasswordValid = _checkconfirmPasswordValid(
      confirmPasswordController.text, passwordController.text);

  // Check if the checkbox is checked
  bool isPolicyAgreed = isChecked;

  // Display error if the checkbox is not checked
  if (!isPolicyAgreed) {
    // Show an error message with policies
    String policyErrorMessage = "Please agree with the following policies:\n\n";
    policyErrorMessage +=
        "1. Terms of Service: By using this application, you agree to abide by our Terms of Service.\n";
    policyErrorMessage +=
        "2. Privacy Policy: Your data is important to us. Read our Privacy Policy to understand how we handle your information.\n";
    policyErrorMessage +=
        "3. Code of Conduct: We expect all users to adhere to our Code of Conduct, promoting a respectful and inclusive environment.\n";
    policyErrorMessage +=
        "4. Cookies Policy: Our website uses cookies. Learn more about how we use cookies and how you can control them.\n";
    policyErrorMessage +=
        "5. Communication Policy: You may receive notifications and updates from us. Make sure to read our Communication Policy for details.\n";

    // You can add more policies as needed

    // Show the error message on the screen using a SnackBar
    final snackBar = SnackBar(
      content: Text(policyErrorMessage),
      backgroundColor: Colors.red, // You can customize the color
    );

    // Show the SnackBar in the Scaffold
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    return false; // Return false if the checkbox is not checked
  }

  return isEmailValid &&
      isUsernameUnique &&
      isPasswordValid &&
      isCPasswordValid &&
      isPolicyAgreed;
}

  Future<bool> _checkEmailExists(String email) async {
    print("$email");
    return true; // For simplicity, assume email is valid
  }

  Future<bool> _checkUsernameUnique(String username) async {
    print("$username");
    return true; // For simplicity, assume username is unique
  }

  bool _checkPasswordValid(String password) {
    print("$password");
    RegExp hasLetter = RegExp(r'[a-zA-Z]');
    RegExp hasDigit = RegExp(r'\d');

    return hasLetter.hasMatch(password) && hasDigit.hasMatch(password);
  }

  bool _checkconfirmPasswordValid(String confirmPassword, password) {
    if (confirmPassword == password) {
      print("$confirmPassword");
      return true;
    }

    // Placeholder for checking if the password contains both letters and numbers
    // Replace this with your actual password validation logic
    RegExp hasLetter = RegExp(r'[a-zA-Z]');
    RegExp hasDigit = RegExp(r'\d');

    return false;
  }

  void _showErrorPopup(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  //fromARGB(int i, int j, int k, int l) {}
}
