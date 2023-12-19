import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_social_button/flutter_social_button.dart';
import 'dart:convert';
import 'signup.dart';
import 'home.dart';
import 'package:flutter/gestures.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(Login());

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Foody Moody",
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => Home(),
        '/signup': (context) => SignUp(),
      },
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double screenWidth = 0;
  double screenHeight = 0;
  double MoodySize = 0;
  double FoodySize = 0;
  double WelcomeSize = 0;
  bool _obscureText = true;
  bool isChecked = false;

  //TextEditingController _usernameController = TextEditingController();
  //TextEditingController _passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //========================================================================
  List<Map<String, String>> data = [];
  bool isLoading = true; // Initially, set to true for loading

  @override
  void initState() {
    super.initState();
    getData();
  }
//=========================login
  Future<void> getData() async {
    try {
      final response = await http.get(
        Uri.parse("http://localhost:3000/api/user"),
        headers: {
          "Accept": "application/json",
        },
      );

      if (response.statusCode == 200) {
        List<Map<String, dynamic>> jsonData =
            List<Map<String, dynamic>>.from(json.decode(response.body));

        List<Map<String, String>> userEntries = [];

        for (final item in jsonData) {
          final id = item["_id"];
          final email = item["email"];
          final password = item["password"];
          final role = item["role"];
          if (role != "") {
            if (email != null || password != null) {
              Map<String, String> userEntry = {
                "_id": id,
                "email": email ?? "",
                "password": password ?? "",
              };
              userEntries.add(userEntry);
            }
          }
        }

        setState(() {
          data = userEntries;
          isLoading =
              false; // Data has been fetched, set loading state to false
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false; // Set loading state to false on error
      });
      print("Error: $e");
    }
  }

// Save user information to SharedPreferences
  Future<void> saveUserInfo(String userId, String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userId', userId);
    prefs.setString('username', username);
  }

  // Retrieve user information from SharedPreferences
  Future<Map<String, String>> getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString('userId') ?? '';
    String username = prefs.getString('username') ?? '';
    return {'userId': userId, 'username': username};
  }

  void deleteUser(String userId) async {
    final response = await http.delete(
      Uri.parse("http://localhost:3000/api/user/$userId"),
      headers: {
        "Accept": "application/json",
      },
    );

    if (response.statusCode == 200) {
      print("User with ID $userId has been deleted successfully.");
      getData();
    } else {
      print(
          "Failed to delete user with ID $userId. Status code: ${response.statusCode}");
    }
  }

  void updateUser(BuildContext context, String userId) async {
    String updatedName = '';
    String updatedPassword = '';
    String updatedRole = '';

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Update User'),
          content: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                onChanged: (value) {
                  updatedName = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                onChanged: (value) {
                  updatedPassword = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Role'),
                onChanged: (value) {
                  updatedRole = value;
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text('Update'),
              onPressed: () async {
                final response = await http.put(
                  Uri.parse("http://localhost:3000/api/user/$userId"),
                  headers: {
                    "Accept": "application/json",
                    "Content-Type": "application/json",
                  },
                  body: jsonEncode({
                    "name": updatedName,
                    "password": updatedPassword,
                    "role": updatedRole,
                  }),
                );

                if (response.statusCode == 200) {
                  print("User with ID $userId has been updated successfully.");
                  getData();
                } else {
                  print(
                      "Failed to update user with ID $userId. Status code: ${response.statusCode}");
                }

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  //===============================================================================================
  Future<bool> loginUser(BuildContext context) async {
    try {
      final response = await http.post(
        Uri.parse("http://localhost:3000/api/login"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "email": emailController.text,
          "password": passwordController.text,
        }),
      );

      if (response.statusCode == 201) {
        // Login successful
        Map<String, String> userInfo = {
          'userId': 'yourUserId', // Replace with the actual user ID
          'username': emailController.text, // Assuming email is the username
        };

        await saveUserInfo(userInfo['userId']!, userInfo['username']!);

        // Navigate to the home page
        Navigator.pushNamed(context, '/home');

        return true;
      } else if (response.statusCode == 401) {
        // Invalid user or password
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Invalid user or password. Please try again."),
            backgroundColor: Colors.red,
          ),
        );
        return false;
      } else {
        // Other errors
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Login failed. Please try again later."),
            backgroundColor: Colors.red,
          ),
        );
        return false;
      }
    } catch (e) {
      // Handle network or other errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              "Error during login. Please check your internet connection."),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    WelcomeSize = screenWidth * 0.025;
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    WelcomeSize = screenWidth * 0.025;
    MoodySize = screenWidth * 0.08;
    FoodySize = screenWidth * 0.05;

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
            //Welcome Back to Moody Foody
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: '\n \n', style: TextStyle(height: 2.0)),
                    TextSpan(
                      text: '       Welcome Back',
                      style: TextStyle(
                        fontSize: WelcomeSize,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(64, 64, 63, 1),
                      ),
                    ),
                    TextSpan(
                      text: '\n',
                      style: TextStyle(
                        fontSize: WelcomeSize,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(64, 64, 63, 1),
                      ),
                    ),
                    TextSpan(
                      text: '                To',
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
                TextSpan(text: '\n ', style: TextStyle(height: 2.0)),
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
            //Login Here Text
            Center(
              child: Container(
                  child: RichText(
                      text: TextSpan(children: [
                TextSpan(text: '\n', style: TextStyle(height: 2.0)),
                TextSpan(
                  text: 'Login ',
                  style: TextStyle(
                    fontSize: WelcomeSize + 5,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
                TextSpan(
                  text: 'Here ',
                  style: TextStyle(
                      fontSize: WelcomeSize + 5,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(0, 0, 0, 1)),
                ),
                // ... (your login text)
              ]))),
            ),
            //Data Entry Block and check box
            Center(
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                width: screenWidth * 1 - 150,
                height: screenHeight / 4.5,
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
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            //Navigator.pushNamed(context, '/forgotpass');
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontSize: WelcomeSize,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(0, 0, 0, 1),
                            ),
                          ),
                        ),
                      ),
                    )
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
            )),
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
            //Log In Button
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
                    if (await loginUser(context)) {
                      // Login successful
                      Navigator.pushNamed(context, '/home');
                      print('Log in button tapped!');
                    } else {
                      // Show error popup if login fails
                      _showErrorPopup(
                          context, 'Invalid input. Please check your data.');
                    }
                  },
                  child: Text(
                    'Log In',
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
                        text: 'Dont have an Account? ',
                        style: TextStyle(
                          fontSize: WelcomeSize,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(
                          fontSize: WelcomeSize,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(219, 35, 38, 1.0),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, '/signup');
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
      _obscureText = !_obscureText;
    });
  }

  void _showErrorPopup(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void authenticateUser() {
    bool isAuthenticated = true;

    if (isAuthenticated) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
      // } else {
      //   // Show error message or handle authentication failure
      //   print('Authentication failed');
      //   showDialog(
      //     context: context,
      //     builder: (BuildContext context) {
      //       return AlertDialog(
      //         title: Text('Authentication Failed'),
      //         content: Text('Wrong credentials. Please try again.'),
      //         actions: [
      //           TextButton(
      //             onPressed: () {
      //               Navigator.of(context).pop();
      //             },
      //             child: Text('OK'),
      //           ),
      //         ],
      //       );
      //     },
      //   );
      // }
    }
  }
}
