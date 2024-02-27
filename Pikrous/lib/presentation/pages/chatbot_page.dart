import 'package:flutter/material.dart';

void main() {
  runApp(ChatbotApp());
}

class ChatbotApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatbot App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChatbotScreen(),
    );
  }
}

class ChatbotScreen extends StatefulWidget {
  @override
  _ChatbotScreenState createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  TextEditingController _controller = TextEditingController();
  List<ChatMessage> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatbot'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _messages[index];
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    _sendMessage(_controller.text);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage(String text) {
    setState(() {
      _messages.insert(0, ChatMessage(text: text, isUser: true));
    });

    // Bot response logic
    _botResponse(text);

    _controller.clear();
  }

  void _botResponse(String text) {
    String response;

    String userInput = text.toLowerCase();

    // Bot responses based on user input
    
    if (userInput.contains('diet')) {
      response = 'For a healthy diet, focus on balanced meals with plenty of fruits and vegetables.';
    } else if (userInput.contains('vegan')) {
      response = 'Vegan diets exclude all animal products. Consider incorporating more plant-based foods like fruits, vegetables, grains, and legumes.';
    } else if (userInput.contains('diabetes')) {
      response = 'A diabetic diet typically involves monitoring carbohydrate intake, choosing foods with a low glycemic index, and portion control.';
    } else if (userInput.contains('elderly') || userInput.contains('senior')) {
      response = 'For elderly individuals, it\'s important to prioritize nutrient-dense foods that are easy to chew and digest. Consider foods rich in calcium and vitamin D for bone health.';
    } else {
      response = 'I\'m sorry, I didn\'t understand that.';
    }

    setState(() {
      _messages.insert(0, ChatMessage(text: response, isUser: false));
    });
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUser;

  const ChatMessage({required this.text, required this.isUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: isUser ? Colors.blue : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.all(10),
            child: Text(
              text,
              style: TextStyle(color: isUser ? Colors.white : Colors.black),
            ),
          ),
          SizedBox(height: 4),
          Text(
            isUser ? 'You' : 'Bot',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}