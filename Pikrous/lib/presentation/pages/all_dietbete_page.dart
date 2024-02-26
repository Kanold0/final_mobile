import 'package:flutter/material.dart';

class DiabetesFoodPage extends StatelessWidget {
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
        title: Text('Diabetes-Friendly Food'),
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
                    imagePath: 'lib/assets/images/dia1-a.png',
                    foodName: 'Grilled Salmon',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodDetailPage(
                            foodName: 'Grilled Salmon',
                            ingredients: _getSalmonIngredients(),
                            instructions: _getSalmonInstructions(),
                            imagePath: 'lib/assets/images/dia1-b.png',
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: _buildFoodContainer(
                    imagePath: 'lib/assets/images/d1-a.png',
                    foodName: 'Quinoa Salad',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodDetailPage(
                            foodName: 'Quinoa Salad',
                            ingredients: _getQuinoaSaladIngredients(),
                            instructions: _getQuinoaSaladInstructions(),
                            imagePath: 'lib/assets/images/d1-b.jpg',
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
                    imagePath: 'lib/assets/images/dia3-a.png',
                    foodName: 'Vegetable Stir-Fry',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodDetailPage(
                            foodName: 'Vegetable Stir-Fry',
                            ingredients: _getStirFryIngredients(),
                            instructions: _getStirFryInstructions(),
                            imagePath: 'lib/assets/images/dia3-b.png',
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: _buildFoodContainer(
                    imagePath: 'lib/assets/images/dia4-a.png',
                    foodName: 'Greek Salad',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodDetailPage(
                            foodName: 'Greek Salad',
                            ingredients: _getGreekSaladIngredients(),
                            instructions: _getGreekSaladInstructions(),
                            imagePath: 'lib/assets/images/dia4-b.png',
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
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Center(
              child: Image.asset(
                imagePath,
                width: 300,
                height: 200,
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
    );
  }
}

List<String> _getSalmonIngredients() {
  return [
    '4 salmon fillets',
    '2 tablespoons olive oil',
    '2 cloves garlic, minced',
    '1 teaspoon dried oregano',
    '1 teaspoon dried thyme',
    'Salt and pepper to taste',
    'Fresh lemon wedges, for serving',
  ];
}

List<String> _getSalmonInstructions() {
  return [
    'Preheat the grill to medium-high heat.',
    'In a small bowl, mix together olive oil, minced garlic, dried oregano, dried thyme, salt, and pepper.',
    'Brush the mixture over the salmon fillets.',
    'Grill the salmon for about 4-5 minutes per side, or until cooked through and easily flakes with a fork.',
    'Serve the grilled salmon with fresh lemon wedges.',
  ];
}

List<String> _getQuinoaSaladIngredients() {
  return [
    '1 cup quinoa, rinsed',
    '2 cups water or vegetable broth',
    '1 cucumber, diced',
    '1 bell pepper, diced',
    '1/4 cup red onion, finely chopped',
    '1/4 cup fresh parsley, chopped',
    '1/4 cup olive oil',
    '2 tablespoons lemon juice',
    'Salt and pepper to taste',
  ];
}

List<String> _getQuinoaSaladInstructions() {
  return [
    'In a medium saucepan, combine quinoa and water or vegetable broth.',
    'Bring to a boil, then reduce heat to low, cover, and simmer for 15-20 minutes, or until quinoa is cooked and liquid is absorbed.',
    'Remove from heat and let cool.',
    'In a large bowl, combine cooked quinoa, diced cucumber, diced bell pepper, chopped red onion, and chopped parsley.',
    'In a small bowl, whisk together olive oil, lemon juice, salt, and pepper.',
    'Pour the dressing over the quinoa salad and toss to combine.',
    'Serve chilled or at room temperature.',
  ];
}

List<String> _getStirFryIngredients() {
  return [
    '2 tablespoons vegetable oil',
    '1 onion, sliced',
    '2 cloves garlic, minced',
    '1 bell pepper, sliced',
    '2 cups broccoli florets',
    '1 cup snap peas',
    '1 cup sliced mushrooms',
    '1/4 cup low-sodium soy sauce',
    '2 tablespoons rice vinegar',
    '1 tablespoon cornstarch',
    '1 teaspoon sesame oil',
    'Cooked brown rice, for serving',
    'Sesame seeds and sliced green onions, for garnish',
  ];
}

List<String> _getStirFryInstructions() {
  return [
    'In a small bowl, whisk together soy sauce, rice vinegar, cornstarch, and sesame oil. Set aside.',
    'Heat vegetable oil in a large skillet or wok over medium-high heat.',
    'Add sliced onion and minced garlic to the skillet. Stir-fry for 2-3 minutes, until onion is translucent.',
    'Add sliced bell pepper, broccoli florets, snap peas, and sliced mushrooms to the skillet. Stir-fry for an additional 5-6 minutes, until vegetables are tender-crisp.',
    'Pour the sauce mixture over the vegetables in the skillet. Stir well to coat.',
    'Continue cooking for 2-3 minutes, until the sauce thickens and coats the vegetables.',
    'Remove from heat and serve the vegetable stir-fry over cooked brown rice.',
    'Garnish with sesame seeds and sliced green onions, if desired.',
  ];
}

List<String> _getGreekSaladIngredients() {
  return [
    '2 large tomatoes, chopped',
    '1 cucumber, diced',
    '1 bell pepper, diced',
    '1/2 red onion, thinly sliced',
    '1/2 cup Kalamata olives',
    '1/2 cup crumbled feta cheese',
    '2 tablespoons extra virgin olive oil',
    '1 tablespoon red wine vinegar',
    '1 teaspoon dried oregano',
    'Salt and pepper to taste',
  ];
}

List<String> _getGreekSaladInstructions() {
  return [
    'In a large bowl, combine chopped tomatoes, diced cucumber, diced bell pepper, thinly sliced red onion, Kalamata olives, and crumbled feta cheese.',
    'In a small bowl, whisk together extra virgin olive oil, red wine vinegar, dried oregano, salt, and pepper.',
    'Pour the dressing over the salad ingredients in the large bowl.',
    'Toss well to combine and coat the salad with the dressing.',
    'Serve immediately, or chill in the refrigerator for 30 minutes before serving to allow flavors to meld.',
  ];
}
