import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final VoidCallback onStart;
  final String quizTitle;

  const WelcomeScreen({
    Key? key,
    required this.onStart,
    required this.quizTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/quiz-logo.png'), // Fixed path for simplicity
              SizedBox(height: 20),
              Text(
                quizTitle,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: onStart,
                child: Text("Start Quiz"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
