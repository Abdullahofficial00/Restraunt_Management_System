import 'package:flutter/material.dart';
import 'index.dart' as tester;

// double ffem = 1.0; // Adjust as needed
// double fem = 1.0; // Adjust as needed

void main() => runApp(MaterialApp(title: "Moody Foody",debugShowCheckedModeBanner: false, home: tester.Home()));

// class home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: SafeArea(
//           child: Container(
//             child: Stack(
//               children: [
//                 // ... Add the rest of the code from your snippet ...
//                 Container(
//                 //   child: Stack(
//                 //     children: [
//                 //       //BOX for Data----------------------------------------------------

//                 //       // Positioned(
//                 //       //   left: 43 * fem,
//                 //       //   top: 271 * fem,
//                 //       //   child: Container(
//                 //       //     padding: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0 * fem),
//                 //       //     width: 332 * fem,
//                 //       //     height: 245 * fem,
//                 //       //     decoration: BoxDecoration(
//                 //       //       boxShadow: [
//                 //       //         BoxShadow(
//                 //       //           color: Color(0x3fa01212),
//                 //       //           offset: Offset(2 * fem, 3 * fem),
//                 //       //           blurRadius: 2.5 * fem,
//                 //       //         ),
//                 //       //       ],
//                 //       //     ),
//                 //       //     child: Column(
//                 //       //       crossAxisAlignment: CrossAxisAlignment.start,
//                 //       //       children: [
//                 //       //         Container(
//                 //       //           margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 18.35 * fem),
//                 //       //           padding: EdgeInsets.fromLTRB(11.97 * fem, 11.89 * fem, 11.97 * fem, 11.89 * fem),
//                 //       //           width: 268.87 * fem,
//                 //       //           decoration: BoxDecoration(
//                 //       //             color: Color(0xafe6dcdc),
//                 //       //             borderRadius: BorderRadius.circular(7 * fem),
//                 //       //           ),
//                 //       //           child: Text(
//                 //       //             'Username',
//                 //       //             style: GoogleFonts.lato(
//                 //       //               fontSize: 11 * ffem,
//                 //       //               fontWeight: FontWeight.w800,
//                 //       //               height: 1.2125 * ffem / fem,
//                 //       //               color: Color(0x49000000),
//                 //       //             ),
//                 //       //           ),
//                 //       //         ),
//                 //       //         Container(
//                 //       //           margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 18.35 * fem),
//                 //       //           padding: EdgeInsets.fromLTRB(11.97 * fem, 11.89 * fem, 11.97 * fem, 11.89 * fem),
//                 //       //           width: 268.87 * fem,
//                 //       //           decoration: BoxDecoration(
//                 //       //             color: Color(0xafe6dcdc),
//                 //       //             borderRadius: BorderRadius.circular(7 * fem),
//                 //       //           ),
//                 //       //           child: Text(
//                 //       //             'Email',
//                 //       //             style: GoogleFonts.lato(

//                 //       //               fontSize: 11 * ffem,
//                 //       //               fontWeight: FontWeight.w800,
//                 //       //               height: 1.2125 * ffem / fem,
//                 //       //               color: Color(0x49000000),
//                 //       //             ),
//                 //       //           ),
//                 //       //         ),
//                 //       //         Opacity(
//                 //       //           opacity: 0.69,
//                 //       //           child: Container(
//                 //       //             margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 63.13 * fem, 19.43 * fem),
//                 //       //             padding: EdgeInsets.fromLTRB(11.97 * fem, 9.71 * fem, 7.62 * fem, 9.71 * fem),
//                 //       //             width: double.infinity,
//                 //       //             decoration: BoxDecoration(
//                 //       //               color: Color(0xffe5dcdc),
//                 //       //               borderRadius: BorderRadius.circular(7 * fem),
//                 //       //             ),
//                 //       //             child: Row(
//                 //       //               crossAxisAlignment: CrossAxisAlignment.center,
//                 //       //               children: [
//                 //       //                 Container(
//                 //       //                   margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 172.41 * fem, 0 * fem),
//                 //       //                   child: Text(
//                 //       //                     'Password',
//                 //       //                     style: GoogleFonts.lato(

//                 //       //                       fontSize: 11 * ffem,
//                 //       //                       fontWeight: FontWeight.w800,
//                 //       //                       height: 1.2125 * ffem / fem,
//                 //       //                       color: Color(0x49000000),
//                 //       //                     ),
//                 //       //                   ),
//                 //       //                 ),
//                 //       //                 Container(
//                 //       //                   width: 22.86 * fem,
//                 //       //                   height: 18.35 * fem,

