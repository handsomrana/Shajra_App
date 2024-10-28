import 'package:shajra_app/app/classes/person.dart';

class MotherPerson {
  String personalID;
  Relation relationToDeceasedPerson;
  LifeStatus lifeStatus;
  String? name;
  String? gender;
  String? fatherName;
  String? motherName;
  String? noOfWifes;
  int? brothers;
  int? sisters;
  int? sons;
  int? daughters;

  MotherPerson({
    required this.personalID,
    this.relationToDeceasedPerson = Relation.mother,
    this.lifeStatus = LifeStatus.alive,
    this.name,
    this.gender,
    this.fatherName,
    this.motherName,
    this.noOfWifes,
    this.brothers,
    this.sisters,
    this.sons,
    this.daughters,
  });
}
