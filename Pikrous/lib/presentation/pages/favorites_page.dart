import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Healthify Features'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tailored Food Categories:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              'Healthify offers a diverse range of food categories, each designed to address specific health goals. '
              'From antioxidant-rich fruits to protein-packed grains, our app provides a curated selection of foods that align with your nutritional needs. '
              'Gone are the days of confusing diet plans – Healthify streamlines your choices, making healthy eating intuitive and enjoyable.',
            ),
            SizedBox(height: 16),
            Text(
              'Daily Eating Guidelines:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              'But Healthify doesn\'t stop at suggesting what to eat; it guides you on how to incorporate these foods into your daily routine. '
              'Our daily eating guidelines provide you with a roadmap for optimal nutrition. '
              'Whether it\'s spreading your protein intake throughout the day or ensuring a colorful array of vegetables on your plate, '
              'Healthify empowers you to make informed decisions for a healthier you.',
            ),
            SizedBox(height: 16),
            Text(
              'In conclusion, Healthify is more than just an app; it\'s a holistic approach to health and well-being. '
              'With tailored food categories, daily eating guidelines, easy-to-follow recipes, instructional videos, '
              'and a supportive community, Healthify is your go-to guide for achieving and maintaining a healthy lifestyle. '
              'Download Healthify today and embark on a journey to a healthier, happier you.',
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: FavoritePage(),
  ));
}