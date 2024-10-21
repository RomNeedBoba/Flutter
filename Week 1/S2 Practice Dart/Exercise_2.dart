// In this exercise, you need to decide which variable can be declared as const or final.  

// 1 startText
String iLike = 'I like pizza';

// 2 toppings
String topping = 'with tomatoes';

/// 3 message
String message = '$iLike $topping';

// 4 rbgColors
List<String> rbgColors = ['red', 'blue', 'green'];
print(rbgColors);

// 5 weekDays
List<String> weekDays = ['Monday', 'Tuesday', 'Wednesday'];
weekDays.add('Thursday');
print(weekDays);

// 6 scores
List<int> scores = [45,35,50];
scores = [40, 35, 50, 78];
print(score);

// Answers

// 1 iLikes Const - Because this variablle never change
// 2 topping Var - This variable might change to different toppings
// 3 Message Final - Computed once at runtime and doesn’t change after that.
// 4 rbgColors Final - The list itself doesn’t change
// 5 weekDays Final - he list reference doesn’t change, but contents can be modified.
// 6 Var - The llist is assign again with new values
