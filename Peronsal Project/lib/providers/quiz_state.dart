import 'package:flutter/foundation.dart';

class QuizState with ChangeNotifier {
  int _currentIndex = 0;
  int _score = 0;
  List<bool> _answerResults = [];

  int get currentIndex => _currentIndex;
  int get score => _score;
  List<bool> get answerResults => _answerResults;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void updateScore() {
    _score++;
    notifyListeners();
  }

  void addAnswerResult(bool isCorrect) {
    _answerResults.add(isCorrect);
    notifyListeners();
  }

  void reset() {
    _currentIndex = 0;
    _score = 0;
    _answerResults.clear();
    notifyListeners();
  }
}
