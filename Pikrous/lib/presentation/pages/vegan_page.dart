import 'package:flutter/material.dart';

class VeganFoodPage extends StatelessWidget {
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
                    imagePath: 'lib/assets/images/v1-a.png',
                    foodName: 'Chickpea Salad',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodDetailPage(
                            foodName: 'Chickpea Salad',
                            ingredients: _getChickpeaSaladIngredients(),
                            instructions: _getChickpeaSaladInstructions(),
                            imagePath: 'lib/assets/images/v1-b.png',
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: _buildFoodContainer(
                    imagePath: 'lib/assets/images/v2-a.png',
                    foodName: 'Tofu Stir Fry',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodDetailPage(
                            foodName: 'Tofu Stir Fry',
                            ingredients: _getTofuStirFryIngredients(),
                            instructions: _getTofuStirFryInstructions(),
                            imagePath: 'lib/assets/images/v2-b.png',
                          ),
                        ),
                      );
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
                    imagePath: 'lib/assets/images/v3-a.png',
                    foodName: 'Vegan Pizza',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodDetailPage(
                            foodName: 'Vegan Pizza',
                            ingredients: _getVeganPizzaIngredients(),
                            instructions: _getVeganPizzaInstructions(),
                            imagePath: 'lib/assets/images/v3-b.png',
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: _buildFoodContainer(
                    imagePath: 'lib/assets/images/v4-a.png',
                    foodName: 'Vegetable Curry',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodDetailPage(
                            foodName: 'Vegetable Curry',
                            ingredients: _getVegetableCurryIngredients(),
                            instructions: _getVegetableCurryInstructions(),
                            imagePath: 'lib/assets/images/v4-b.png',
                          ),
                        ),
                      );
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

class FoodDetailPage extends StatelessWidget {
  final String foodName;
  final List<String> ingredients;
  final List<String> instructions;
  final String imagePath;

  const FoodDetailPage({Key? key, required this.foodName, required this.ingredients, required this.instructions, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    children: ingredients.map((ingredient) {
                      return Text('• $ingredient');
                    }).toList(),
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
                    children: instructions.asMap().entries.map((entry) {
                      int index = entry.key + 1;
                      String instruction = entry.value;
                      return Text('$index. $instruction');
                    }).toList(),
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

List<String> _getChickpeaSaladIngredients() {
  return [
    '1 can (15 oz) chickpeas, drained and rinsed',
    '1 cup cherry tomatoes, halved',
    '1/2 cucumber, diced',
    '1/4 red onion, thinly sliced',
    '1/4 cup chopped fresh parsley',
    '2 tablespoons olive oil',
    '1 tablespoon lemon juice',
    'Salt and pepper to taste',
  ];
}

List<String> _getChickpeaSaladInstructions() {
  return [
    'In a large bowl, combine the chickpeas, cherry tomatoes, cucumber, red onion, and parsley.',
    'Drizzle olive oil and lemon juice over the salad.',
    'Season with salt and pepper to taste.',
    'Toss gently to combine.',
    'Serve immediately, or refrigerate for later.',
  ];
}

List<String> _getTofuStirFryIngredients() {
  return [
    '1 block (14 oz) firm tofu, drained and pressed',
    '2 tablespoons soy sauce or tamari',
    '1 tablespoon sesame oil',
    '1 tablespoon cornstarch',
    '2 tablespoons vegetable oil',
    '2 cups mixed vegetables (bell peppers, broccoli, carrots, snap peas, etc.)',
    '2 cloves garlic, minced',
    '1 tablespoon grated ginger',
    'Cooked rice or noodles, for serving',
    'Sesame seeds and green onions, for garnish',
  ];
}

List<String> _getTofuStirFryInstructions() {
  return [
    'Cut the pressed tofu into cubes.',
    'In a bowl, whisk together soy sauce, sesame oil, and cornstarch.',
    'Add the tofu cubes to the marinade and toss to coat. Let it marinate for 15-30 minutes.',
    'Heat vegetable oil in a large skillet or wok over medium-high heat.',
    'Add the marinated tofu cubes and cook until golden brown on all sides. Remove from the skillet and set aside.',
    'In the same skillet, add more oil if needed. Add the mixed vegetables, garlic, and ginger. Stir-fry until the vegetables are tender-crisp.',
    'Return the tofu to the skillet and toss everything together.',
    'Serve the tofu stir-fry over cooked rice or noodles.',
    'Garnish with sesame seeds and chopped green onions, if desired.',
  ];
}

List<String> _getVeganPizzaIngredients() {
  return [
    '1 pre-made pizza crust',
    '1/2 cup marinara sauce',
    '1 cup vegan cheese, shredded',
    'Assorted toppings (e.g., sliced bell peppers, onions, mushrooms, olives)',
    'Fresh basil leaves, for garnish',
    'Red pepper flakes, for garnish (optional)',
  ];
}

List<String> _getVeganPizzaInstructions() {
  return [
    'Preheat your oven according to the pizza crust package instructions.',
    'Place the pizza crust on a baking sheet or pizza stone.',
    'Spread marinara sauce evenly over the crust, leaving a small border around the edges.',
    'Sprinkle shredded vegan cheese over the sauce.',
    'Add your desired toppings, distributing them evenly over the cheese.',
    'Bake the pizza in the preheated oven according to the crust package instructions, or until the crust is golden brown and the cheese is melted and bubbly.',
    'Remove the pizza from the oven and let it cool slightly before slicing.',
    'Garnish with fresh basil leaves and red pepper flakes, if desired.',
    'Slice and serve hot.',
  ];
}

List<String> _getVegetableCurryIngredients() {
  return [
    '1 tablespoon coconut oil',
    '1 onion, diced',
    '2 cloves garlic, minced',
    '1 tablespoon grated ginger',
    '2 carrots, peeled and diced',
    '2 potatoes, peeled and diced',
    '1 bell pepper, diced',
    '1 can (15 oz) chickpeas, drained and rinsed',
    '1 can (14 oz) diced tomatoes, undrained',
    '1 can (14 oz) coconut milk',
    '2 tablespoons curry powder',
    'Salt and pepper to taste',
    'Fresh cilantro, chopped, for garnish',
    'Cooked rice or naan, for serving',
  ];
}

List<String> _getVegetableCurryInstructions() {
  return [
    'In a large pot or skillet, heat coconut oil over medium heat.',
    'Add the diced onion and cook until softened, about 5 minutes.',
    'Add the minced garlic and grated ginger, and cook for an additional 1 minute.',
    'Stir in the diced carrots, potatoes, and bell pepper. Cook for 5 minutes, stirring occasionally.',
    'Add the drained chickpeas, diced tomatoes (with their juices), coconut milk, and curry powder to the pot. Stir to combine.',
    'Season with salt and pepper to taste.',
    'Bring the mixture to a simmer, then reduce the heat to low and cover the pot.',
    'Simmer for 20-25 minutes, or until the vegetables are tender.',
    'Taste and adjust seasoning if needed.',
    'Serve the vegetable curry hot, garnished with chopped fresh cilantro. Enjoy with cooked rice or naan.',
  ];
}

void main() {
  runApp(MaterialApp(
    home: VeganFoodPage(),
  ));
}
