import 'person.dart';

class BrotherPerson extends Person {
  BrotherPerson({
    super.name,
    super.gender = 'Male',
    super.fatherName,
    super.motherName,
    bool? isMarried,
    super.spouseName,
    super.brothers,
    super.sisters,
    super.sons,
    super.daughters,
    super.isAlive,
    super.isDiedBefore,
    super.isDiedAfter,
  }) : super(
          ismarried: isMarried,
        );
}
