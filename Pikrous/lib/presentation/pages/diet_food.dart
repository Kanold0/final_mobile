import 'package:flutter/material.dart';

class DietFoodPage extends StatefulWidget {
  @override
  _DietFoodPageState createState() => _DietFoodPageState();
}

class _DietFoodPageState extends State<DietFoodPage> {
  late List<String> foods;
  late List<String> filteredFoods;
  late List<bool> isFavorite;

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    foods = [
      'Quinoa Salad',
      'Avocado Toast',
      'Chickpea Curry',
      'Veggie Burger'
    ];
    filteredFoods = List.from(foods);
    isFavorite = List.filled(foods.length, false);
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    String searchTerm = _searchController.text.toLowerCase();
    setState(() {
      filteredFoods =
          foods.where((food) => food.toLowerCase().contains(searchTerm)).toList();
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
        title: Text('Diet Food'),
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
                crossAxisCount: MediaQuery.of(context).size.width ~/ 150,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: filteredFoods.length,
              itemBuilder: (context, index) {
                return _buildFoodItem(filteredFoods[index], index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodItem(String foodName, int index) {
    return Stack(
      children: [
        Container(
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
                'assets/images/old_food.jpg',
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FoodDetailPage(foodName: foodName),
                    ),
                  );
                },
                child: Text('Details'),
              ),
            ],
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: IconButton(
            onPressed: () {
              setState(() {
                isFavorite[index] = !isFavorite[index];
              });
            },
            icon: Icon(
              isFavorite[index] ? Icons.favorite : Icons.favorite_border,
              color: isFavorite[index] ? Colors.red : null,
            ),
          ),
        ),
      ],
    );
  }
}

class FoodDetailPage extends StatelessWidget {
  final String foodName;

  const FoodDetailPage({Key? key, required this.foodName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Ingredients and instructions for each food
    Map<String, List<String>> foodDetails = {
      'Quinoa Salad': [
        '1 cup quinoa',
        '2 cups water',
        '1 cup cherry tomatoes, halved',
        '1 cucumber, diced',
        '1/4 cup red onion, diced',
        '1/4 cup fresh parsley, chopped',
        '2 tablespoons olive oil',
        '2 tablespoons lemon juice',
        'Salt and pepper to taste'
      ],
      'Avocado Toast': [
        '2 slices whole grain bread',
        '1 ripe avocado',
        '1/2 lemon, juiced',
        'Salt and pepper to taste',
        'Optional toppings: cherry tomatoes, red pepper flakes, microgreens'
      ],
      'Chickpea Curry': [
        '1 can chickpeas, drained and rinsed',
        '1 can coconut milk',
        '1 cup diced tomatoes',
        '1 onion, chopped',
        '2 cloves garlic, minced',
        '1 inch ginger, grated',
        '1 tsp cumin',
        '1 tsp turmeric',
        '1 tsp coriander',
        '1 tsp garam masala',
        'Salt and pepper to taste'
      ],
      'Veggie Burger': [
        '1 can black beans, drained and rinsed',
        '1 cup rolled oats',
        '1/2 onion, finely chopped',
        '2 cloves garlic, minced',
        '2 tbsp ground flaxseed meal',
        '1 tsp chili powder',
        '1 tsp cumin',
        '1/2 tsp paprika',
        'Salt and pepper to taste'
      ],
    };

    Map<String, List<String>> cookingInstructions = {
      'Quinoa Salad': [
        'Rinse quinoa under cold water using a fine mesh strainer.',
        'In a medium saucepan, combine quinoa and water. Bring to a boil, then reduce heat to low, cover, and simmer for 15-20 minutes or until quinoa is tender and water is absorbed.',
        'Fluff cooked quinoa with a fork and transfer to a large mixing bowl. Let it cool.',
        'Once quinoa is cooled, add cherry tomatoes, cucumber, red onion, and fresh parsley to the bowl.',
        'In a small bowl, whisk together olive oil, lemon juice, salt, and pepper. Pour dressing over the salad and toss to combine.',
        'Serve chilled or at room temperature. Enjoy your quinoa salad!'
      ],
      'Avocado Toast': [
        'Toast the bread slices until golden brown and crispy.',
        'While the bread is toasting, scoop the avocado flesh into a small bowl and mash it with a fork until smooth.',
        'Add lemon juice, salt, and pepper to the mashed avocado and mix well.',
        'Spread the mashed avocado evenly onto the toasted bread slices.',
        'Top with optional toppings such as cherry tomatoes, red pepper flakes, or microgreens if desired.',
        'Serve immediately and enjoy!'
      ],
      'Chickpea Curry': [
        'Heat oil in a large skillet over medium heat. Add chopped onions and cook until softened.',
        'Add minced garlic and grated ginger to the skillet and cook for another minute.',
        'Stir in cumin, turmeric, coriander, and garam masala. Cook for about 30 seconds until fragrant.',
        'Add diced tomatoes and cook until they start to break down.',
        'Pour in coconut milk and drained chickpeas. Bring to a simmer and let it cook for about 10-15 minutes, stirring occasionally.',
        'Season with salt and pepper to taste.',
        'Garnish with chopped fresh cilantro if desired.',
        'Serve hot over rice or with naan bread. Enjoy your delicious chickpea curry!'
      ],
      'Veggie Burger': [
        'In a food processor, pulse black beans until mashed but still chunky.',
        'Transfer mashed beans to a large mixing bowl. Add rolled oats, chopped onion, minced garlic, ground flaxseed meal, chili powder, cumin, paprika, salt, and pepper.',
        'Mix until well combined. If the mixture is too dry, add a splash of water.',
        'Divide the mixture into equal portions and shape into burger patties.',
        'Heat a skillet over medium heat and lightly oil the surface. Cook the veggie burgers for 4-5 minutes on each side, or until golden brown and heated through.',
        'Serve the veggie burgers on buns with your favorite toppings and enjoy!'
      ],
    };

    List<String>? ingredients = foodDetails[foodName];
    List<String>? instructions = cookingInstructions[foodName];

    return Scaffold(
      appBar: AppBar(
        title: Text(foodName),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              child: Image.asset(
                'assets/images/old_food.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ingredients:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: ingredients?.map((ingredient) {
                      return Text('• $ingredient');
                    }).toList() ?? [],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Instructions:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: instructions?.asMap().entries.map((entry) {
                      int index = entry.key + 1;
                      String instruction = entry.value;
                      return Text('$index. $instruction');
                    }).toList() ?? [],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

