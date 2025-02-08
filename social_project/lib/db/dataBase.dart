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
          'CREATE TABLE user(id INTEGER PRIMARY KEY,name TEXT,gender TEXT,age TEXT,c_no TEXT,dob TEXT,email TEXT)');
    },
  );
}

Future<void> addUser(DataModel value) async {
  final _id = await _db.rawInsert(
      'INSERT INTO user(name,gender,age,c_no,dob,email) VALUES(?,?,?,?,?,?)', [
    value.name,
    value.gender,
    value.age,
    value.c_no,
    value.dob,
    value.email
  ]);
  value.id = _id;
  getAllUsers();
}

Future<void> getAllUsers() async {
  final _values = await _db.rawQuery('SELECT * FROM user');
  print(_values);
  userListNotifier.value.clear();
  for (var map in _values) {
    final user = DataModel.fromMap(map);
    userListNotifier.value.add(user);
  }
  userListNotifier.notifyListeners();
}

Future<void> deleteUser(int id) async {
  _db.rawDelete('DELETE FROM user WHERE id = ?', [id]);
  getAllUsers();
}

Future<DataModel?> getLastUser() async {
  final values =
      await _db.rawQuery('SELECT * FROM user ORDER BY id DESC LIMIT 1');
  if (values.isNotEmpty) {
    final user = DataModel.fromMap(values.first);
    return user;
  } else {
    return null;
  }
}
