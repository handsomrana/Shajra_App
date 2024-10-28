class Relative {
  String relation;
  String name;
  String deathStatus;
  bool isMarried;
  String? spouseName; // New field for spouse name
  int sons;
  int daughters;

  Relative({
    required this.relation,
    this.name = '',
    this.deathStatus = 'Alive',
    this.isMarried = false,
    this.spouseName, // Optional field for spouse name
    this.sons = 0,
    this.daughters = 0,
  });

  // Getter to compute total children count
  int get childrenCount => sons + daughters;
}
