import 'package:get/get.dart';
import 'package:shajra_app/app/classes/deceased_person.dart';
import 'package:shajra_app/app/classes/person.dart';
import '../models/relative_model.dart';

class InheritanceController extends GetxController {
  // Existing data for deceased person
  final deceasedPersonName = "".obs;
  final deceasedPersonPersonalID = "001".obs;
  Gender deceasedPersonGender = Gender.male;
  final deceasedPersonFatherID = "002".obs;
  final deceasedPersonMotherID = "003".obs;
  final deceasedPersonSpouseID = "".obs;
  final deceasedPersonFatherName = "".obs;
  final deceasedPersonMotherName = "".obs;
  MaritalStatus deceasedPersonMaritalStatus = MaritalStatus.married;
  final deceasedPersonBrothers = 0.obs;
  final deceasedPersonSisters = 0.obs;
  final deceasedPersonSons = 0.obs;
  final deceasedPersonDaughters = 0.obs;

  DeceasedPerson? deceasedPerson;

  var relatives = <Relative>[].obs;

  var fatherAliveStatus = 'Alive'.obs;
  var motherAliveStatus = 'Alive'.obs;

  void generateRelativeForms() {
    relatives.clear();

    // Add brothers
    for (int i = 0; i < deceasedPersonBrothers.value; i++) {
      relatives.add(Relative(
        // name: '',
        relation: 'Brother',
        // deathStatus: 'Alive',
        // isMarried: false,
        // sons: 0,
        // daughters: 0,
      ));
    }

    // Add sisters
    for (int i = 0; i < deceasedPersonSisters.value; i++) {
      relatives.add(Relative(
        // name: '',
        relation: 'Sister',
        // deathStatus: 'Alive',
        // isMarried: false,
        // sons: 0,
        // daughters: 0,
      ));
    }

    // Add spouse if married
    if (deceasedPersonMaritalStatus == MaritalStatus.married) {
      relatives.add(Relative(
        // name: '',
        relation:
            deceasedPersonGender.toString() == 'male' ? 'Wife' : 'Husband',
        // deathStatus: 'Alive',
        isMarried: false,
        sons: deceasedPersonSons.value,
        daughters: deceasedPersonDaughters.value,
      ));
    }

    // Add children if they exist
    for (int i = 0; i < deceasedPersonSons.value; i++) {
      relatives.add(Relative(
        // name: '',
        relation: 'Son',
        // deathStatus: 'Alive',
        // isMarried: false,
        // sons: 0,
        // daughters: 0,
      ));
    }

    for (int i = 0; i < deceasedPersonDaughters.value; i++) {
      relatives.add(Relative(
        // name: '',
        relation: 'Daughter',
        // deathStatus: 'Alive',
        // isMarried: false,
        // sons: 0,
        // daughters: 0,
      ));
    }
  }

  void onSubmitData() {
    final deadPerson = DeceasedPerson(
      deceasedID: deceasedPersonPersonalID.value,
      fatherID: deceasedPersonFatherID.value,
      motherID: deceasedPersonMotherID.value,
      spouseID: deceasedPersonSpouseID.value,
      name: deceasedPersonName.value,
      gender: deceasedPersonGender,
      fatherName: deceasedPersonFatherName.value,
      motherName: deceasedPersonMotherName.value,
      maritalStatus: deceasedPersonMaritalStatus,
      brothers: deceasedPersonBrothers.value,
      sisters: deceasedPersonSisters.value,
      sons: deceasedPersonSons.value,
      daughters: deceasedPersonDaughters.value,
    );
    deceasedPerson = deadPerson;
  }

  void updateState() {
    update();
  }
}
