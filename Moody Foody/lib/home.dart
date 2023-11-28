import 'package:flutter/material.dart';
import 'dart:async';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyHomePage());
}

Future<XFile?> pickImage() async {
  try {
    // Open the image picker
    final XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource
          .gallery, // You can also use ImageSource.camera for camera access
    );

    return pickedFile;
  } catch (e) {
    // Handle any exceptions that might occur during image picking
    print("Error picking image: $e");
    return null;
  }
}

class Food {
  final int id;
  final String name;

  Food({required this.id, required this.name});

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(id: json['id'], name: json['Name']);
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage2(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage2 extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage2> {
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
                  padding: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text('About Us'),
                    tileColor: Color.fromARGB(255, 71, 71, 71),
                    onTap: () {
                      int index = 4;
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
          HomeTab(),
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

class HomeTab extends StatelessWidget {
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
        //Button for Upload
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () async {
                  XFile? pickedFile = await pickImage();

                  if (pickedFile != null) {
                    // Do something with the picked image file
                    print("Picked Image Path: ${pickedFile.path}");
                  } else {
                    // User canceled the image picking
                    print("User canceled image picking");
                  }
                },
                child: Text("Pick Image"),
              ),
            ],
          ),
        ),
        //Products
        Center(

        ),
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

class CartTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Favorites Tab Content'),
    );
  }
}

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

class PostContainer extends StatefulWidget {
  @override
  _PostContainerState createState() => _PostContainerState();
}

class _PostContainerState extends State<PostContainer> {
  final List<String> postImages = [
    'images/deal1.jpg',
    'images/deal2.jpg',
    'images/deal3.jpg',
    // Add more image paths as needed
  ];

  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
    startSlider();
  }

  void startSlider() {
    Timer.periodic(Duration(seconds: 2), (timer) {
      if (_currentPage < postImages.length * 100 - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            height: 250.0, // Adjust the height as needed
            child: PageView.builder(
              itemCount: postImages.length *
                  100, // A large number for continuous scrolling
              controller: _pageController,
              itemBuilder: (context, index) {
                final postIndex = index % postImages.length;
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      image: DecorationImage(
                        image: AssetImage(postImages[postIndex]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          )),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
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
