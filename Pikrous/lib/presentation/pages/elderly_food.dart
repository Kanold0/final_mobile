import 'package:flutter/material.dart';

class ElderlyFoodPage extends StatefulWidget {
  @override
  _ElderlyFoodPageState createState() => _ElderlyFoodPageState();
}

class _ElderlyFoodPageState extends State<ElderlyFoodPage> {
  late List<String> foods;
  late List<String> filteredFoods;
  late List<bool> isFavorite;

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    foods = [
      'Porridge',
      'Mashed Potatoes',
      'Steamed Vegetables',
      'Fish Soup'
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
        title: Text('Elderly Food'),
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
                'assets/elderly_food_placeholder.png',
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
    Map<String, Map<String, List<String>>> foodDetails = {
      'Porridge': {
        'Ingredients': [
          '1/2 cup rolled oats',
          '1 cup water or milk (dairy or plant-based)',
          'Pinch of salt (optional)',
          'Optional toppings: fruit, nuts, honey or maple syrup'
        ],
        'Instructions': [
          'In a small saucepan, bring the water or milk to a boil.',
          'Stir in the rolled oats and reduce heat to low.',
          'Cook, stirring occasionally, for about 5 minutes or until desired consistency is reached.',
          'Remove from heat and let it sit for a minute before serving.',
          'Top with your favorite toppings if desired.'
        ]
      },
      'Mashed Potatoes': {
        'Ingredients': [
          '2 large potatoes, peeled and cubed',
          '2 tbsp vegan butter or olive oil',
          '1/4 cup plant-based milk',
          'Salt and pepper to taste'
        ],
        'Instructions': [
          'Place the potatoes in a large pot and cover with water.',
          'Bring to a boil over high heat, then reduce the heat to medium-low and simmer for about 15 minutes or until potatoes are fork-tender.',
          'Drain the potatoes and return them to the pot.',
          'Add vegan butter or olive oil, plant-based milk, salt, and pepper to the pot.',
          'Mash the potatoes until smooth and creamy.',
          'Adjust seasoning to taste and serve.'
        ]
      },
      'Steamed Vegetables': {
        'Ingredients': [
          'Assorted vegetables (e.g., carrots, broccoli, cauliflower)',
          'Water for steaming',
          'Salt and pepper to taste'
        ],
        'Instructions': [
          'Wash and prepare the vegetables by cutting them into bite-sized pieces.',
          'Fill a large pot with a few inches of water and place a steamer basket inside.',
          'Bring the water to a boil over high heat.',
          'Add the vegetables to the steamer basket, cover, and steam for about 5-7 minutes or until tender-crisp.',
          'Remove the vegetables from the steamer basket and season with salt and pepper to taste.',
          'Serve hot as a side dish or with your favorite sauce.'
        ]
      },
      'Fish Soup': {
        'Ingredients': [
          '1 lb white fish fillets (e.g., cod, haddock)',
          '4 cups vegetable broth',
          '1 onion, chopped',
          '2 carrots, sliced',
          '2 celery stalks, sliced',
          '1 cup diced tomatoes',
          '2 cloves garlic, minced',
          '1 tsp dried thyme',
          'Salt and pepper to taste'
        ],
        'Instructions': [
          'In a large pot, heat some olive oil over medium heat.',
          'Add the chopped onion, carrots, and celery to the pot and cook until softened, about 5 minutes.',
          'Add the minced garlic and cook for another minute until fragrant.',
          'Stir in the vegetable broth, diced tomatoes, and dried thyme.',
          'Bring the soup to a simmer, then reduce the heat to low and let it cook for about 10 minutes.',
          'Gently add the fish fillets to the pot and let them simmer in the soup for about 5-7 minutes or until cooked through.',
          'Season the soup with salt and pepper to taste.',
          'Serve hot, garnished with fresh herbs if desired.'
        ]
      },
    };

    Map<String, List<String>>? details = foodDetails[foodName];
    List<String>? ingredients = details?['Ingredients'];
    List<String>? instructions = details?['Instructions'];

    return Scaffold(
      appBar: AppBar(
        title: Text(foodName),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              child: Image.asset(
                'assets/elderly_food_placeholder.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
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
    );
  }
}

