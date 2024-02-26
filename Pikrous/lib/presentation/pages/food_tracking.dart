import 'package:flutter/material.dart';

void main() {
  runApp(FoodTrackingApp());
}

class FoodTrackingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Tracking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FoodTrackingScreen(),
    );
  }
}

class FoodTrackingScreen extends StatefulWidget {
  @override
  _FoodTrackingScreenState createState() => _FoodTrackingScreenState();
}

class _FoodTrackingScreenState extends State<FoodTrackingScreen> {
  List<FoodItem> _foodItems = [];
  int _waterIntake = 0;
  bool _waterClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Tracking'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _waterClicked = !_waterClicked;
                if (_waterClicked) {
                  _waterIntake += 250;
                }
              });
            },
            child: Container(
              height: 100,
              color: _waterClicked ? Colors.blue : Colors.transparent,
              child: Center(
                child: Icon(
                  _waterClicked ? Icons.local_drink : Icons.local_drink_outlined,
                  size: 50,
                  color: _waterClicked ? Colors.white : Colors.blue,
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Water Intake: $_waterIntake ml',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _foodItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_foodItems[index].name),
                  subtitle: Text(
                      'Quantity: ${_foodItems[index].quantity} - Time: ${_foodItems[index].time}'),
                  trailing: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      _editFoodItem(index);
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                _addFoodItem();
              },
              child: Text('Add Food Item'),
            ),
          ),
        ],
      ),
    );
  }

  void _addFoodItem() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newFood = '';
        int quantity = 1;
        TimeOfDay time = TimeOfDay.now();
        return AlertDialog(
          title: Text('Add Food Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  newFood = value;
                },
                decoration: InputDecoration(hintText: 'Enter food item'),
              ),
              SizedBox(height: 10),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  quantity = int.tryParse(value) ?? 1;
                },
                decoration: InputDecoration(hintText: 'Enter quantity'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  TimeOfDay? selectedTime =
                      await showTimePicker(context: context, initialTime: time);
                  if (selectedTime != null) {
                    setState(() {
                      time = selectedTime;
                    });
                  }
                },
                child: Text('Select Time'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _foodItems.add(
                    FoodItem(
                      name: newFood,
                      quantity: quantity,
                      time: time.format(context),
                    ),
                  );
                });
                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _editFoodItem(int index) {
    FoodItem item = _foodItems[index];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String editedFood = item.name;
        int editedQuantity = item.quantity;
        TimeOfDay editedTime = TimeOfDay.fromDateTime(DateTime.parse(item.time));
        return AlertDialog(
          title: Text('Edit Food Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  editedFood = value;
                },
                decoration: InputDecoration(hintText: 'Enter food item'),
                controller: TextEditingController(text: item.name),
              ),
              SizedBox(height: 10),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  editedQuantity = int.tryParse(value) ?? item.quantity;
                },
                decoration: InputDecoration(hintText: 'Enter quantity'),
                controller: TextEditingController(text: item.quantity.toString()),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  TimeOfDay? selectedTime = await showTimePicker(
                      context: context, initialTime: editedTime);
                  if (selectedTime != null) {
                    setState(() {
                      editedTime = selectedTime;
                    });
                  }
                },
                child: Text('Select Time'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _foodItems[index] = FoodItem(
                    name: editedFood,
                    quantity: editedQuantity,
                    time: editedTime.format(context),
                  );
                });
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

class FoodItem {
  final String name;
  final int quantity;
  final String time;

  FoodItem({required this.name, required this.quantity, required this.time});
}
