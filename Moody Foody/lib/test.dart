//import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:food/home.dart';
import 'package:food/index.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
//import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:convert';
import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
// import 'package:flutter/foundation.dart'
//     show defaultTargetPlatform, kIsWeb, TargetPlatform;

void main() {
  runApp(MyHomePage1());
}

class MyHomePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  int _currentIndex = 0;
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Icon(
                  Icons.search_rounded,
                  color: Color.fromARGB(0, 0, 0, 0),
                ),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          // IconButton(
          //   icon: Icon(Icons.menu),
          //   onPressed: () {
          //     // Handle menu action
          //   },
          // ),
        ],
        backgroundColor: Color.fromARGB(255, 174, 52, 52).withOpacity(0.5),
      ),
      drawer: Drawer(
        child: Stack(
          children: [
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  _currentIndex = 3; // Navigate to the first tab
                  Navigator.pop(context); // Close the drawer
                },
              ),
            ),
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.all(8.0), // Adjust the padding as needed
                  child: CircleAvatar(
                    backgroundColor: Colors.white
                        .withOpacity(0.5), // Adjust the opacity as needed
                    child: Icon(
                      Icons.person,
                      size: 40, // Adjust the size of the icon as needed
                      color: Colors.black, // Set the color of the icon
                    ),
                    radius: 50, // Adjust the radius as needed
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'M Abdullah', // Replace with the actual name
                  style: TextStyle(
                    color: const Color.fromARGB(255, 71, 71, 71),
                    fontSize: 24,
                  ),
                ),
                //currentIndex
                Padding(
                  padding:
                      EdgeInsets.all(8.0), // Add padding to the entire ListTile
                  child: ListTile(
                    title: Text('Profile'),
                    tileColor: Color.fromARGB(
                        255, 71, 71, 71), // Set the background color

                    onTap: () {
                      int index = 3; 
                      _currentIndex = index;
                      _pageController.animateToPage(
                        index,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                      Navigator.pop(context); // Close the drawer
                    },
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text('About Us'),
                    tileColor: Color.fromARGB(
                        255, 71, 71, 71), 
                    onTap: () {
                      int index =4; 
                      _currentIndex =index; 
                      _pageController.animateToPage(
                        index,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                      Navigator.pop(context); // Close the drawer
                    },
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.all(8.0), // Add padding to the entire ListTile
                  child: ListTile(
                    title: Text('Contact Us'),
                    tileColor: Color.fromARGB(
                        255, 71, 71, 71), // Set the background color
                    onTap: () {
                      int index =
                          5; // Assuming you want to navigate to the tab with index 3
                      _currentIndex =
                          index; // Assuming _currentIndex is a variable in your class
                      _pageController.animateToPage(
                        index,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                      Navigator.pop(context); // Close the drawer
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Color.fromARGB(100, 255, 255, 255),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        children: [
          Home(),
          FavoritesTab(),
          CartTab(),
          ProfileTab(),
          AboutTab(),
          ContactTab(),
          // Add more pages as needed
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false, // Hide selected labels
        showUnselectedLabels: true, // Hide unselected labels
        //currentIndex: _selectedTabIndex,
        currentIndex: _currentPage,
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }, //_onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.red, // Set icon color to red
            ),
            label: 'Home',
            backgroundColor: Colors.yellow, // Set background color to yellow
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: Colors.red, // Set icon color to red
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.red, // Set icon color to red
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.red, // Set icon color to red
            ),
            label: 'Profile',
            backgroundColor: Colors.yellow, // Set background color to yellow
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.visibility_off), // Icon for the hidden item
          //   label: 'Hidden',
          //   backgroundColor: Colors.transparent,
          // ),
        ],
      ),
    );
  }
}

//============================TABS==================
class CommonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Common Page'),
      ),
      body: Center(
        child: Text('Common Page Content'),
      ),
    );
  }
}

class HomeTab extends State {
  double screenWidth = 0;
  double screenHeight = 0;
  double MoodySize = 0;
  double FoodySize = 0;
  double WelcomeSize = 0;
  
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    MoodySize = screenWidth * 0.08;
    FoodySize = screenWidth * 0.05;
    WelcomeSize = screenWidth * 0.025;
    return Center(
      child: Column(children: <Widget>[
        //logo FOODY MOODY
        Center(
          child: RichText(
            text: TextSpan(
              children: [
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
        //deals
        Center(
          child: Container(
            child: PostContainer(),
          ),
        ),
        //Products
        Center(),
      ]),
    );
  }
}

class FavoritesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Favorites Tab Content'),
    );
  }
}

