import 'package:flutter/material.dart';
import 'package:pikrous/presentation/items/bottom_nav_bar.dart';

import '../../helper/utils/colors.dart';

class FoodTrackingPage extends StatefulWidget {
  @override
  _FoodTrackingPageState createState() => _FoodTrackingPageState();
}

class _FoodTrackingPageState extends State<FoodTrackingPage> {
  List<FoodItem> _foodList = [
    FoodItem(name: 'Salad', calories: 200, category: 'Lunch'),
    FoodItem(name: 'Soup', calories: 150, category: 'Lunch'),
    FoodItem(name: 'Pasta', calories: 300, category: 'Dinner'),
    FoodItem(name: 'Sandwich', calories: 250, category: 'Lunch'),
    FoodItem(name: 'Fruit', calories: 100, category: 'Breakfast'),
    FoodItem(name: 'Yogurt', calories: 120, category: 'Breakfast'),
    FoodItem(name: 'Chicken', calories: 350, category: 'Dinner'),
    FoodItem(name: 'Fish', calories: 280, category: 'Dinner'),
    FoodItem(name: 'Vegetables', calories: 90, category: 'Lunch'),
    FoodItem(name: 'Rice', calories: 220, category: 'Dinner'),
  ];

  List<FoodItem> _filteredFoodList = [];
  TextEditingController _searchController = TextEditingController();
  String _sortBy = 'Name';

  @override
  void initState() {
    super.initState();
    _filteredFoodList.addAll(_foodList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Tracking'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search food...',
                    ),
                    onChanged: (value) {
                      _filterFood(value);
                    },
                  ),
                ),
                SizedBox(width: 10),
                DropdownButton<String>(
                  value: _sortBy,
                  onChanged: (String? newValue) {
                    setState(() {
                      _sortBy = newValue!;
                      _sortFoodList();
                    });
                  },
                  items: <String>['Name', 'Calories', 'Category']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredFoodList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_filteredFoodList[index].name),
                  subtitle: Text(
                      'Calories: ${_filteredFoodList[index].calories}, Category: ${_filteredFoodList[index].category}'),
                  trailing: IconButton(
                    icon: Icon(Icons.info),
                    onPressed: () {
                      _showFoodDetail(_filteredFoodList[index]);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(index: 2),
    );
  }

  void _filterFood(String query) {
    setState(() {
      _filteredFoodList.clear();
      _filteredFoodList.addAll(_foodList.where((food) =>
          food.name.toLowerCase().contains(query.toLowerCase())));
    });
  }

  void _sortFoodList() {
    setState(() {
      if (_sortBy == 'Name') {
        _filteredFoodList.sort((a, b) => a.name.compareTo(b.name));
      } else if (_sortBy == 'Calories') {
        _filteredFoodList.sort((a, b) => a.calories.compareTo(b.calories));
      } else if (_sortBy == 'Category') {
        _filteredFoodList.sort((a, b) => a.category.compareTo(b.category));
      }
    });
  }

  void _showFoodDetail(FoodItem food) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(food.name),
          content: Text('Calories: ${food.calories}, Category: ${food.category}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

class FoodItem {
  final String name;
  final int calories;
  final String category;

  FoodItem({required this.name, required this.calories, required this.category});
}
