import 'package:flutter/material.dart';
import '../model/quiz.dart';
import '../model/submission.dart';

class ResultScreen extends StatelessWidget {
  final Submission submission;
  final Quiz quiz;
  final VoidCallback onRestart;

  const ResultScreen({
    Key? key,
    required this.submission,
    required this.quiz,
    required this.onRestart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int correctAnswers = submission.getScore();

    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Quiz Finished!",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'You answered $correctAnswers out of ${quiz.questions.length} correctly.',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: quiz.questions.length,
                itemBuilder: (context, index) {
                  var question = quiz.questions[index];
                  var userAnswer = submission.getAnswerFor(question)?.questionAnswer ?? '';
                  var isCorrect = userAnswer == question.goodAnswer;

                  return Card(
                    color: isCorrect ? Colors.yellow.shade100 : Colors.red.shade100,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${index + 1}. ${question.title}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          ...question.possibleAnswers.map((answer) {
                            var isCorrectAnswer = answer == question.goodAnswer;
                            var isSelected = answer == userAnswer;

                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              child: Row(
                                children: [
                                  if (isCorrectAnswer)
                                    Icon(Icons.check, color: Colors.green, size: 16),
                                  SizedBox(width: 5),
                                  Text(
                                    answer,
                                    style: TextStyle(
                                      color: isSelected
                                          ? (isCorrectAnswer ? Colors.green : Colors.red)
                                          : Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: onRestart,
              child: Text("Restart Quiz"),
            ),
          ],
        ),
      ),
    );
  }
}
