// Model for Deceased Person
class DeceasedPerson {
  String name;
  String gender;
  String fatherName;
  String motherName;
  String maritalStatus; // Married or Single
  int brothers;
  int sisters;
  int sons;
  int daughters;

  DeceasedPerson({
    required this.name,
    required this.gender,
    required this.fatherName,
    required this.motherName,
    required this.maritalStatus,
    required this.brothers,
    required this.sisters,
    required this.sons,
    required this.daughters,
  });
}
