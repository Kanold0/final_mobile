import 'package:flutter/material.dart';

class FaqsPage extends StatelessWidget {
  final List<FAQItem> faqList = [
    FAQItem(
      question: '1. How do I choose the right food category for my health goal?',
      answer:
          'Healthify provides a diverse range of food categories designed for specific health goals. You can explore the categories in the app and choose based on your nutritional needs.',
    ),
    FAQItem(
      question: '2. Are there daily eating guidelines in Healthify?',
      answer:
          'Yes, Healthify goes beyond suggesting what to eat. Our app guides you on how to incorporate these foods into your daily routine, providing daily eating guidelines for optimal nutrition.',
    ),
    FAQItem(
      question: '3. How does Healthify make cooking easy?',
      answer:
          'Healthify comes equipped with easy-to-follow recipes and cooking instructions. Whether you are a beginner or an experienced cook, our app caters to all skill levels, ensuring a seamless cooking experience.',
    ),
    FAQItem(
      question: '4. Are there instructional videos in Healthify?',
      answer:
          'Yes, Healthify incorporates instructional videos that guide you through the process of making healthy meals. Whether you prefer visual learning or need culinary inspiration, our videos enhance your cooking skills.',
    ),
    FAQItem(
      question: '5. How can I connect with the Healthify community?',
      answer:
          'You can connect with like-minded individuals, share experiences, recipes, and tips in the vibrant Healthify community. Seek advice and celebrate milestones together for a supportive and enjoyable wellness journey.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Healthify FAQs'),
      ),
      body: ListView.builder(
        itemCount: faqList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ExpansionTile(
              title: Text(
                faqList[index].question,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(faqList[index].answer),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class FAQItem {
  final String question;
  final String answer;

  FAQItem({
    required this.question,
    required this.answer,
  });
}

void main() {
  runApp(MaterialApp(
    home: FaqsPage(),
  ));
}