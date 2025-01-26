import 'package:flutter/foundation.dart';
import 'package:social_project/models/data_model.dart';
import 'package:sqflite/sqflite.dart';

ValueNotifier<List<DataModel>> userListNotifier = ValueNotifier([]);
late Database _db;
Future<void> initializeDataBase() async {
  _db = await openDatabase(
    'user.db',
    version: 1,
    onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE user(id INTEGER PRIMARY KEY,name TEXT,age TEXT,c_no TEXT,dob TEXT,email TEXT)');
    },
  );
}

Future<void> addUser(DataModel value) async {
  // final userDB = await Hive.openBox<DataModel>("Userdb");
  // final _id = await userDB.add(value);
  // value.id = _id;
  final _id = await _db.rawInsert(
      'INSERT INTO user(name,age,c_no,dob,email) VALUES(?,?,?,?,?)',
      [value.name, value.age, value.c_no, value.dob, value.email]);
  value.id = _id;
  getAllUsers();
  //userListNotifier.value.add(value);
  //userListNotifier.notifyListeners();

  //print(value.toString());
}

Future<void> getAllUsers() async {
  // final userDB = await Hive.openBox<DataModel>("Userdb");

  final _values = await _db.rawQuery('SELECT * FROM user');
  print(_values);
  userListNotifier.value.clear();
  _values.forEach((map) {
    final user = DataModel.fromMap(map);
    userListNotifier.value.add(user);
  });

  //userListNotifier.value.addAll(userDB.values);
  userListNotifier.notifyListeners();
}

Future<void> deleteUser(int id) async {
  // final userDB = await Hive.openBox<DataModel>("Userdb");
  // await userDB.deleteAt(id);
  _db.rawDelete('DELETE FROM user WHERE id = ?', [id]);
  getAllUsers();
}
