bool isBalanced(String input) {
  Map<String, String> matchingBrackets = {')': '(', ']': '[', '}': '{'};

  List<String> stack = [];

  for (var char in input.split('')) {
    if (matchingBrackets.containsValue(char)) {
      stack.add(char);
    } else if (matchingBrackets.containsKey(char)) {
      if (stack.isEmpty || stack.removeLast() != matchingBrackets[char]) {
        return false;
      }
    }
  }

  return stack.isEmpty;
}

void main() {
  List<String> examples = ["{what is (42)}?", "[text}", "{[[(a)b]c]d}"];

  for (var example in examples) {
    if (isBalanced(example)) {
      print('Balanced');
    } else {
      print('Not balanced');
    }
  }
}
