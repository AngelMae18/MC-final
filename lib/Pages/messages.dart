import 'package:flutter/material.dart';

void main() {
  runApp(MoodClickApp());
}

class MoodClickApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MessagesScreen(),
    );
  }
}

class MessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // You can add a navigation drawer here if needed
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Implement notification action here
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              // Navigate to profile or settings screen
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            MessageCard(
              title: 'Lorem Ipsum dolor sit amet',
              author: 'Admin ITE',
              dateInfo: '16 days ago',
              readTime: '3 min read',
            ),
            MessageCard(
              title: 'Consectetur adipiscing elit',
              author: 'Admin ITE',
              dateInfo: '14 days ago',
              readTime: '2 min read',
            ),
            MessageCard(
              title: 'Sed do eiusmod tempor incididunt',
              author: 'Admin ITE',
              dateInfo: '10 days ago',
              readTime: '5 min read',
            ),
            // Add more MessageCard widgets here for more messages
          ],
        ),
      ),
    );
  }
}

class MessageCard extends StatelessWidget {
  final String title;
  final String author;
  final String dateInfo;
  final String readTime;

  MessageCard({
    required this.title,
    required this.author,
    required this.dateInfo,
    required this.readTime,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.only(bottom: 16.0), // Add space between cards
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              author.toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
            ),
            SizedBox(height: 8.0),
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Text(
                  dateInfo,
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(width: 16.0),
                Text(
                  readTime,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
