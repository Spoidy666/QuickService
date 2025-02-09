class DataModel {
  int? id;

  final String name;
  final String c_no;
  final String gender;
  final String dob;
  final String age;
  final String email;
  final String location;

  DataModel(
      {required this.name,
      required this.c_no,
      required this.gender,
      required this.dob,
      required this.age,
      required this.email,
      required this.location,
      this.id});
  static DataModel fromMap(Map<String, Object?> map) {
    final id = map['id'] as int;
    final name = map['name'] as String;
    final gender = map['gender'] as String;
    final age = map['age'] as String;
    final dob = map['dob'] as String;
    final phone = map['c_no'] as String;
    final email = map['email'] as String;
    final location=map['location'] as String;
    return DataModel(
        id: id,
        name: name,
        gender: gender,
        age: age,
        c_no: phone,
        dob: dob,
        email: email,
        location: location);
  }
}

class Sprovider {
  int? p_id;
  final String pname;
  final String plocation;
  final String pnumber;
  Sprovider(
      {required this.pname,
      required this.plocation,
      required this.pnumber,
      this.p_id});
  static Sprovider fromMap(Map<String, Object?> map) {
    final p_id = map['p_id'] as int;
    final name = map['pname'] as String;

    final phone = map['pnumber'] as String;
    final location = map['plocation'] as String;

    return Sprovider(
        p_id: p_id, pname: name, pnumber: phone, plocation: location);
  }
}
