import 'package:shajra_app/app/classes/person.dart';

class MotherPerson {
  String personalID;
  Relation relationToDeceasedPerson;
  LifeStatus lifeStatus;
  String? name;
  Gender gender;
  String? fatherName;
  String? motherName;
  int? brothers;
  int? sisters;
  int? sons;
  int? daughters;

  MotherPerson({
    required this.personalID,
    this.relationToDeceasedPerson = Relation.mother,
    this.lifeStatus = LifeStatus.alive,
    this.name,
    this.gender = Gender.female,
    this.fatherName,
    this.motherName,
    this.brothers,
    this.sisters,
    this.sons,
    this.daughters,
  });
}
