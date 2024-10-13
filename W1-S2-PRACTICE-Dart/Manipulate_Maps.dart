// Given the following map of pizza prices:

// const pizzaPrices = {

//   'margherita': 5.5,

//   'pepperoni': 7.5,

//   'vegetarian': 6.5,

// };

// Write a program to calculate the total for a given order.

// For example, given the following order:

// const order = ['margherita', 'pepperoni'];

// The program should print:

// Total: $13`

// If a pizza is not on the menu, the program should print:

// pineapple pizza is not on the menu

void main() {
  const Map<String, double> pizzaPrices = {
    'margherita': 5.5,
    'pepperoni': 7.5,
    'vegetarian': 6.5,
  };

  const List<String> order = ['margherita', 'pepperoni', 'pineapple'];

  double total = 0.0;

  for (var pizza in order) {
    if (pizzaPrices.containsKey(pizza)) {
      total += pizzaPrices[pizza]!;
    } else {
      print('$pizza pizza is not on the menu');
    }
  }

  if (total > 0) {
    print('Total: \$${total.toStringAsFixed(2)}');
  }
}
// The end