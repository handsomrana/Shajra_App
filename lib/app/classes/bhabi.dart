import 'package:shajra_app/app/classes/person.dart';

class BhabiPerson {
  String personalID;
  Relation relationToDeceasedPerson;
  LifeStatus lifeStatus;
  MaritalStatus maritalStatus;
  String? fatherName;
  String? motherName;
  Gender gender;
  String husbandID;
  String? name;
  int? sons;
  int? daughters;

  BhabiPerson({
    required this.personalID,
    this.relationToDeceasedPerson = Relation.brotherWife,
    this.lifeStatus = LifeStatus.alive,
    this.maritalStatus = MaritalStatus.married,
    this.gender = Gender.female,
    this.fatherName,
    this.motherName,
    required this.husbandID,
    this.name,
    this.sons,
    this.daughters,
  });
}
