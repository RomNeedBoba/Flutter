// Instructions

// You are given a list of integers representing the scores of students in an exam.

// A score of 50 or higher is considered passing.

// Write a Dart program that filters and returns a list of students and the number of students who passed the exam.

// Constraints

// You must use the where function with a proper anonymous function to filter the original list

// More information here

// Examples

// INPUT

// [45, 78, 62, 49, 85, 33, 90, 50]

// OUTPUT

// [78, 62, 85, 90, 50]

// 5 students passed
void main() {
  List<int> scores = [45, 78, 62, 49, 85, 33, 90, 50];

  List<int> passingScores = scores.where((score) => score >= 50).toList();

  print(passingScores);

  print("${passingScores.length} students passed");
}

// The end
