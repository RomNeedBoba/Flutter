import 'package:flutter/material.dart';
import 'model/quiz.dart';
import 'model/submission.dart';
import 'screens/welcome_screen.dart';
import 'screens/question_screen.dart';
import 'screens/result_screen.dart';

Color appColor = Colors.blue;

enum QuizState { notStarted, started, finished }

class QuizApp extends StatefulWidget {
  const QuizApp(this.quiz, {Key? key}) : super(key: key);

  final Quiz quiz;

  @override
  State<QuizApp> createState() => QuizAppState();
}

class QuizAppState extends State<QuizApp> {
  QuizState quizState = QuizState.notStarted;
  Submission submission = Submission();

  void startQuiz() {
    setState(() {
      quizState = QuizState.started;
    });
  }

  void finishQuiz() {
    setState(() {
      quizState = QuizState.finished;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen;

    if (quizState == QuizState.notStarted) {
      currentScreen = WelcomeScreen(
        onStart: startQuiz,
        quizTitle: widget.quiz.title,
      );
    } else if (quizState == QuizState.started) {
      currentScreen = QuestionScreen(
        onFinish: finishQuiz,
        quiz: widget.quiz,
        currentQuestionIndex: 0,
        submission: submission,
      );
    } else {
      currentScreen = ResultScreen(
        submission: submission,
        quiz: widget.quiz,
        onRestart: () {
          setState(() {
            quizState = QuizState.notStarted;
            submission.removeAnswers();
          });
        },
      );
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: appColor,
        body: Center(child: currentScreen),
      ),
    );
  }
}
