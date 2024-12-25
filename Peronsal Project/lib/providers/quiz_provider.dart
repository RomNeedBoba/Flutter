import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:async';

import '../models/question_model.dart';
import 'quiz_state.dart';

class QuizProvider with ChangeNotifier {
  List<Question> _questions = [];
  final QuizState _state = QuizState();
  int _timeRemaining = 60;
  Timer? _timer;
  bool _quizCompleted = false;
  bool _showCorrectAnswers = false;
  List<String> _userAnswers = [];

  List<Question> get questions => _questions;
  int get currentIndex => _state.currentIndex;
  int get score => _state.score;
  int get timeRemaining => _timeRemaining;
  bool get quizCompleted => _quizCompleted;
  bool get showCorrectAnswers => _showCorrectAnswers;
  List<bool> get answerResults => _state.answerResults;
  List<String> get userAnswers => _userAnswers;

  void setShowCorrectAnswers(bool value) {
    _showCorrectAnswers = value;
    notifyListeners();
  }

  Future<void> loadQuestions() async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/question.json');
      final List<dynamic> jsonList = json.decode(jsonString);
      _questions = jsonList.map((item) => Question.fromJson(item)).toList();
      notifyListeners();
    } catch (e) {
      print('Error loading questions: $e');
    }
  }

  void selectAnswer(String selectedAnswer) {
    if (_state.currentIndex < _questions.length) {
      bool isCorrect =
          selectedAnswer == _questions[_state.currentIndex].correctAnswer;
      _state.addAnswerResult(isCorrect);
      if (isCorrect) {
        _state.updateScore();
      }
      _state.setCurrentIndex(_state.currentIndex + 1);
      _userAnswers.add(selectedAnswer);

      if (_state.currentIndex >= _questions.length) {
        _quizCompleted = true;
        _timer?.cancel();
        _timeRemaining = 0;
      } else {
        _timeRemaining = 60;
        startTimer();
      }

      notifyListeners();
    }
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timeRemaining > 0) {
        _timeRemaining--;
        notifyListeners();
      } else {
        timer.cancel();
        _state.setCurrentIndex(_state.currentIndex + 1);
        if (_state.currentIndex >= _questions.length) {
          _quizCompleted = true;
        } else {
          _timeRemaining = 60;
          startTimer();
        }
        notifyListeners();
      }
    });
  }

  void resetQuiz() {
    _state.reset();
    _quizCompleted = false;
    _timeRemaining = 60;
    _showCorrectAnswers = false;
    _userAnswers = [];
    _timer?.cancel();
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
