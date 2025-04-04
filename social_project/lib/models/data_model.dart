import 'package:hive/hive.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class DataModel {
  @HiveField(0)
  int? id;
  @HiveField(1) // Nullable for auto-incrementing ID
  final String name;
  //final String c_no;
  //final String dob;
  //final String password;
  @HiveField(2)
  final String age;
  //final String location;
  //final String email;

  DataModel({
    
    required this.name,
    // required this.c_no,
    // required this.dob,
    // required this.password,
    required this.age,
    //required this.location,
    //required this.email,
    this.id
  });
}

  // Convert object to Map (for database insertion)
  // Map<String, dynamic> toMap() {
  //   return {
  //     'c_id': c_id,
  //     'name': name,
  //     'c_no': c_no,
  //     'dob': dob,
  //     'password': password,
  //     'age': age,
  //     'location': location,
  //     'email': email,
  //   };
  // }

  // Convert database Map into a DataModel object
//   factory DataModel.fromMap(Map<String, dynamic> map) {
//     return DataModel(
//       c_id: map['c_id'], // Auto-generated by SQLite
//       name: map['name'],
//       c_no: map['c_no'],
//       dob: map['dob'],
//       password: map['password'],
//       age: map['age'],
//       location: map['location'],
//       email: map['email'],
//     );
//   }
// }
