import 'package:shajra_app/app/classes/person.dart';

class BrotherPerson {
  String personalID;
  Relation relationToDeceasedPerson;
  LifeStatus lifeStatus;
  MaritalStatus maritalStatus;
  String fatherID;
  String motherID;
  Gender gender;
  String? wifeID;
  String? name;
  String? noOfWifes;
  int? sons;
  int? daughters;

  BrotherPerson({
    required this.personalID,
    this.relationToDeceasedPerson = Relation.brother,
    this.lifeStatus = LifeStatus.alive,
    this.maritalStatus = MaritalStatus.unmarried,
    this.gender = Gender.male,
    required this.fatherID,
    required this.motherID,
    this.wifeID,
    this.name,
    this.noOfWifes,
    this.sons,
    this.daughters,
  });
}
