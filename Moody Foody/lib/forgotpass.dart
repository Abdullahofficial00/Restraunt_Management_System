import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Call the API to send the password to the provided email
                sendPassword();
              },
              child: Text('Send Password'),
            ),
          ],
        ),
      ),
    );
  }

  void sendPassword() async {
    // Assuming you have a function to handle the API call
    // and the API URL is '/forgot-password'
    final response = await http.post(
      Uri.parse("http://localhost:3000/api/forgot"),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      body: jsonEncode({"email": _emailController.text}),
    );

    if (response.statusCode == 201) {
      // Password sent successfully
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Password sent to the provided email"),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      // Failed to send password
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to send password. Please check your email."),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
