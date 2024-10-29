import 'package:shajra_app/app/classes/person.dart';

class BhatijiPerson {
  String personalID;
  Relation relationToDeceasedPerson;
  LifeStatus lifeStatus;
  MaritalStatus maritalStatus;
  String fatherID;
  String motherID;
  Gender gender;
  String? husbandID;
  String? name;
  int? sons;
  int? daughters;

  BhatijiPerson({
    required this.personalID,
    this.relationToDeceasedPerson = Relation.daughterOfBrother,
    this.lifeStatus = LifeStatus.alive,
    this.maritalStatus = MaritalStatus.unmarried,
    this.gender = Gender.female,
    required this.fatherID,
    required this.motherID,
    this.husbandID,
    this.name,
    this.sons,
    this.daughters,
  });
}
