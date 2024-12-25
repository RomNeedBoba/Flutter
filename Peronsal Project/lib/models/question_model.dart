class Question {
  final String question;
  final List<String> options;
  final String correctAnswer;

  const Question({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });

  bool isCorrect(String userAnswer) {
    return userAnswer == correctAnswer;
  }

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        question: json['question'] as String,
        options: json['options'].cast<String>(), // Cast to List<String>
        correctAnswer: json['correctAnswer'] as String,
      );
}
