
import 'dart:io';//allows for input/output operations
import 'package:collection/collection.dart';//allows ListEquality to work probably

//abstract class
abstract class Question {

  String title;
  List<String> options;

  Question(this.title, this.options);

  bool checkAnswer(List<int> selectedOptions); // abstract method

}

//single choice class
class SingleChoiceQuestion extends Question {

  int correctAnswer;

  SingleChoiceQuestion(String title, List<String> options, this.correctAnswer)
      : super(title, options);

  @override
  bool checkAnswer(List<int> selectedOptions){
     //checkAns_overrides the abstract method
    return selectedOptions.length == 1 && selectedOptions[0] == correctAnswer;

  }

}

//Multiple question class
class MultipleChoiceQuestion extends Question {
  List<int> correctAnswers;

  MultipleChoiceQuestion(String title, List<String> options, this.correctAnswers)
      : super(title, options);

  @override
  bool checkAnswer(List<int> selectedOptions) { //the checkAns_ uses ListEquality().equals to compare selectedOptions to correctAnswers.
    return ListEquality().equals(selectedOptions, correctAnswers);
  }
}

class Quiz {
  List<Question> questions;

  Quiz(this.questions);

  int calculateScore(List<List<int>> participantAnswers) {
    int score = 0;
    for (int i = 0; i < questions.length; i++) {
      if (questions[i].checkAnswer(participantAnswers[i])) {
        score++;
      }
    }
    return score;
  }
}

class Participant {

  String firstName;
  String lastName;
  int score;

  Participant(this.firstName, this.lastName, this.score);
  
}

void main() {
  // Define questions for the quiz
  List<Question> questions = [
    SingleChoiceQuestion(
      "What is the capital city of Cambodia?",
      ["Phnom penh", "Bangkok", "Hanoi", "Vientiane"],
      0,
    ),
    MultipleChoiceQuestion(
      "Which of these are smart phones brand?",
      ["Apple", "Lockheed Martin", "Samsung", "Boeing"],
      [0, 2],
    ),
    SingleChoiceQuestion(
      "What is 2 + 2?",
      ["3", "4", "5", "6"],
      1,
    ),
    MultipleChoiceQuestion(
      "Which animals are not meant to be pet",
      ["Tiger", "Lion", "Cat", "Shark"],
      [0, 1, 3],
    ),
    SingleChoiceQuestion(
      "What is the color of the sea?",
      ["Blue", "Green", "Red", "Yellow"],
      0,
    ),
  ];

  Quiz quiz = Quiz(questions);

  // Input for participant details
  print("Enter your first name:");
  String? firstName = stdin.readLineSync();
  print("Enter your last name:");
  String? lastName = stdin.readLineSync();

  List<List<int>> participantAnswers = [];

  // Display questions and capture answers
  //this part is Ai help
  for (var i = 0; i < quiz.questions.length; i++) {
    var question = quiz.questions[i];
    print("\nQuestion ${i + 1}: ${question.title}");
    for (var j = 0; j < question.options.length; j++) {
      print("${j + 1}. ${question.options[j]}");
    }

    if (question is SingleChoiceQuestion) {
      print("Select one answer (enter the option number): ");
      int answer = int.parse(stdin.readLineSync()!) - 1;
      participantAnswers.add([answer]);
    } else if (question is MultipleChoiceQuestion) {
      print("Select multiple answers (enter option numbers separated by spaces): ");
      List<int> answers = stdin
          .readLineSync()!
          .split(' ')
          .map((e) => int.parse(e) - 1)
          .toList();
      participantAnswers.add(answers);
    }
  }

  // Calculate score and display result
  int score = quiz.calculateScore(participantAnswers);
  Participant participant = Participant(firstName!, lastName!, score);
  print("\n${participant.firstName} ${participant.lastName}, your score is: ${participant.score}/${questions.length}");
}
