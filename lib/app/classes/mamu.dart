import 'package:shajra_app/app/classes/person.dart';

class MamuPerson {
  String personalID;
  Relation relationToDeceasedPerson;
  LifeStatus lifeStatus;
  MaritalStatus maritalStatus;
  String? fatherID;
  String? motherID;
  Gender gender;
  String? wifeID;
  String? name;
  String? noOfWifes;
  int? sons;
  int? daughters;

  MamuPerson({
    required this.personalID,
    this.relationToDeceasedPerson = Relation.brotherOfMother,
    this.lifeStatus = LifeStatus.alive,
    this.maritalStatus = MaritalStatus.unmarried,
    this.gender = Gender.male,
    this.fatherID,
    this.motherID,
    this.wifeID,
    this.name,
    this.noOfWifes,
    this.sons,
    this.daughters,
  });
}
