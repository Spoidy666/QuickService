class DataModel {
  int? id;

  final String name;
  final String c_no;
  final String gender;
  final String dob;
  final String age;
  final String email;

  DataModel(
      {required this.name,
      required this.c_no,
      required this.gender,
      required this.dob,
      required this.age,
      required this.email,
      this.id});
  static DataModel fromMap(Map<String, Object?> map) {
    final id = map['id'] as int;
    final name = map['name'] as String;
    final gender = map['gender'] as String;
    final age = map['age'] as String;
    final dob = map['dob'] as String;
    final phone = map['c_no'] as String;
    final email = map['email'] as String;

    return DataModel(
        id: id,
        name: name,
        gender: gender,
        age: age,
        c_no: phone,
        dob: dob,
        email: email);
  }
}
