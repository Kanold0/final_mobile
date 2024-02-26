import 'package:flutter/material.dart';

class DietFoodPage extends StatelessWidget {
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
                    imagePath: 'lib/assets/images/d1-a.png',
                    foodName: 'Quinoa Salad',
                    onPressed: () {
                      // Handle detail button pressed for Quinoa Salad
                      _navigateToFoodDetail(context, 'Quinoa Salad', _getQuinoaSaladIngredients(), _getQuinoaSaladInstructions(), 'lib/assets/images/d1-b.jpg');
                    },
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: _buildFoodContainer(
                    imagePath: 'lib/assets/images/d2-a.png',
                    foodName: 'Avocado Toast',
                    onPressed: () {
                      // Handle detail button pressed for Avocado Toast
                      _navigateToFoodDetail(context, 'Avocado Toast', _getAvocadoToastIngredients(), _getAvocadoToastInstructions(), 'lib/assets/images/d2-b.png');
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
                    imagePath: 'lib/assets/images/d3-a.png',
                    foodName: 'Chickpea Curry',
                    onPressed: () {
                      // Handle detail button pressed for Chickpea Curry
                      _navigateToFoodDetail(context, 'Chickpea Curry', _getChickpeaCurryIngredients(), _getChickpeaCurryInstructions(), 'lib/assets/images/d3-a.png');
                    },
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: _buildFoodContainer(
                    imagePath: 'lib/assets/images/d4-a.png',
                    foodName: 'Veggie Burger',
                    onPressed: () {
                      // Handle detail button pressed for Veggie Burger
                      _navigateToFoodDetail(context, 'Veggie Burger', _getVeggieBurgerIngredients(), _getVeggieBurgerInstructions(), 'lib/assets/images/d4-b.png');
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

  void _navigateToFoodDetail(BuildContext context, String foodName, List<String> ingredients, List<String> instructions, String imagePath) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailPage(
          foodName: foodName,
          ingredients: ingredients,
          instructions: instructions,
          imagePath: imagePath,
        ),
      ),
    );
  }

  List<String> _getQuinoaSaladIngredients() {
    return [
      '1 cup quinoa',
      '1 1/2 cups water',
      '1/4 cup olive oil',
      '1/4 cup lemon juice',
      '1 teaspoon Dijon mustard',
      '1/4 teaspoon salt',
      '1/8 teaspoon black pepper',
      '1/4 cup chopped fresh parsley',
      '1/2 cup chopped cucumber',
      '1/2 cup halved cherry tomatoes',
      '1/4 cup chopped red onion',
      '1/4 cup chopped bell pepper',
      '1/4 cup chopped fresh cilantro',
    ];
  }

  List<String> _getQuinoaSaladInstructions() {
    return [
      'Rinse quinoa under cold water until the water runs clear. Combine quinoa and water in a saucepan; bring to a boil. Reduce heat to medium-low, cover, and simmer until quinoa is tender and water has been absorbed, 15 to 20 minutes. Set aside to cool.',
      'Whisk olive oil, lemon juice, Dijon mustard, salt, and black pepper together in a bowl until smooth; drizzle over cooled quinoa. Stir to coat quinoa in dressing. Fold parsley, cucumber, tomatoes, red onion, bell pepper, and cilantro into quinoa mixture until evenly distributed. Serve immediately or chill in the refrigerator.',
    ];
  }

  List<String> _getAvocadoToastIngredients() {
    return [
      '2 slices whole grain bread',
      '1 ripe avocado',
      '1 small lemon, juiced',
      '1/4 teaspoon red pepper flakes',
      'Salt and black pepper to taste',
      'Optional toppings: cherry tomatoes, sliced radishes, microgreens, sesame seeds',
    ];
  }

  List<String> _getAvocadoToastInstructions() {
    return [
      'Toast the bread slices to your desired level of crispiness.',
      'Cut the avocado in half, remove the pit, and scoop the flesh into a bowl.',
      'Mash the avocado with a fork and mix in the lemon juice, red pepper flakes, salt, and black pepper.',
      'Spread the mashed avocado evenly onto each slice of toast.',
      'Top with your desired toppings and enjoy!',
    ];
  }

  List<String> _getChickpeaCurryIngredients() {
    return [
      '1 tablespoon olive oil',
      '1 onion, diced',
      '2 cloves garlic, minced',
      '1 tablespoon fresh ginger, grated',
      '1 tablespoon curry powder',
      '1 teaspoon ground cumin',
      '1/2 teaspoon ground turmeric',
      '1/4 teaspoon cayenne pepper',
      '1 can (15 ounces) chickpeas, drained and rinsed',
      '1 can (14.5 ounces) diced tomatoes',
      '1 can (13.5 ounces) coconut milk',
      'Salt and black pepper to taste',
      'Fresh cilantro, for garnish',
    ];
  }

  List<String> _getChickpeaCurryInstructions() {
    return [
      'Heat olive oil in a large skillet over medium heat. Add the diced onion and cook until softened, about 5 minutes.',
      'Add the minced garlic, grated ginger, curry powder, cumin, turmeric, and cayenne pepper to the skillet. Cook for 1 minute, stirring constantly, until fragrant.',
      'Add the chickpeas, diced tomatoes (with juices), and coconut milk to the skillet. Stir to combine.',
      'Bring the mixture to a simmer, then reduce the heat to low and let it simmer gently for about 15-20 minutes, stirring occasionally, until the flavors have melded together and the sauce has thickened slightly.',
      'Season with salt and black pepper to taste. Serve the curry hot, garnished with fresh cilantro, over cooked rice or with naan bread.',
    ];
  }

  List<String> _getVeggieBurgerIngredients() {
    return [
      '1 can (15 ounces) black beans, drained and rinsed',
      '1/2 cup breadcrumbs',
      '1/4 cup finely chopped onion',
      '1/4 cup grated carrot',
      '1/4 cup chopped fresh parsley',
      '1 teaspoon garlic powder',
      '1 teaspoon smoked paprika',
      '1/2 teaspoon cumin',
      'Salt and black pepper to taste',
      'Optional toppings: lettuce, tomato, onion, avocado, vegan cheese',
      'Burger buns',
    ];
  }

  List<String> _getVeggieBurgerInstructions() {
    return [
      'Preheat your oven to 375°F (190°C). Line a baking sheet with parchment paper or lightly grease it with oil.',
      'In a large mixing bowl, mash the black beans with a fork or potato masher until mostly smooth but still slightly chunky.',
      'Add the breadcrumbs, chopped onion, grated carrot, chopped parsley, garlic powder, smoked paprika, cumin, salt, and black pepper to the bowl. Mix until well combined.',
      'Divide the mixture into 4 equal portions and shape each portion into a patty.',
      'Place the patties on the prepared baking sheet and bake for 20-25 minutes, flipping halfway through, until the burgers are firm and golden brown on the outside.',
      'Serve the veggie burgers on burger buns with your favorite toppings and condiments. Enjoy!',
    ];
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

void main() {
  runApp(MaterialApp(
    home: DietFoodPage(),
  ));
}
