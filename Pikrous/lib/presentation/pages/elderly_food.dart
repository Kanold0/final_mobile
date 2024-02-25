import 'package:flutter/material.dart';

class ElderlyFoodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Elderly Food'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Food',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: _buildFoodContainer(
                    imagePath: 'assets/food_image5.png',
                    foodName: 'Porridge',
                    onPressed: () {
                      // Handle detail button pressed for Porridge
                    },
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: _buildFoodContainer(
                    imagePath: 'assets/food_image6.png',
                    foodName: 'Mashed Potatoes',
                    onPressed: () {
                      // Handle detail button pressed for Mashed Potatoes
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: _buildFoodContainer(
                    imagePath: 'assets/food_image7.png',
                    foodName: 'Steamed Vegetables',
                    onPressed: () {
                      // Handle detail button pressed for Steamed Vegetables
                    },
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: _buildFoodContainer(
                    imagePath: 'assets/food_image8.png',
                    foodName: 'Fish Soup',
                    onPressed: () {
                      // Handle detail button pressed for Fish Soup
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFoodContainer({required String imagePath, required String foodName, required VoidCallback onPressed}) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Text(
            foodName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: onPressed,
            child: Text('Details'),
          ),
        ],
      ),
    );
  }
}
