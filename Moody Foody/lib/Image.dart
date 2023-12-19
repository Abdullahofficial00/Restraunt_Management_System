import 'package:flutter/material.dart';

class FoodGallery extends StatelessWidget {
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
    return _buildCenteredGridView();
  }

  Widget _buildCenteredGridView() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: postImages.length,
          itemBuilder: (context, index) {
            return _buildFoodItemCard(postImages[index], postNames[index], double.parse(postPrices[index]));
          },
        ),
      ),
    );
  }

  Widget _buildFoodItemCard(String imagePath, String foodName, double recommendedPrice) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120.0, // Adjust the height of the image container
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
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Food Gallery'),
        ),
        body: FoodGallery(),
      ),
    ),
  );
}
