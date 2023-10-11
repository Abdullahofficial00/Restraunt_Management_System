import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'dart:async';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                // Handle edit action
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
              Padding(
                padding:
                    EdgeInsets.all(8.0), // Add padding to the entire ListTile
                child: ListTile(
                  title: Text('Profile'),
                  tileColor: Color.fromARGB(
                      255, 71, 71, 71), // Set the background color
                  onTap: () {
                    // Handle item 1 tap
                    Navigator.pop(context); // Close the drawer
                  },
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.all(8.0), // Add padding to the entire ListTile
                child: ListTile(
                  title: Text('About Us'),
                  tileColor: Color.fromARGB(
                      255, 71, 71, 71), // Set the background color
                  onTap: () {
                    // Handle item 2 tap
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
                    // Handle item 3 tap
                    Navigator.pop(context); // Close the drawer
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(100, 255, 255, 255),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      drawer: MyDrawer(),
      body: SingleChildScrollView(
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
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false, // Hide selected labels
        showUnselectedLabels: false, // Hide unselected labels
        items: const [
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
        ],
      ),
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

void main() {
  runApp(const Home());
}
