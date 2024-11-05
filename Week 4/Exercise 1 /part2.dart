// part 2

import 'package:flutter/material.dart';

void main() {
  runApp(MyHobbyApp());
}

class MyHobbyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Favorite Pastimes"),
          backgroundColor: Colors.teal[200],
        ),
        body: const Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HobbyTile(
                icon: Icons.adventure,
                label: "Exploring",
                backgroundColor: Colors.orange,
              ),
              SizedBox(height: 15),
              HobbyTile(
                icon: Icons.sports_skating,
                label: "Roller Skating",
                backgroundColor: Colors.blueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HobbyTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color backgroundColor;
  
  const HobbyTile({
    super.key,
    required this.icon,
    required this.label,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(25)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 40,
            ),
            const SizedBox(width: 20),
            Text(
              label,
              style: const TextStyle(
                fontSize: 30.0,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
