enum Relation {
  brother,
  sister,
  son,
  daughter,
  wife,
  husband,
  father,
  mother,
  brotherOfFather,
  sisterOfFather,
  brotherOfMother,
  sisterOfMother,
  brotherWife,
  sisterHusband,
  sonOfBrother,
  daughterOfBrother,
  sonOfSister,
  daughterOfSister,
  sonsWife,
  daughtersHusband,
  sonOfSon,
  daughterOfSon,
  sonOfDaughter,
  daughterOfDaughter,
  wifeOfChacha,
  sonOfchacha,
  daughterOfchacha,
  husbandOfPhopi,
  sonOfPhopi,
  daughterOfPhopi,
  wifeOfMamu,
  sonOfMamu,
  daughterOfMamu,
  husbandOfKhala,
  sonOfKhala,
  daughterOfKhala,
}

enum LifeStatus {
  alive,
  diedBefore,
  diedAfter,
}

enum Gender {
  male,
  female,
}

enum MaritalStatus {
  married,
  unmarried,
}

abstract class Person {
  String? name;
  String? gender;
  String? fatherName;
  String? motherName;
  bool? ismarried;
  String? spouseName;
  String? relationOf;
  int? brothers;
  int? sisters;
  int? sons;
  int? daughters;
  bool? isAlive;
  bool? isDiedBefore;
  bool? isDiedAfter;

  Person({
    this.name,
    this.gender,
    this.fatherName,
    this.motherName,
    this.ismarried,
    this.spouseName,
    this.relationOf,
    this.brothers,
    this.sisters,
    this.sons,
    this.daughters,
    this.isAlive,
    this.isDiedBefore,
    this.isDiedAfter,
  });
}
