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
                    imagePath: 'lib/assets/images/e1-a.png',
                    foodName: 'Porridge',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodDetailPage(
                            foodName: 'Porridge',
                            ingredients: _getPorridgeIngredients(),
                            instructions: _getPorridgeInstructions(),
                            imagePath: 'lib/assets/images/e1-b.png',
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: _buildFoodContainer(
                    imagePath: 'lib/assets/images/e2-a.png',
                    foodName: 'Mashed Potatoes',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodDetailPage(
                            foodName: 'Mashed Potatoes',
                            ingredients: _getMashedPotatoesIngredients(),
                            instructions: _getMashedPotatoesInstructions(),
                            imagePath: 'lib/assets/images/e2-b.png',
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
                    imagePath: 'lib/assets/images/e3-a.png',
                    foodName: 'Vegetables',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodDetailPage(
                            foodName: 'Vegetables',
                            ingredients: _getVegetablesIngredients(),
                            instructions: _getVegetablesInstructions(),
                            imagePath: 'lib/assets/images/e3-b.png',
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: _buildFoodContainer(
                    imagePath: 'lib/assets/images/e4-a.png',
                    foodName: 'Fish Soup',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodDetailPage(
                            foodName: 'Fish Soup',
                            ingredients: _getFishSoupIngredients(),
                            instructions: _getFishSoupInstructions(),
                            imagePath: 'lib/assets/images/e4-b.png',
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

List<String> _getPorridgeIngredients() {
  return [
    '1/2 cup rolled oats',
    '1 cup water or milk',
    'Pinch of salt (optional)',
    'Toppings of your choice: fruits, nuts, honey, cinnamon, etc.',
  ];
}

List<String> _getPorridgeInstructions() {
  return [
    'In a small saucepan, bring the water or milk to a boil over medium-high heat.',
    'Stir in the rolled oats and reduce the heat to medium-low. Cook, stirring occasionally, for about 5 minutes or until the oats are soft and creamy.',
    'Remove from heat and let the porridge sit for a minute or two to thicken.',
    'Serve hot with your favorite toppings.',
  ];
}

List<String> _getMashedPotatoesIngredients() {
  return [
    '2 pounds potatoes (such as russet or Yukon gold)',
    '1/4 cup vegan butter or olive oil',
    '1/2 cup non-dairy milk (such as almond or soy)',
    'Salt and pepper to taste',
    'Optional add-ins: minced garlic, chopped chives, nutritional yeast',
  ];
}

List<String> _getMashedPotatoesInstructions() {
  return [
    'Peel and chop the potatoes into small chunks.',
    'Place the potatoes in a large pot and cover with cold water. Add a pinch of salt to the water.',
    'Bring the water to a boil over high heat, then reduce the heat to medium-low and simmer for about 15 minutes or until the potatoes are fork-tender.',
    'Drain the potatoes and return them to the pot.',
    'Add the vegan butter or olive oil, non-dairy milk, salt, and pepper to the pot.',
    'Mash the potatoes using a potato masher or fork until smooth and creamy. Add more non-dairy milk if needed to reach your desired consistency.',
    'Stir in any optional add-ins, if using.',
    'Taste and adjust seasoning as needed.',
    'Serve hot as a side dish.',
  ];
}

List<String> _getVegetablesIngredients() {
  return [
    'Assorted vegetables of your choice (e.g., carrots, broccoli, cauliflower, bell peppers, snap peas)',
    '1-2 tablespoons olive oil or vegetable oil',
    'Salt and pepper to taste',
    'Optional seasonings: garlic powder, onion powder, paprika, Italian seasoning',
  ];
}

List<String> _getVegetablesInstructions() {
  return [
    'Preheat your oven to 400°F (200°C).',
    'Wash and chop the vegetables into bite-sized pieces.',
    'Place the vegetables on a large baking sheet.',
    'Drizzle the olive oil over the vegetables and toss to coat evenly. Season with salt, pepper, and any desired seasonings.',
    'Spread the vegetables out in a single layer on the baking sheet.',
    'Roast in the preheated oven for 20-25 minutes, stirring halfway through, or until the vegetables are tender and lightly browned.',
    'Serve hot as a side dish or incorporate into other recipes.',
  ];
}

List<String> _getFishSoupIngredients() {
  return [
    '1 tablespoon olive oil',
    '1 onion, diced',
    '2 carrots, peeled and sliced',
    '2 celery stalks, sliced',
    '2 cloves garlic, minced',
    '6 cups vegetable broth or water',
    '1 can (14 oz) diced tomatoes, undrained',
    '1 teaspoon dried thyme',
    '1 teaspoon dried rosemary',
    '1 bay leaf',
    'Salt and pepper to taste',
    '1 cup frozen peas',
    '8 oz firm tofu, diced (optional)',
    'Fresh parsley, chopped, for garnish',
  ];
}

List<String> _getFishSoupInstructions() {
  return [
    'In a large pot, heat the olive oil over medium heat. Add the diced onion, sliced carrots, and sliced celery. Cook, stirring occasionally, for about 5 minutes or until the vegetables are softened.',
    'Add the minced garlic to the pot and cook for an additional 1 minute.',
    'Pour in the vegetable broth (or water) and diced tomatoes with their juices. Stir in the dried thyme, dried rosemary, bay leaf, salt, and pepper.',
    'Bring the soup to a boil, then reduce the heat to low and simmer, uncovered, for about 15-20 minutes or until the vegetables are tender.',
    'Stir in the frozen peas and diced tofu, if using. Cook for another 5 minutes or until heated through.',
    'Taste and adjust seasoning as needed. Remove the bay leaf before serving.',
    'Ladle the hot soup into bowls and garnish with chopped fresh parsley.',
    'Serve hot with crusty bread or crackers.',
  ];
}

void main() {
  runApp(MaterialApp(
    home: ElderlyFoodPage(),
  ));
}
