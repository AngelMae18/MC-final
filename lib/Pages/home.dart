import 'package:flutter/material.dart';
import 'package:untitled/Pages/menu.dart';
import 'package:untitled/Pages/notification.dart';
import 'package:untitled/Pages/profile.dart';

void main() {
  runApp(MoodClickApp());
}
class MoodClickApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(), // Setting HomeScreen as the initial screen
      routes: {
        '/menu': (context) => AppDrawer(), // Menu screen route
        '/notification': (context) => ActivityScreen(), // Notifications screen route
        '/profile': (context) => ProfileInfoScreen(), // Profile screen route
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Navigator.pushNamed(context, '/menu'); // Navigate to menu page
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Navigator.pushNamed(context, '/notifications'); // Navigate to notifications page
            },
          ),
          IconButton(
            icon: Icon(Icons.person, color: Colors.blue), // Profile icon
            onPressed: () {
              Navigator.pushNamed(context, '/profile'); // Navigate to profile page
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MoodList(),
      ),
    );
  }
}

class MoodList extends StatelessWidget {
  final List<MoodCardData> moodData = [
    MoodCardData("JohnDoe", "Happy", 80, "7 May at 19:18", "Feeling great and full of energy!", 109),
    MoodCardData("JaneDoe", "Sad", 30, "7 May at 19:18", "Had a tough day, feeling down.", 75),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: 'How do you feel today?',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: moodData.length,
            itemBuilder: (context, index) {
              return MoodCard(moodData[index]);
            },
          ),
        ),
      ],
    );
  }
}

class MoodCardData {
  final String nickname;
  final String mood;
  final int rate;
  final String dateTime;
  final String description;
  int cares;

  MoodCardData(this.nickname, this.mood, this.rate, this.dateTime, this.description, this.cares);
}

class MoodCard extends StatefulWidget {
  final MoodCardData data;

  MoodCard(this.data);

  @override
  _MoodCardState createState() => _MoodCardState();
}

class _MoodCardState extends State<MoodCard> {
  void _incrementCares() {
    setState(() {
      widget.data.cares += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${widget.data.nickname} - ${widget.data.mood} (${widget.data.rate}%)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(widget.data.dateTime, style: TextStyle(color: Colors.grey)),
            SizedBox(height: 10),
            Text(widget.data.description),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${widget.data.cares} Cares'),
                ElevatedButton.icon(
                  onPressed: _incrementCares,
                  icon: Icon(Icons.favorite),
                  label: Text('Care'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
