import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../main.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<QuizProvider>(
          builder: (context, quizProvider, child) {
            final score = quizProvider.score;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your Score: $score / ${quizProvider.questions.length}',
                  style: const TextStyle(fontSize: 24.0),
                ),
                const SizedBox(height: 20),
                if (quizProvider.showCorrectAnswers)
                  Column(
                    children: [
                      const Text('Answer Results:'),
                      for (int i = 0; i < quizProvider.questions.length; i++)
                        Text(
                          'Question ${i + 1}: ${quizProvider.questions[i].isCorrect(quizProvider.userAnswers[i]) ? 'Correct' : 'Incorrect'}',
                        ),
                    ],
                  ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    quizProvider.resetQuiz();
                    quizProvider.loadQuestions();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyApp(),
                      ),
                      (route) => false,
                    );
                  },
                  child: const Text('Restart Quiz'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
