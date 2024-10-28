import 'package:shajra_app/app/classes/person.dart';

class DeceasedPerson {
  String deceasedID;
  String fatherID;
  String motherID;
  String? spouseID;
  String? name;
  Gender gender;
  String? fatherName;
  String? motherName;
  MaritalStatus maritalStatus;
  int? brothers;
  int? sisters;
  int? sons;
  int? daughters;

  DeceasedPerson({
    required this.deceasedID,
    required this.fatherID,
    required this.motherID,
    required this.gender,
    required this.maritalStatus,
    this.spouseID,
    this.name,
    this.fatherName,
    this.motherName,
    this.brothers,
    this.sisters,
    this.sons,
    this.daughters,
  });
}


// DeceasedPerson({
  //   super.name,
  //   super.gender,
  //   super.fatherName,
  //   super.motherName,
  //   bool? isMarried,
  //   super.spouseName,
  //   super.relationOf,
  //   super.brothers,
  //   super.sisters,
  //   super.sons,
  //   super.daughters,
  //   super.isAlive = false,
  //   super.isDiedBefore,
  //   super.isDiedAfter,
  // }) : super(
  //         ismarried: isMarried,
  //       );