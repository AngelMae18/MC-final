import 'package:flutter/material.dart';

class AddMoodScreen extends StatefulWidget {
  const AddMoodScreen({super.key});

  @override
  _AddMoodScreenState createState() => _AddMoodScreenState();
}

class _AddMoodScreenState extends State<AddMoodScreen> {
  String? selectedMood;
  double moodPercentage = 50.0;

  Widget _buildMoodOption(String mood) {
    return ListTile(
      title: Text(
        mood,
        style: TextStyle(fontSize: 18),
      ),
      trailing: selectedMood == mood
          ? Icon(Icons.check_circle, color: Color(0xFF586EFF))
          : null,
      onTap: () {
        setState(() {
          selectedMood = mood;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Mood'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildMoodOption('Happy'),
            _buildMoodOption('Sad'),
            _buildMoodOption('Disappointed'),
            _buildMoodOption('Scared'),
            _buildMoodOption('Angry'),
            if (selectedMood != null) ...[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'How much are you feeling $selectedMood?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Slider(
                value: moodPercentage,
                min: 0,
                max: 100,
                divisions: 100,
                label: moodPercentage.round().toString() + '%',
                onChanged: (double value) {
                  setState(() {
                    moodPercentage = value;
                  });
                },
              ),
            ],
            Spacer(),
            ElevatedButton(
              onPressed: selectedMood != null
                  ? () {
                // Handle adding mood logic here, including the percentage
                print('Mood: $selectedMood, Percentage: $moodPercentage%');

                // Show a Snackbar
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Mood added: $selectedMood with $moodPercentage%'),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
                  : null,
              child: Text('Add'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF586EFF), // Button color
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false, // Remove the debug ribbon
  ));
}