//                 //       //                   child: Image(
//                 //       //                     image: AssetImage('/images/1.png'), // Provide the asset path
//                 //       //                     width: 22.86 * fem,
//                 //       //                     height: 18.35 * fem,
//                 //       //                   ),
//                 //       //                 ),
//                 //       //               ],
//                 //       //             ),
//                 //       //           ),
//                 //       //         ),
//                 //       //         Container(
//                 //       //           margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 63.13 * fem, 21.59 * fem),
//                 //       //           padding: EdgeInsets.fromLTRB(11.97 * fem, 9.71 * fem, 7.62 * fem, 9.71 * fem),
//                 //       //           width: double.infinity,
//                 //       //           decoration: BoxDecoration(
//                 //       //             color: Color(0xafe6dcdc),
//                 //       //             borderRadius: BorderRadius.circular(7 * fem),
//                 //       //           ),
//                 //       //           child: Row(
//                 //       //             crossAxisAlignment: CrossAxisAlignment.center,
//                 //       //             children: [
//                 //       //               Container(
//                 //       //                 margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 125.41 * fem, 0 * fem),
//                 //       //                 child: Text(
//                 //       //                   'Confirm Password',
//                 //       //                   style: GoogleFonts.lato(

//                 //       //                     fontSize: 11 * ffem,
//                 //       //                     fontWeight: FontWeight.w800,
//                 //       //                     height: 1.2125 * ffem / fem,
//                 //       //                     color: Color(0x49000000),
//                 //       //                   ),
//                 //       //                 ),
//                 //       //               ),
//                 //       //               Container(
//                 //       //                 width: 22.86 * fem,
//                 //       //                 height: 18.35 * fem,
//                 //       //                 // child: Image.network(
//                 //       //                 //   '[Image url]',
//                 //       //                 //   width: 22.86 * fem,
//                 //       //                 //   height: 18.35 * fem,
//                 //       //                 // ),
//                 //       //               ),
//                 //       //             ],
//                 //       //           ),
//                 //       //         ),
//                 //       //         Container(
//                 //       //           margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 154.67 * fem, 0 * fem),
//                 //       //           width: double.infinity,
//                 //       //           child: Row(
//                 //       //             crossAxisAlignment: CrossAxisAlignment.start,
//                 //       //             children: [
//                 //       //               Container(
//                 //       //                 width: 16.33 * fem,
//                 //       //                 height: 16.19 * fem,
//                 //       //                 // child: Image.network(
//                 //       //                 //   '[Image url]',
//                 //       //                 //   width: 16.33 * fem,
//                 //       //                 //   height: 16.19 * fem,
//                 //       //                 // ),
//                 //       //               ),
//                 //       //               Container(
//                 //       //                 margin: EdgeInsets.fromLTRB(0 * fem, 0.03 * fem, 0 * fem, 0 * fem),
//                 //       //                 child: Text(
//                 //       //                   'Agree with privacy and policy',
//                 //       //                   style: GoogleFonts.lato(

