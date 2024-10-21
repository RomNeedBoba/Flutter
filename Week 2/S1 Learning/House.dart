class Tree {
  String type;
  double height;

  Tree(this.type, this.height);

  @override
  String toString() {
    return 'Tree(Type: $type, Height: $height m)';
  }
}

class Wall {
  String typeOfMaterial;
  String color;

  Wall(this.typeOfMaterial, this.color);

  @override
  String toString() {
    return 'Wall(Material: $typeOfMaterial, Color: $color)';
  }
}

class Door {
  String color;
  String position;
  bool isClosed;

  Door(this.color, this.position, this.isClosed);

  @override
  String toString() {
    return 'Door(Color: $color, Position: $position, Closed: ${isClosed ? "Yes" : "No"})';
  }
}

class Window {
  String type;
  String position;
  bool isClosed;

  Window(this.type, this.position, this.isClosed);

  @override
  String toString() {
    return 'Window(Type: $type, Position: $position, Closed: ${isClosed ? "Yes" : "No"})';
  }
}

class SwimmingPool {
  double width;
  double height;

  SwimmingPool(this.width, this.height);

  @override
  String toString() {
    return 'Swimming Pool(Width: $width m, Height: $height m)';
  }
}

class Garage {
  bool isOpen;
  bool isThereAnyCar;

  Garage(this.isOpen, this.isThereAnyCar);

  @override
  String toString() {
    return 'Garage(Open: ${isOpen ? "Yes" : "No"}, Car Present: ${isThereAnyCar ? "Yes" : "No"})';
  }
}

class Dog {
  String type;
  bool gender;

  Dog(this.type, this.gender);

  @override
  String toString() {
    return 'Dog(Type: $type, Gender: ${gender ? "Male" : "Female"})';
  }
}

class HousePhyrom {
  String address;
  List<Tree> trees;
  Wall wall;
  Door door;
  Window window;
  SwimmingPool swimmingPool;
  Garage garage;
  Dog dog;

  HousePhyrom(
    this.address,
    this.trees,
    this.wall,
    this.door,
    this.window,
    this.swimmingPool,
    this.garage,
    this.dog,
  );

  @override
  String toString() {
    return 'HousePhyrom:\n'
           ' Address: $address\n'
           ' Trees: ${trees.join(", ")}\n'
           ' Wall: $wall\n'
           ' Door: $door\n'
           ' Window: $window\n'
           ' Swimming Pool: $swimmingPool\n'
           ' Garage: $garage\n'
           ' Dog: $dog';
  }
}

class HouseRith {
  String address;
  List<Tree> trees;
  Wall wall;
  Door door;
  Window window;
  SwimmingPool swimmingPool;
  Garage garage;
  Dog dog;

  HouseRith(
    this.address,
    this.trees,
    this.wall,
    this.door,
    this.window,
    this.swimmingPool,
    this.garage,
    this.dog,
  );

  @override
  String toString() {
    return 'HouseRith:\n'
           ' Address: $address\n'
           ' Trees: ${trees.join(", ")}\n'
           ' Wall: $wall\n'
           ' Door: $door\n'
           ' Window: $window\n'
           ' Swimming Pool: $swimmingPool\n'
           ' Garage: $garage\n'
           ' Dog: $dog';
  }
}

void main() {
  HousePhyrom housePhyrom = HousePhyrom(
    "168 Phnom Penh",
    [Tree("Red wood", 5.0), Tree("Derm Doung", 6.0)],
    Wall("Brick", "Black"),
    Door("Black", "Front", true),
    Window("Sliding", "Left", true),
    SwimmingPool(10.0, 5.0),
    Garage(false, true),
    Dog("Heng Pitbul khmer", true),
  );

  HouseRith houseRith = HouseRith(
    "101 Phnom Penh",
    [Tree("Jek jvea", 5.0), Tree("Jek jvea", 6.0)],
    Wall("Lego", "Rainbow"),
    Door("Black", "Front", true),
    Window("Sliding", "Left", true),
    SwimmingPool(1.0, 3.0),
    Garage(false, true),
    Dog("Heng Pitbul khmer", true),
  );

  print(houseRith);
  print(housePhyrom);
}