class CartTab extends StatelessWidget{
  @override
   Widget build(BuildContext context) {
     return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //_image != null ? Image.file(_image!) : Text('No Image Selected'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: (){},
              child: Text('Pick Image'),
            ),
          ],
        ),
     );
   }
}
// class CartTab extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             //_image != null ? Image.file(_image!) : Text('No Image Selected'),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: (){},
//               child: Text('Pick Image'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () async{ImagePicker imagePicker = ImagePicker();
//                     XFile? file = 
//                         await imagePicker.pickImage(source: ImageSource.camera);print(file?.path); 
//                         if (file == null) return;
//                     //Import dart:core
//                     String uniqueFileName =
//                         DateTime.now().millisecondsSinceEpoch.toString();

//                     /*Step 2: Upload to Firebase storage*/
//                     //Install firebase_storage
//                     //Import the library

//                     //Get a reference to storage root
//                     Reference referenceRoot = FirebaseStorage.instance.ref();
//                     Reference referenceDirImages =
//                         referenceRoot.child('images');

//                     //Create a reference for the image to be stored
//                     Reference referenceImageToUpload =
//                         referenceDirImages.child('uniqueFileName');

//                     //Handle errors/success
//                     try {
//                       //Store the file
//                       await referenceImageToUpload.putFile(File(file!.path));
//                       //Success: get the download URL
//                       var imageUrl = await referenceImageToUpload.getDownloadURL();
//                     } catch (error) {
//                       //Some error occurred
//                     }
//                   },
//               child: Text('Upload Image to Firebase'),
//             ),
            
//           ],
//         ),
//       );
//   }
// }

class ProfileTab extends StatelessWidget {
  double screenWidth = 0;
  double screenHeight = 0;
  double MoodySize = 0;
  double FoodySize = 0;
  double WelcomeSize = 0;
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    MoodySize = screenWidth * 0.08;
    FoodySize = screenWidth * 0.05;
    WelcomeSize = screenWidth * 0.025;
    return Center(
      child: Column(
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Logo
                  //Welcome to Moody Foody
                  Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
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

                  // User Icon
                  Center(
                    child: CircleAvatar(
                      radius: 60.0,
                      child: Icon(
                        Icons.person,
                        size: 40, // Adjust the size of the icon as needed
                        color: Colors.black, // Set the color of the icon
                      ),
                    ),
                  ),

                  Container(
                    width: screenWidth * 1 - 150,
                    height: 20,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 2.0, right: 2.0, top: 2.0, bottom: 0.0),
                      child: Row(
                        children: [
                          Text(
                            'Name',
                            style: TextStyle(
                              fontSize: WelcomeSize,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(64, 64, 63, 1),
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 20.0),

                  // Name Editable Box
                  EditableProfileField(
                    label: 'Name',
                    Value: 'John Doe', // Replace with actual API value
                  ),

                  Container(
                    width: screenWidth * 1 - 150,
                    height: 20,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 2.0, right: 2.0, top: 2.0, bottom: 0.0),
                      child: Row(
                        children: [
                          Text(
                            'Address',
                            style: TextStyle(
                              fontSize: WelcomeSize,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(64, 64, 63, 1),
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),

                  // Address Editable Box
                  EditableProfileField(
                    label: 'Address',
                    Value:
                        '123 Main Street, City', // Replace with actual API value
                  ),

                  Container(
                    width: screenWidth * 1 - 150,
                    height: 20,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 2.0, right: 2.0, top: 2.0, bottom: 0.0),
                      child: Row(
                        children: [
                          Text(
                            'Phone',
                            style: TextStyle(
                              fontSize: WelcomeSize,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(64, 64, 63, 1),
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),

                  // Phone Editable Box
                  EditableProfileField(
                    label: 'Phone',
                    Value: '(123) 456-7890', // Replace with actual API value
                  ),
                  SizedBox(height: 20.0),

                  // Save Button
                  ElevatedButton(
                    onPressed: () {
                      // Implement save functionality
                    },
                    child: Text('Save'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AboutTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('About Tab Content'),
    );
  }
}

class ContactTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Contact Tab Content'),
    );
  }
}

class EditableProfileField extends StatelessWidget {
  final String label;
  final String Value;
  String initialValue = '';

  EditableProfileField({
    required this.label,
    required this.Value,
  });

  double screenWidth = 0;
  double screenHeight = 0;
  double MoodySize = 0;
  double FoodySize = 0;
  double WelcomeSize = 0;
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    MoodySize = screenWidth * 0.08;
    FoodySize = screenWidth * 0.05;
    WelcomeSize = screenWidth * 0.025;
    return Container(
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
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: TextEditingController(text: Value),
                decoration: InputDecoration(
                  hintText: 'Enter your $label',
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 93, 93, 93),
                    fontSize: 16.0,
                    fontFamily: 'Inter',
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
