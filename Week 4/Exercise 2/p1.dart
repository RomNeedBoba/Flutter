import 'package:flutter/material.dart';

void main() {
  runApp(const TechShowcaseApp());
}

class TechShowcaseApp extends StatelessWidget {
  const TechShowcaseApp({super.key});

  final String dartLogo = "assets/dart.png";
  final String flutterLogo = "assets/flutter.png";
  final String firebaseLogo = "assets/firebase.png";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Tech Showcase"),
          backgroundColor: Colors.teal[100],
        ),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TechCard(
                image: dartLogo,
                title: "Dart",
                description: "A powerful object-oriented programming language.",
              ),
              const SizedBox(height: 12),
              TechCard(
                image: flutterLogo,
                title: "Flutter",
                description: "Build beautiful native apps with a single codebase.",
              ),
              const SizedBox(height: 12),
              TechCard(
                image: firebaseLogo,
                title: "Firebase",
                description: "Cloud-powered database and services for apps.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TechCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const TechCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(image, width: 100),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              description,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
