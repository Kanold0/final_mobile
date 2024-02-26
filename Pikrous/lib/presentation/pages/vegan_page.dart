import 'package:flutter/material.dart';

class VeganFoodPage extends StatefulWidget {
  @override
  _VeganFoodPageState createState() => _VeganFoodPageState();
}

class _VeganFoodPageState extends State<VeganFoodPage> {
  late List<String> foods;
  late List<String> filteredFoods;
  List<bool> isFavorite = [];

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    foods = [
      'Vegan Pasta',
      'Vegan Pizza',
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
      'Vegan Pasta': [
        '200g pasta',
        '2 cups cherry tomatoes, halved',
        '2 cups baby spinach leaves',
        '2 cloves garlic, minced',
        '2 tbsp olive oil',
        'Salt and pepper to taste'
      ],
      'Vegan Pizza': [
        '1 pizza dough',
        '1/2 cup tomato sauce',
        '1 cup vegan cheese',
        '1/2 cup bell peppers, sliced',
        '1/4 cup black olives, sliced',
        '1/4 cup mushrooms, sliced',
        '1/4 cup onions, sliced'
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
      'Vegan Pasta': [
        'Cook the pasta according to package instructions.',
        'Heat olive oil in a large skillet over medium heat. Add minced garlic and cook until fragrant.',
        'Add cherry tomatoes to the skillet and cook until they start to soften, about 2-3 minutes.',
        'Stir in baby spinach leaves and cook until wilted.',
        'Add cooked pasta to the skillet and toss to combine. Season with salt and pepper to taste.',
        'Serve hot and enjoy!'
      ],
      'Vegan Pizza': [
        'Preheat the oven to 425°F (220°C).',
        'Roll out the pizza dough on a lightly floured surface to your desired thickness.',
        'Transfer the dough to a pizza stone or baking sheet lined with parchment paper.',
        'Spread tomato sauce over the dough, leaving a small border around the edges.',
        'Top with vegan cheese, bell peppers, olives, mushrooms, and onions.',
        'Bake in the preheated oven for 12-15 minutes, or until the crust is golden brown and the cheese is melted and bubbly.',
        'Remove from the oven and let cool slightly before slicing. Enjoy your vegan pizza!'
      ],
      'Chickpea Curry': [
        'Heat oil in a large skillet over medium heat. Add chopped onions and cook until softened.',
        'Add minced garlic and grated ginger to the skillet and cook for another minute.',
        'Stir in diced tomatoes and coconut milk, and bring to a simmer.',
        'Add drained chickpeas and spices (cumin, turmeric, coriander, garam masala) to the skillet. Season with salt and pepper to taste.',
        'Simmer the curry for 15-20 minutes, or until the sauce thickens and the flavors meld together.',
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
                'assets/vegan_food_placeholder.png',
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
