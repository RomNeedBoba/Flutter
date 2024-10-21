enum Direction { UP, RIGHT, DOWN, LEFT }

class Robot {
  int x, y;
  Direction direction;

  Robot(this.x, this.y, this.direction);

  void goRight() {
    direction = Direction.values[(direction.index + 1) % 4];
  }

  void goLeft() {
    direction = Direction.values[(direction.index + 3) % 4];
  }

  void moveForward() {
    if (direction == Direction.UP) {
      y += 1;
    } else if (direction == Direction.RIGHT) {
      x += 1;
    } else if (direction == Direction.DOWN) {
      y -= 1;
    } else if (direction == Direction.LEFT) {
      x -= 1;
    }
  }

  void followInstructions(String stuffToDo) {
    for (int i = 0; i < stuffToDo.length; i++) {
      var command = stuffToDo[i];
      if (command == 'R') {
        goRight();
      } else if (command == 'L') {
        goLeft();
      } else if (command == 'A') {
        moveForward();
      }
    }
  }

  @override
  String toString() {
    return 'Robot is at ($x, $y) and looking $direction';
  }
}

void main() {
  Robot myBot = Robot(4, 1, Direction.UP);
  String whatToDo = "AARAAARALA";
  myBot.followInstructions(whatToDo);

  print(myBot);
}
