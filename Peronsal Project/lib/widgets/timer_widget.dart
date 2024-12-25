import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';

class TimerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<QuizProvider>(
      builder: (context, quizProvider, child) {
        return Text(
          'Time: ${quizProvider.timeRemaining}',
          style: TextStyle(fontSize: 18.0),
        );
      },
    );
  }
}
