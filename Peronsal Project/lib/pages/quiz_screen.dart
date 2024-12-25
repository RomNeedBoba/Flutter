import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../widgets/timer_widget.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late final QuizProvider _quizProvider;

  @override
  void initState() {
    super.initState();
    _quizProvider = Provider.of<QuizProvider>(context, listen: false);
    _quizProvider.loadQuestions();
    _quizProvider.startTimer();
  }

  @override
  void dispose() {
    _quizProvider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Japanese Quiz'),
      ),
      body: Center(
        child: Consumer<QuizProvider>(
          builder: (context, quizProvider, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Text(
                  '${quizProvider.currentIndex + 1}/${quizProvider.questions.length}',
                  style: const TextStyle(fontSize: 18.0),
                ),
                const SizedBox(height: 10),
                Text(
                  quizProvider.questions[quizProvider.currentIndex].question,
                  style: const TextStyle(fontSize: 24.0),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                TimerWidget(),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: quizProvider
                        .questions[quizProvider.currentIndex].options
                        .map((option) => ElevatedButton(
                              onPressed: () {
                                quizProvider.selectAnswer(option);
                                if (quizProvider.quizCompleted) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ResultScreen(),
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                padding: const EdgeInsets.all(20.0),
                                minimumSize: const Size(150, 60),
                              ),
                              child: Text(
                                option,
                                style: const TextStyle(fontSize: 18.0),
                              ),
                            ))
                        .toList(),
                  ),
                ),
                if (quizProvider.quizCompleted)
                  ElevatedButton(
                    onPressed: () {
                      quizProvider.setShowCorrectAnswers(true);
                    },
                    child: const Text('Show Correct Answers'),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
