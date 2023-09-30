import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double screenWidth = 0; // Initialize with an initial value
  double screenHeight = 0; // Initialize with an initial value
  double MoodySize = 0;
  double FoodySize = 0;
  double WelcomeSize = 0;
  bool _obscureText = true; // Initial password visibility

  @override
  void initState() {
    super.initState();
    // Calculate values in the initState method
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    MoodySize = screenWidth * 0.08;
    FoodySize = screenWidth * 0.05;
    WelcomeSize = screenWidth * 0.025;
  }

  void togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText; // Toggle password visibility
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    // Calculate font size based on screen width
    double MoodySize = screenWidth * 0.08; // Adjust the multiplier as needed
    double FoodySize = screenWidth * 0.05; // Adjust the multiplier as needed
    double WelocomeSize =
        screenWidth * 0.025; // Adjust the multiplier as needed

    bool _obscureText = true; // Initial password visibility
    void togglePasswordVisibility() {
      setState(() {
        _obscureText = !_obscureText; // Toggle password visibility
      });
    }

    return Scaffold(
      //appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/BG.png"), fit: BoxFit.cover)),
        child: Column(
          children: <Widget>[
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: '\n \n', style: TextStyle(height: 2.0)),
                    //Welcome To
                    TextSpan(
                      text: '       Welcome To',
                      style: TextStyle(
                        fontSize: WelocomeSize,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(64, 64, 63, 1),
                      ),
                    ),
                    TextSpan(text: '\n', style: TextStyle(height: 2.0)),
                    //M
                    TextSpan(
                      text: '   M',
                      style: TextStyle(
                        fontSize: FoodySize,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(219, 35, 38, 1.0),
                      ),
                    ),
                    //OO
                    TextSpan(
                      text: 'OO',
                      style: TextStyle(
                        fontSize: FoodySize,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(244, 194, 13, 1.0),
                      ),
                    ),
                    //DY
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
                    //F
                    TextSpan(
                      text: 'F',
                      style: TextStyle(
                        fontSize: MoodySize,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(244, 194, 13, 1.0),
                      ),
                    ),
                    //OO
                    TextSpan(
                      text: 'OO',
                      style: TextStyle(
                        fontSize: MoodySize,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(219, 35, 38, 1.0),
                      ),
                    ),
                    //DY
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
            Center(
              child: Container(
                  child: RichText(
                      text: TextSpan(children: [
                TextSpan(text: '\n \n', style: TextStyle(height: 2.0)),
                TextSpan(
                  text: 'Please',
                  style: TextStyle(
                    fontSize: MoodySize,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
                TextSpan(
                  text: 'Login',
                  style: TextStyle(
                    fontSize: MoodySize,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(244, 194, 13, 1.0)
                  ),
                ),
                TextSpan(
                  text: 'or',
                  style: TextStyle(
                    fontSize: MoodySize,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
                TextSpan(
                  text: 'Sign up',
                  style: TextStyle(
                    fontSize: MoodySize,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(219, 35, 38, 1.0),
                  ),
                ),
                TextSpan(
                  text: 'to continue using our app.',
                  style: TextStyle(
                    fontSize: MoodySize,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
                
              ]))),
            ),
            Center(
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                width: screenWidth * 1 - 150,
                height: screenHeight / 2.5,
                // decoration: BoxDecoration(
                //   boxShadow: [
                //     BoxShadow(
                //       color: Color.fromARGB(61, 124, 118, 118),
                //       offset: Offset(2, 3),
                //       blurRadius: 2.5,
                //     ),
                //   ],
                // ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: screenWidth * 1 - 150,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(128, 194, 194,
                              194), // Set the background color to transparent
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
                            padding: const EdgeInsets.all(
                                2), // Set the padding as needed
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Username',
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 93, 93, 93),
                                  fontSize: WelocomeSize,
                                  fontFamily: 'Inter',
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(
                                    10.0), // Adjust the content padding as needed
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: screenWidth * 1 - 150,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(128, 194, 194,
                              194), // Set the background color to transparent
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
                            padding: const EdgeInsets.all(
                                2), // Set the padding as needed
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Email',
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 93, 93, 93),
                                  fontSize: WelocomeSize,
                                  fontFamily: 'Inter',
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(
                                    10.0), // Adjust the content padding as needed
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: screenWidth * 1 - 150,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(128, 194, 194,
                              194), // Set the background color to transparent
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
                            padding: const EdgeInsets.all(
                                2), // Set the padding as needed
                            child: TextField(
                              obscureText:
                                  _obscureText, // Hide the entered text when _obscureText is true
                              decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 93, 93, 93),
                                  fontSize: WelocomeSize,
                                  fontFamily: 'Inter',
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(
                                    10.0), // Adjust the content padding as needed
                                // Add an eye icon for password visibility toggle
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    // setState(() {
                                    //   _obscureText =
                                    //       !_obscureText; // Toggle password visibility
                                    // });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: screenWidth * 1 - 150,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(128, 194, 194,
                              194), // Set the background color to transparent
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
                            padding: const EdgeInsets.all(
                                2), // Set the padding as needed

                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: 'Confirm Passward',
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 93, 93, 93),
                                  fontSize: WelocomeSize,
                                  fontFamily: 'Inter',
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(
                                    10.0), // Adjust the content padding as needed
                              ),
                            ),
                          ),
                        ),
                      )

                      // Container(

                      //             child: Column(
                      //               crossAxisAlignment: CrossAxisAlignment.start,
                      //               children: [
                      //                 Container(
                      //                   margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 18.35 * fem),
                      //                   padding: EdgeInsets.fromLTRB(11.97 * fem, 11.89 * fem, 11.97 * fem, 11.89 * fem),
                      //                   width: 268.87 * fem,
                      //                   decoration: BoxDecoration(
                      //                     color: Color(0xafe6dcdc),
                      //                     borderRadius: BorderRadius.circular(7 * fem),
                      //                   ),
                      //                   child: Text(
                      //                     'Username',
                      //                     style: GoogleFonts.lato(
                      //                       fontSize: 11 * ffem,
                      //                       fontWeight: FontWeight.w800,
                      //                       height: 1.2125 * ffem / fem,
                      //                       color: Color(0x49000000),
                      //                     ),
                      //                   ),
                      //                 ),
                      //                 Container(
                      //                   margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 18.35 * fem),
                      //                   padding: EdgeInsets.fromLTRB(11.97 * fem, 11.89 * fem, 11.97 * fem, 11.89 * fem),
                      //                   width: 268.87 * fem,
                      //                   decoration: BoxDecoration(
                      //                     color: Color(0xafe6dcdc),
                      //                     borderRadius: BorderRadius.circular(7 * fem),
                      //                   ),
                      //                   child: Text(
                      //                     'Email',
                      //                     style: GoogleFonts.lato(

                      //                       fontSize: 11 * ffem,
                      //                       fontWeight: FontWeight.w800,
                      //                       height: 1.2125 * ffem / fem,
                      //                       color: Color(0x49000000),
                      //                     ),
                      //                   ),
                      //                 ),
                      //                 Opacity(
                      //                   opacity: 0.69,
                      //                   child: Container(
                      //                     margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 63.13 * fem, 19.43 * fem),
                      //                     padding: EdgeInsets.fromLTRB(11.97 * fem, 9.71 * fem, 7.62 * fem, 9.71 * fem),
                      //                     width: double.infinity,
                      //                     decoration: BoxDecoration(
                      //                       color: Color(0xffe5dcdc),
                      //                       borderRadius: BorderRadius.circular(7 * fem),
                      //                     ),
                      //                     child: Row(
                      //                       crossAxisAlignment: CrossAxisAlignment.center,
                      //                       children: [
                      //                         Container(
                      //                           margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 172.41 * fem, 0 * fem),
                      //                           child: Text(
                      //                             'Password',
                      //                             style: GoogleFonts.lato(

                      //                               fontSize: 11 * ffem,
                      //                               fontWeight: FontWeight.w800,
                      //                               height: 1.2125 * ffem / fem,
                      //                               color: Color(0x49000000),
                      //                             ),
                      //                           ),
                      //                         ),
                      //                         Container(
                      //                           width: 22.86 * fem,
                      //                           height: 18.35 * fem,

                      //                           child: Image(
                      //                             image: AssetImage('/images/1.png'), // Provide the asset path
                      //                             width: 22.86 * fem,
                      //                             height: 18.35 * fem,
                      //                           ),
                      //                         ),
                      //                       ],
                      //                     ),
                      //                   ),
                      //                 ),
                      //                 Container(
                      //                   margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 63.13 * fem, 21.59 * fem),
                      //                   padding: EdgeInsets.fromLTRB(11.97 * fem, 9.71 * fem, 7.62 * fem, 9.71 * fem),
                      //                   width: double.infinity,
                      //                   decoration: BoxDecoration(
                      //                     color: Color(0xafe6dcdc),
                      //                     borderRadius: BorderRadius.circular(7 * fem),
                      //                   ),
                      //                   child: Row(
                      //                     crossAxisAlignment: CrossAxisAlignment.center,
                      //                     children: [
                      //                       Container(
                      //                         margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 125.41 * fem, 0 * fem),
                      //                         child: Text(
                      //                           'Confirm Password',
                      //                           style: GoogleFonts.lato(

                      //                             fontSize: 11 * ffem,
                      //                             fontWeight: FontWeight.w800,
                      //                             height: 1.2125 * ffem / fem,
                      //                             color: Color(0x49000000),
                      //                           ),
                      //                         ),
                      //                       ),
                      //                       Container(
                      //                         width: 22.86 * fem,
                      //                         height: 18.35 * fem,
                      //                         // child: Image.network(
                      //                         //   '[Image url]',
                      //                         //   width: 22.86 * fem,
                      //                         //   height: 18.35 * fem,
                      //                         // ),
                      //                       ),
                      //                     ],
                      //                   ),
                      //                 ),
                      //                 Container(
                      //                   margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 154.67 * fem, 0 * fem),
                      //                   width: double.infinity,
                      //                   child: Row(
                      //                     crossAxisAlignment: CrossAxisAlignment.start,
                      //                     children: [
                      //                       Container(
                      //                         width: 16.33 * fem,
                      //                         height: 16.19 * fem,
                      //                         // child: Image.network(
                      //                         //   '[Image url]',
                      //                         //   width: 16.33 * fem,
                      //                         //   height: 16.19 * fem,
                      //                         // ),
                      //                       ),
                      //                       Container(
                      //                         margin: EdgeInsets.fromLTRB(0 * fem, 0.03 * fem, 0 * fem, 0 * fem),
                      //                         child: Text(
                      //                           'Agree with privacy and policy',
                      //                           style: GoogleFonts.lato(

                      //                             fontSize: 11 * ffem,
                      //                             fontWeight: FontWeight.w800,
                      //                             height: 1.2125 * ffem / fem,
                      //                             color: Color(0xff3c3c3c),
                      //                           ),
                      //                         ),
                      //                       ),
                      //                     ],
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                    ]),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(),
    );
  }
}
