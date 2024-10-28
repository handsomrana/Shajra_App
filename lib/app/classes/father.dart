import 'package:shajra_app/app/classes/person.dart';

class FatherPerson {
  String personalID;
  Relation relationToDeceasedPerson;
  LifeStatus lifeStatus;
  String? wifeID;
  String? name;
  Gender gender;
  String? fatherName;
  String? motherName;
  String? noOfWifes;
  int? brothers;
  int? sisters;
  int? sons;
  int? daughters;

  FatherPerson({
    required this.personalID,
    this.relationToDeceasedPerson = Relation.father,
    this.lifeStatus = LifeStatus.alive,
    this.wifeID,
    this.name,
    this.gender = Gender.male,
    this.fatherName,
    this.motherName,
    this.noOfWifes,
    this.brothers,
    this.sisters,
    this.sons,
    this.daughters,
  });
}
