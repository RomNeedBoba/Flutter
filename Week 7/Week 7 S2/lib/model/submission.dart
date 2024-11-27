import 'quiz.dart';

class Answer {
  String questionAnswer;
  Question question;


  Answer({required this.questionAnswer, required this.question});
  bool isCorrect() {
    return questionAnswer == question.goodAnswer;
  }
}

class Submission {
  Map<Question, String> answers = {};
  void addAnswer(Question question, String answer) {
    answers[question] = answer;  }

  void removeAnswers() {
    answers = {};
}

  int getScore() {
    int score = 0;
    for (var question in answers.keys) {
      if (answers[question] == question.goodAnswer) {
        score++;
      }
    }
    return score;
  }

  
  Answer? getAnswerFor(Question question) {
    if (answers.containsKey(question)) {
      return Answer(questionAnswer: answers[question]!, question: question);
    }
    return null;
  }
}
