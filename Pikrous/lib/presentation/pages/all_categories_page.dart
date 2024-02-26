import 'package:flutter/material.dart';
import 'package:pikrous/presentation/pages/diet_food.dart';
import 'package:pikrous/presentation/pages/elderly_food.dart';
import 'package:pikrous/presentation/items/search_bar.dart';
import 'package:pikrous/presentation/pages/vegan_page.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Food Category'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: Row(
            children: [
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width / 2,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.blue, // Change color to your preferred color
                      width: 2.0,
                    ),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Foods',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: Colors.blue, // Change color to your preferred color
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SearchBarInput(label: 'Search food'),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildCategoryItem(
                    context,
                    'Diet Food',
                    'lib/assets/images/diet_food.png',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DietFoodPage(),
                        ),
                      );
                    },
                  ),
                  _buildCategoryItem(
                    context,
                    'Elderly Food',
                    'lib/assets/images/elderly_icon.png',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ElderlyFoodPage(),
                        ),
                      );
                    },
                  ),
                  _buildCategoryItem(
                    context,
                    'Vegan Food',
                    'lib/assets/images/vegan_icon.png',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VeganFoodPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(
    BuildContext context,
    String categoryName,
    String imagePath,
    VoidCallback onTap,
  ) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70,
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0XFFFEEEEEE),
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: 50,
              height: 50,
              child: Image.asset(imagePath),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30),
              child: Text(
                categoryName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
