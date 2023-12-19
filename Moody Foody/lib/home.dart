import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(Home());
}

class Food {
  final int id;
  final String name;

  Food({required this.id, required this.name});

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(id: json['id'], name: json['Name']);
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home2(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home2 extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home2> {
  String username = '';
  int userId = 0;
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  Future<void> getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username') ?? '';
      userId = prefs.getInt('userId') ?? 0;
    });
  }

  void _navigateToFoodTab() {
  int foodTabIndex = 6; // Replace with the index of the FoodTab in your PageView
  _pageController.animateToPage(
    foodTabIndex,
    duration: Duration(milliseconds: 500),
    curve: Curves.easeInOut,
  );
  Navigator.pop(context); // Close the drawer or any other open dialogs
}

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
                  'Welcome, $username!', // Replace with the actual name
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
                      int index = 3; // Set the appropriate index
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
                      int index = 4; // Set the appropriate index
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
                      int index = 5; // Set the appropriate index
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
          FoodTab(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.white, // Selected item color
        unselectedItemColor: Colors.grey,
        backgroundColor: Color.fromARGB(255, 174, 52, 52), // Background color
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  void _navigateToTab(int index) {
    setState(() {
      _currentIndex = index;
    });

    Navigator.pop(context); // Close the drawer

    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}

//============================TABS==================
class HomeTab extends StatelessWidget {
  double screenWidth = 0;
  double screenHeight = 0;
  double moodySize = 0;
  double foodySize = 0;
  double welcomeSize = 0;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    moodySize = screenWidth * 0.08;
    foodySize = screenWidth * 0.05;
    welcomeSize = screenWidth * 0.025;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FoodGallery(),
            ],
          ),
        ),
      ),
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

class FoodTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Food Content'),
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

class FoodGallery extends StatelessWidget {
  final PageController _pageController = PageController();
  final List<String> postImages = [
    'Products/BBQChikenPizza.jpg',
    'Products/CheeseBurger.jpg',
    'Products/ChickenPizza.jpg',
    'Products/ChikenLegPiece.jpg',
    'Products/FajitaPizza.jpg',
    'Products/FriedFish.jpg',
    'Products/Pasta.jpg',
    'Products/PetttyBurger.jpg',
    'Products/ZingerBurger.jpg',
    'Products/Fries.jpg',
    // Add more image paths as needed
  ];

  final List<String> postNames = [
    'BBQ Chicken Pizza',
    'Cheese Burger',
    'Chicken Pizza',
    'Chicken Leg Piece',
    'Fajita Pizza',
    'Fried Fish',
    'Pasta',
    'Patty Burger',
    'Chicken Ginger Burger',
    'Fries',
  ];

  final List<String> postPrices = [
    "800", // BBQ Chicken Pizza
    "350", // Cheese Burger
    "600", // Chicken Pizza
    "180", // Chicken Leg Piece
    "850", // Fajita Pizza
    "400", // Fried Fish
    "300", // Pasta
    "400", // Patty Burger
    "500", // Zinger Burger
    "100", // Fries
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context)
          .size
          .height, // Set a fixed height or adjust as needed
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: postImages.length,
        itemBuilder: (context, index) {
          return _buildFoodItemCard(
            postImages[index],
            postNames[index],
            double.parse(postPrices[index]),
            index,
          );
        },
      ),
    );
  }

  Widget _buildFoodItemCard(
      String imagePath, String foodName, double recommendedPrice, int index) {
    return GestureDetector(
      onTap: () {
        // Handle click event here, you can print or perform any action
        print('Clicked on $foodName, Price: $recommendedPrice');
        _navigateToFoodTab(index); // Navigate to FoodTab
      },
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                ),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    foodName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    'RS ${recommendedPrice.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _navigateToFoodTab(int index) {
    _pageController.animateToPage(
      6, // Index of FoodTab
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
