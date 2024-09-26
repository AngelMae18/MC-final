import 'package:flutter/material.dart';

void main() {
  runApp(MoodClickApp());
}

class MoodClickApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ActivityScreen(),
    );
  }
}

class ActivityScreen extends StatelessWidget {
  final List<Activity> activities = [
    Activity(user: 'Carrot', activity: 'reacted to your post.', date: '5 Nov'),
    Activity(user: 'Banana', activity: 'reacted to your post.', date: '4 Nov'),
    Activity(user: 'Pineapple', activity: 'reacted to your post.', date: '18 Oct'),
    // Add more activities here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        title: Text('Activity'),
      ),
      body: ListView.builder(
        itemCount: activities.length,
        itemBuilder: (context, index) {
          return ActivityTile(activity: activities[index]);
        },
      ),
    );
  }
}

class Activity {
  final String user;
  final String activity;
  final String date;

  Activity({
    required this.user,
    required this.activity,
    required this.date,
  });
}

class ActivityTile extends StatelessWidget {
  final Activity activity;

  ActivityTile({required this.activity});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[300],
        child: Text(
          activity.user[0].toUpperCase(),
          style: TextStyle(color: Colors.black),
        ),
        radius: 20.0,
      ),
      title: Text(
        '${activity.user} ${activity.activity}',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        activity.date,
        style: TextStyle(color: Colors.grey),
      ),
      onTap: () {
        // Handle tap if needed (e.g., navigate to the post)
      },
    );
  }
}
