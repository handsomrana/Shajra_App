import 'package:shajra_app/app/classes/person.dart';

class HusbandPerson {
  String personalID;
  Relation relationToDeceasedPerson;
  LifeStatus lifeStatus;
  MaritalStatus maritalStatus;
  String? fatherID;
  String? motherID;
  Gender gender;
  String wifeID;
  String? name;
  String? noOfWifes;
  int? sons;
  int? daughters;

  HusbandPerson({
    required this.personalID,
    this.relationToDeceasedPerson = Relation.husband,
    this.lifeStatus = LifeStatus.alive,
    this.maritalStatus = MaritalStatus.married,
    this.gender = Gender.male,
    this.fatherID,
    this.motherID,
    required this.wifeID,
    this.name,
    this.noOfWifes,
    this.sons,
    this.daughters,
  });
}
