import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            const Expanded(child: ScoreCard(progressColor: Colors.green)),
            Expanded(child: ScoreCard(progressColor: Colors.green.shade300)),
            Expanded(child: ScoreCard(progressColor: Colors.green.shade800)),
          ],
        ),
      ),
    );
  }
}

class ScoreCard extends StatefulWidget {
  final Color progressColor;
  const ScoreCard({super.key, required this.progressColor});

  @override
  _ScoreCardState createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  double score = 0.5;

  void updateScore(double change) {
    setState(() {
      score = (score + change).clamp(0.0, 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green[50],
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'My Flutter Score',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: () => updateScore(-0.1),
                  color: Colors.red,
                ),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: () => updateScore(0.1),
                  color: Colors.blue,
                ),
              ],
            ),
            const SizedBox(height: 20),
            LinearProgressIndicator(
              value: score,
              color: widget.progressColor,
              backgroundColor: Colors.grey.shade300,
            ),
          ],
        ),
      ),
    );
  }
}
