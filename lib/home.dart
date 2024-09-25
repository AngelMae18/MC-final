import 'package:flutter/material.dart';

void main() {
  runApp(MoodClickApp());
}

class MoodClickApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/login');
    });

    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login(BuildContext context) {
    // Navigate to HomeScreen after login
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                hintText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _login(context),
              child: Text('Login'),
            ),
          ],
        ),
      ),
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
          onPressed: () {},
        ),
        actions: [
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
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
    // Add more MoodCardData as needed
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
        SizedBox(height: 10), // Added some spacing before the list
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
