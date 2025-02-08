//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';

// Future addUser(String name, String email, int phone, String dob, int age,
//     String CreatePass, String ConfirmPass) async {
//   try {
//     UserCredential userCredential =
//         await FirebaseAuth.instance.createUserWithEmailAndPassword(
//       email: email,
//       password: CreatePass,
//     );
//     await FirebaseFirestore.instance.collection('Users').add({
//       'Username': name,
//       'Email': email,
//       'phoneNo': phone,
//       'dob': dob,
//       'age': age,
//       'CreatePass': CreatePass,
//       'ConfirmPass': ConfirmPass,
//     });
//   } catch (e) {
//     print('Error: $e');
//   }
// }
