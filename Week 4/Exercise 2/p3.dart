import 'package:flutter/material.dart';

void main() {
  runApp(const TechApp());
}

class TechApp extends StatelessWidget {
  const TechApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Tech Stack"),
          backgroundColor: Colors.deepPurple[100],
        ),
        body: const Padding(
          padding: EdgeInsets.all(30),
          child: TechList(),
        ),
      ),
    );
  }
}

const String dartImage = "assets/dart.png";
const String flutterImage = "assets/flutter.png";
const String firebaseImage = "assets/firebase.png";

enum Tech {
  Dart("Dart", "A modern, powerful programming language", dartImage),
  Flutter("Flutter", "A framework for building natively compiled apps", flutterImage),
  Firebase("Firebase", "Cloud-based platform for app development", firebaseImage);

  final String title;
  final String description;
  final String imagePath;

  const Tech(this.title, this.description, this.imagePath);
}

class TechList extends StatelessWidget {
  const TechList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        TechCard(tech: Tech.Dart),
        SizedBox(height: 12),
        TechCard(tech: Tech.Flutter),
        SizedBox(height: 12),
        TechCard(tech: Tech.Firebase),
      ],
    );
  }
}

class TechCard extends StatelessWidget {
  final Tech tech;

  const TechCard({
    super.key,
    required this.tech,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(tech.imagePath, width: 120),
            const SizedBox(height: 10),
            Text(
              tech.title,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              tech.description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
