import 'package:shajra_app/app/classes/person.dart';

class ChachaPerson {
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

  ChachaPerson({
    required this.personalID,
    this.relationToDeceasedPerson = Relation.brotherOfFather,
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
