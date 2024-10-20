enum Skill { FLUTTER, DART, OTHER }

class Address {
  String street;
  String city;
  String zipCode;
  Address(this.street, this.city, this.zipCode);
}
class Employee {
  String _name;
  double _baseSalary;
  List<Skill> _skills;
  Address _address;
  int _yearsOfExperience;

  Employee(this._name, this._baseSalary, this._skills, this._address,
      this._yearsOfExperience);
  Employee.mobileDeveloper(
      String name, double baseSalary, Address address, int yearsOfExperience)
      : this(name, baseSalary, [Skill.FLUTTER, Skill.DART], address,
            yearsOfExperience);
  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;

  double computeSalary() {
    double totalSalary = _baseSalary + (_yearsOfExperience * 2000);

    for (var skill in _skills) {
      switch (skill) {
        case Skill.FLUTTER:
          totalSalary += 5000;
          break;
        case Skill.DART:
          totalSalary += 3000;
          break;
        case Skill.OTHER:
          totalSalary += 1000;
          break;
      }
    }
    return totalSalary;
  }

  void printDetails() {
    print('Employee: $_name, Base Salary: \$${_baseSalary}');
    print('Address: ${_address.street}, ${_address.city}, ${_address.zipCode}');
    print('Years of Experience: $_yearsOfExperience');
    print(
        'Skills: ${_skills.map((s) => s.toString().split('.').last).join(', ')}');
    print('Computed Salary: \$${computeSalary()}');
  } } 
void main() {
  var address1 = Address('172 ', 'Phnom Penh', '12345');
  var emp1 =
      Employee('Sokea', 40000, [Skill.FLUTTER, Skill.OTHER], address1, 5);
  emp1.printDetails();
  var address2 = Address('168 pubstreet', 'Siem Reap', '67890');
  var emp2 = Employee.mobileDeveloper('Ronan', 45000, address2, 3);
  emp2.printDetails();
}