//                 //       //                     fontSize: 11 * ffem,
//                 //       //                     fontWeight: FontWeight.w800,
//                 //       //                     height: 1.2125 * ffem / fem,
//                 //       //                     color: Color(0xff3c3c3c),
//                 //       //                   ),
//                 //       //                 ),
//                 //       //               ),
//                 //       //             ],
//                 //       //           ),
//                 //       //         ),
//                 //       //       ],
//                 //       //     ),
//                 //       //   ),
//                 //       // ),
//                 //       Positioned(
//                 //         // left: 0 * fem,
//                 //         // top: 18 * fem,
//                 //         child: Container(
//                 //           width: 672 * fem,
//                 //           height: 725 * fem,
//                 //           child: Stack(
//                 //             children: [
//                 //               Positioned(
//                 //                 // left: 211 * fem,
//                 //                 // top: 332 * fem,
//                 //                 child: Align(
//                 //                     // child: SizedBox(
//                 //                     //   width: 238 * fem,
//                 //                     //   height: 212 * fem,
//                 //                     //   child: Image.network(
//                 //                     //     '[Image url]',
//                 //                     //     fit: BoxFit.cover,
//                 //                     //   ),
//                 //                     // ),
//                 //                     ),
//                 //               ),
//                 //               Positioned(
//                 //                 // left: 0 ,
//                 //                 // top: 0,
//                 //                 child: Align(
//                 //                   child: SizedBox(
//                 //                     width: 500 * fem,
//                 //                     height: 500 * fem,
//                 //                     child: Image(
//                 //                       image: AssetImage('/images/1.png'),
//                 //                       height: 32,
//                 //                       width: 32,
//                 //                     ),
//                 //                   ),
//                 //                 ),
//                 //               ),
//                 //               Positioned(
//                 //                 // left: 0 * fem,
//                 //                 // top: 479 * fem,
//                 //                 child: Align(
//                 //                   child: SizedBox(
//                 //                     width: 245 * fem,
//                 //                     height: 246 * fem,
//                 //                     child: Image(
//                 //                       image: AssetImage('/images/3.png'),
//                 //                       height: 32,
//                 //                       width: 32,
//                 //                     ),
//                 //                   ),
//                 //                 ),
//                 //               ),
//                 //               Positioned(
//                 //                 // left: 114 * fem,
//                 //                 // top: 521 * fem,
//                 //                 child: Center(
//                 //                   child: Align(
//                 //                     child: SizedBox(
//                 //                       width: 132 * fem,
//                 //                       height: 14 * fem,
//                 //                       child: RichText(
//                 //                         textAlign: TextAlign.center,
//                 //                         text: TextSpan(
//                 //                           style: GoogleFonts.lato(
//                 //                             fontSize: 11 * ffem,
//                 //                             fontWeight: FontWeight.w800,
//                 //                             height: 1.2125 * ffem / fem,
//                 //                             color: Color(0xffe8e6e6),
//                 //                           ),
//                 //                           children: [
//                 //                             TextSpan(
//                 //                               text: 'Enter via',
//                 //                               style: GoogleFonts.lato(
//                 //                                 fontSize: 11 * ffem,
//                 //                                 fontWeight: FontWeight.w800,
//                 //                                 height: 1.2125 * ffem / fem,
//                 //                                 color: Color(0xff3c3c3c),
//                 //                               ),
//                 //                             ),
//                 //                             TextSpan(text: ' '),
//                 //                             TextSpan(
//                 //                               text: 'Social Networks',
//                 //                               style: GoogleFonts.lato(
//                 //                                 fontSize: 11 * ffem,
//                 //                                 fontWeight: FontWeight.w800,
//                 //                                 height: 1.2125 * ffem / fem,
//                 //                                 color: Color(0xfff4c20d),
//                 //                               ),
//                 //                             ),
//                 //                           ],
//                 //                         ),
//                 //                       ),
//                 //                     ),
//                 //                   ),
//                 //                 ),
//                 //               ),
//                 //               Positioned(
//                 //                 // left: 83.5 * fem,
//                 //                 // top: 702 * fem,
//                 //                 child: Center(
//                 //                   child: Align(
//                 //                     child: SizedBox(
//                 //                       width: 198 * fem,
//                 //                       height: 14 * fem,
//                 //                       child: TextButton(
//                 //                         onPressed: () {},
//                 //                         style: TextButton.styleFrom(
//                 //                           padding: EdgeInsets.zero,
//                 //                         ),
//                 //                         child: RichText(
//                 //                           textAlign: TextAlign.center,
//                 //                           text: TextSpan(
//                 //                             style: GoogleFonts.lato(
//                 //                               fontSize: 11 * ffem,
//                 //                               fontWeight: FontWeight.w800,
//                 //                               height: 1.2125 * ffem / fem,
//                 //                               color: Color(0xff3c3c3c),
//                 //                             ),
//                 //                             children: [
//                 //                               TextSpan(
//                 //                                   text:
//                 //                                       'You already have an Account? '),
//                 //                               TextSpan(
//                 //                                 text: 'Log In',
//                 //                                 style: GoogleFonts.lato(
//                 //                                   fontSize: 11 * ffem,
//                 //                                   fontWeight: FontWeight.w800,
//                 //                                   height: 1.2125 * ffem / fem,
//                 //                                   color: Color(0xfff4c20d),
//                 //                                 ),
//                 //                               ),
//                 //                             ],
//                 //                           ),
//                 //                         ),
//                 //                       ),
//                 //                     ),
//                 //                   ),
//                 //                 ),
//                 //               ),
//                 //               Positioned(
//                 //                 // left: 132 * fem,
//                 //                 // top: 604 * fem,
//                 //                 child: Center(
//                 //                   child: Align(
//                 //                     child: SizedBox(
//                 //                       width: 95 * fem,
//                 //                       height: 14 * fem,
//                 //                       child: RichText(
//                 //                         textAlign: TextAlign.center,
//                 //                         text: TextSpan(
//                 //                           style: GoogleFonts.lato(
//                 //                             fontSize: 11 * ffem,
//                 //                             fontWeight: FontWeight.w800,
//                 //                             height: 1.2125 * ffem / fem,
//                 //                             color: Color(0xffe8e6e6),
//                 //                           ),
//                 //                           children: [
//                 //                             TextSpan(text: 'Or'),
//                 //                             TextSpan(text: ' '),
//                 //                             TextSpan(
//                 //                               text: 'login',
//                 //                               style: GoogleFonts.lato(
//                 //                                 fontSize: 11 * ffem,
//                 //                                 fontWeight: FontWeight.w800,
//                 //                                 height: 1.2125 * ffem / fem,
//                 //                                 color: Color(0xffdb2326),
//                 //                               ),
//                 //                             ),
//                 //                             TextSpan(text: ' '),
//                 //                             TextSpan(
//                 //                               text: 'with',
//                 //                               style: GoogleFonts.lato(
//                 //                                 fontSize: 11 * ffem,
//                 //                                 fontWeight: FontWeight.w800,
//                 //                                 height: 1.2125 * ffem / fem,
//                 //                                 color: Color(0xff3c3c3c),
//                 //                               ),
//                 //                             ),
//                 //                             TextSpan(text: ' '),
//                 //                             TextSpan(
//                 //                               text: 'email',
//                 //                               style: GoogleFonts.lato(
//                 //                                 fontSize: 11 * ffem,
//                 //                                 fontWeight: FontWeight.w800,
//                 //                                 height: 1.2125 * ffem / fem,
//                 //                                 color: Color(0xffdb2326),
//                 //                               ),
//                 //                             ),
//                 //                           ],
//                 //                         ),
//                 //                       ),
//                 //                     ),
//                 //                   ),
//                 //                 ),
//                 //               ),
//                 //               Positioned(
//                 //                 // left: 51 * fem,
//                 //                 // top: 223 * fem,
//                 //                 child: Center(
//                 //                   child: Align(
//                 //                     child: SizedBox(
//                 //                       width: 258 * fem,
//                 //                       height: 14 * fem,
//                 //                       child: RichText(
//                 //                         textAlign: TextAlign.center,
//                 //                         text: TextSpan(
//                 //                           style: GoogleFonts.lato(
//                 //                             fontSize: 11 * ffem,
//                 //                             fontWeight: FontWeight.w800,
//                 //                             height: 1.2125 * ffem / fem,
//                 //                             color: Color(0xffe8e6e6),
//                 //                           ),
//                 //                           children: [
//                 //                             TextSpan(text: 'Please'),
//                 //                             TextSpan(text: ' '),
//                 //                             TextSpan(
//                 //                               text: 'Login',
//                 //                               style: GoogleFonts.lato(
//                 //                                 fontSize: 11 * ffem,
//                 //                                 fontWeight: FontWeight.w800,
//                 //                                 height: 1.2125 * ffem / fem,
//                 //                                 color: Color(0xfff4c20d),
//                 //                               ),
//                 //                             ),
//                 //                             TextSpan(text: ' '),
//                 //                             TextSpan(text: 'or'),
//                 //                             TextSpan(text: ' '),
//                 //                             TextSpan(
//                 //                               text: 'Sign up',
//                 //                               style: GoogleFonts.lato(
//                 //                                 fontSize: 11 * ffem,
//                 //                                 fontWeight: FontWeight.w800,
//                 //                                 height: 1.2125 * ffem / fem,
//                 //                                 color: Color(0xffdb2326),
//                 //                               ),
//                 //                             ),
//                 //                             TextSpan(text: ' '),
//                 //                             TextSpan(
//                 //                               text:
//                 //                                   'to continue using our app.',
//                 //                               style: GoogleFonts.lato(
//                 //                                 fontSize: 11 * ffem,
//                 //                                 fontWeight: FontWeight.w800,
//                 //                                 height: 1.2125 * ffem / fem,
//                 //                                 color: Color(0xff3c3c3c),
//                 //                               ),
//                 //                             ),
//                 //                           ],
//                 //                         ),
//                 //                       ),
//                 //                     ),
//                 //                   ),
//                 //                 ),
//                 //               ),
//                 //               Positioned(
//                 //                 // left: 100 * fem,
//                 //                 // top: 52 * fem,
//                 //                 child: Center(
//                 //                   child: Align(
//                 //                     child: SizedBox(
//                 //                       width: 167 * fem,
//                 //                       height: 50 * fem,
//                 //                       child: Center(
//                 //                         child: RichText(
//                 //                           text: TextSpan(
//                 //                             children: [
//                 //                               TextSpan(
//                 //                                   text: 'Welcome to',
//                 //                                   style: TextStyle(
//                 //                                     fontSize: 22 * ffem,
//                 //                                     fontWeight: FontWeight.w800,
//                 //                                     height: 1.2272727272727273 *
//                 //                                         ffem /
//                 //                                         fem,
//                 //                                     color: Color(0xff000000),
//                 //                                   )),

