// EX 1 – Manipulate Types

// Are you clear about strings, integer, list, map, set, objects in Dart?

// Examine the given data structures and write the inferred Dart type for each one (see example)

// Notes

// First find by yourself the type

// If you need, double check your answer with VSCode.

//Exercise 1

const studentGrades = {
  'Sokan': [90, 85, 88],
  'Sokea': [70, 80, 75],
  'Hay': [95, 92, 89],
};

// Answers
// Map<String, LList<int>>

// Exercise 2

const pizzaPrices = {
  'margherita': 5.5,
  'pepperoni': 7.5,
  'vegatarian': 6.5,
};

// Answers
// Map<String, double>

// Exercise 3

const books = [
  {'title': '1984', 'author': 'George Orwell'},
  {'title': 'Brave New World', 'author': 'Aldous Huxley'},
  {'title': 'Fahrenheit 451', 'author': 'Ray Bradbury'},
];

// Answers
// List<Map<String, String>>

// Exercise 4

const coordinates = [
  [1, 2],
  [3, 4],
  [5, 6],
];

// Answers
//List<list<string, string>>

// Exercise 5

const productDetails = {
  'id': 101,
  'name': 'Laptop',
  'price': 999.99,
  'inStock': true,
};

// Answers
//Map<string, dynamic >

// Exercise 6

const operations = [
  (int a, int b) => a + b,
  (int a, int b) => a - b,
  (int a, int b) => a * b,
];

// Answers
//List<int Function(int, int)>

// Exercise 7

const distances = {3.1, 5.5, 10.2, 7.8};

// Answers
// Set<double>

// Exercise 8

const university = {
  'departments': [
    {
      'name': 'Computer Science',
      'students': [
        {'name': 'Alice', 'age': 22},
        {'name': 'Bob', 'age': 24},
      ]
    },
    {
      'name': 'Mathematics',
      'students': [
        {'name': 'Charlie', 'age': 21},
        {'name': 'Dave', 'age': 23},
      ]
    }
  ]
};

// Answers
//Map<string ,<list<map<string,object>>>
