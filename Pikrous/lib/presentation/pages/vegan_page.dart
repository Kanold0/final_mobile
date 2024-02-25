import 'package:flutter/material.dart';

class VeganFoodPage extends StatefulWidget {
  @override
  _VeganFoodPageState createState() => _VeganFoodPageState();
}

class _VeganFoodPageState extends State<VeganFoodPage> {
  late List<String> foods;
  late List<String> filteredFoods;

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    foods = ['Quinoa Salad', 'Avocado Toast', 'Chickpea Curry', 'Veggie Burger'];
    filteredFoods = List.from(foods);
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    String searchTerm = _searchController.text.toLowerCase();
    setState(() {
      filteredFoods = foods.where((food) => food.toLowerCase().contains(searchTerm)).toList();
    });
  }

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
        title: Text('Vegan Food'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search Food',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width ~/ 150, // Adjusted based on screen width
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: filteredFoods.length,
              itemBuilder: (context, index) {
                return _buildFoodItem(filteredFoods[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodItem(String foodName) {
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
            'assets/vegan_food_placeholder.png',
            width: 80,
            height: 80,
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
            onPressed: () {
              // Handle detail button pressed
            },
            child: Text('Details'),
          ),
        ],
      ),
    );
  }
}
