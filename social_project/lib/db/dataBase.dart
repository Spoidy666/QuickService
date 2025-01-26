import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:social_project/models/data_model.dart';

ValueNotifier<List<DataModel>> userListNotifier = ValueNotifier([]);

Future<void> addUser(DataModel value) async {
  final userDB = await Hive.openBox<DataModel>("Userdb");
  final _id = await userDB.add(value);
  value.id = _id;
  userListNotifier.value.add(value);
  

  //print(value.toString());
}

Future<void> getAllUsers() async {
  final userDB = await Hive.openBox<DataModel>("Userdb");

  userListNotifier.value.clear();
  userListNotifier.value.addAll(userDB.values);
  userListNotifier.notifyListeners();
}

Future<void> deleteUser(int id) async {
  final userDB = await Hive.openBox<DataModel>("Userdb");
  await userDB.deleteAt(id);
  getAllUsers();
}