//                 //                               TextSpan(
//                 //                                   text: '\n',
//                 //                                   style:
//                 //                                       TextStyle(height: 2.0)),
//                 //                               TextSpan(
//                 //                                   text: '  M',
//                 //                                   style: TextStyle(
//                 //                                       fontSize: 13,
//                 //                                       fontFamily: 'Inter',
//                 //                                       fontWeight:
//                 //                                           FontWeight.bold,
//                 //                                       color: Color.fromRGBO(
//                 //                                           219, 35, 38, 1.0))),
//                 //                               TextSpan(
//                 //                                   text: 'OO',
//                 //                                   style: TextStyle(
//                 //                                       fontSize: 13,
//                 //                                       fontFamily: 'Inter',
//                 //                                       fontWeight:
//                 //                                           FontWeight.bold,
//                 //                                       color: Color.fromRGBO(
//                 //                                           244, 194, 13, 1.0))),
//                 //                               TextSpan(
//                 //                                   text: 'DY',
//                 //                                   style: TextStyle(
//                 //                                       fontSize: 13,
//                 //                                       fontFamily: 'Inter',
//                 //                                       fontWeight:
//                 //                                           FontWeight.bold,
//                 //                                       color: Color.fromRGBO(
//                 //                                           219, 35, 38, 1.0))),
//                 //                               TextSpan(
//                 //                                   text: '\n',
//                 //                                   style:
//                 //                                       TextStyle(height: 2.0)),
//                 //                               //TextSpan(text: ' ', style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.bold,color: Colors.black)),
//                 //                               TextSpan(
//                 //                                   text: 'F',
//                 //                                   style: TextStyle(
//                 //                                       fontSize: 18,
//                 //                                       fontFamily: 'Inter',
//                 //                                       fontWeight:
//                 //                                           FontWeight.bold,
//                 //                                       color: Color.fromRGBO(
//                 //                                           244, 194, 13, 1.0))),
//                 //                               TextSpan(
//                 //                                   text: 'OO',
//                 //                                   style: TextStyle(
//                 //                                       fontSize: 18,
//                 //                                       fontFamily: 'Inter',
//                 //                                       fontWeight:
//                 //                                           FontWeight.bold,
//                 //                                       color: Color.fromRGBO(
//                 //                                           219, 35, 38, 1.0))),
//                 //                               TextSpan(
//                 //                                   text: 'DY',
//                 //                                   style: TextStyle(
//                 //                                       fontSize: 18,
//                 //                                       fontFamily: 'Inter',
//                 //                                       fontWeight:
//                 //                                           FontWeight.bold,
//                 //                                       color: Color.fromRGBO(
//                 //                                           244, 194, 13, 1.0))),
//                 //                             ],
//                 //                           ),
//                 //                           textAlign: TextAlign.start,
//                 //                         ),
//                 //                       ),
//                 //                     ),
//                 //                   ),
//                 //                 ),
//                 //               ),
//                 //             ],
//                 //           ),
//                 //         ),
//                 //       ),
//                 //       //------------------------------Yellow Arrow Botton--------------
//                 //       // Positioned(
//                 //       //   left: 312 * fem,
//                 //       //   top: 319 * fem,
//                 //       //   child: Center(
//                 //       //     child: SizedBox(
//                 //       //       width: 50 * fem,
//                 //       //       height: 50 * fem,
//                 //       //       child: FloatingActionButton(
//                 //       //         onPressed: () {},
//                 //       //         backgroundColor: Color(0xfff4c20d),
//                 //       //         child: Icon(
//                 //       //           Icons.arrow_forward,
//                 //       //           color: Color.fromARGB(255, 0, 0, 0),
//                 //       //           size: 32 * fem,
//                 //       //         ),
//                 //       //       ),
//                 //       //     ),
//                 //       //   ),
//                 //       // ),
//                 //     ],
//                 //   ),
//                 ),

//                 // Positioned(
//                 //   left: 312,
//                 //   top: 319,
//                 //   child: Center(
//                 //     child: SizedBox(
//                 //       width: 50,
//                 //       height: 50,
//                 //       child: FloatingActionButton(
//                 //         onPressed: () {},
//                 //         backgroundColor: Color(0xfff4c20d),
//                 //         child: Icon(
//                 //           Icons.arrow_forward,
//                 //           color: Color(0xff000000),
//                 //           size: 32,
//                 //         ),
//                 //       ),
//                 //     ),
//                 //   ),
//                 // ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
