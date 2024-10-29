import 'package:shajra_app/app/classes/person.dart';

class WifePerson {
  String personalID;
  Relation relationToDeceasedPerson;
  LifeStatus lifeStatus;
  MaritalStatus maritalStatus;
  String? fatherID;
  String? motherID;
  Gender gender;
  String husbandID;
  String? name;
  int? sons;
  int? daughters;

  WifePerson({
    required this.personalID,
    this.relationToDeceasedPerson = Relation.wife,
    this.lifeStatus = LifeStatus.alive,
    this.maritalStatus = MaritalStatus.married,
    this.gender = Gender.female,
    this.fatherID,
    this.motherID,
    required this.husbandID,
    this.name,
    this.sons,
    this.daughters,
  });
}
