import 'package:flutter/foundation.dart';
import 'package:social_project/models/data_model.dart';
import 'package:sqflite/sqflite.dart';

//Customer tables and its functions

ValueNotifier<List<DataModel>> userListNotifier = ValueNotifier([]);
ValueNotifier<List<DataModel>> q3userListNotifier = ValueNotifier([]);
late Database _db;
Future<void> initializeDataBase() async {
  _db = await openDatabase(
    'user.db',
    version: 1,
    onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE user(id INTEGER PRIMARY KEY,name TEXT,gender TEXT,age TEXT,c_no TEXT,dob TEXT,email TEXT,location TEXT)');
    },
  );
}

Future<void> addUser(DataModel value) async {
  final _id = await _db.rawInsert(
      'INSERT INTO user(name,gender,age,c_no,dob,email,location) VALUES(?,?,?,?,?,?,?)',
      [
        value.name,
        value.gender,
        value.age,
        value.c_no,
        value.dob,
        value.email,
        value.location,
      ]);
  value.id = _id;
  getAllUsers();
}

Future<void> getAllUsers() async {
  final _values = await _db.rawQuery('SELECT * FROM user ORDER BY name');
  print(_values);
  userListNotifier.value.clear();
  for (var map in _values) {
    final user = DataModel.fromMap(map);
    userListNotifier.value.add(user);
  }
  userListNotifier.notifyListeners();
}

Future<void> getUserLocation(String location) async {
  final _values = await _db.rawQuery(
      'SELECT * FROM user WHERE LOWER(location) = LOWER(?)', [location]);
  print(_values);
  q3userListNotifier.value.clear();
  for (var map in _values) {
    final user = DataModel.fromMap(map);
    q3userListNotifier.value.add(user);
  }
  q3userListNotifier.notifyListeners();
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

//Service_provider table and its funcitons

ValueNotifier<List<Sprovider>> sproviderListNotifer = ValueNotifier([]);
late Database _spdb;
Future<void> initializeSPdatabase() async {
  _spdb = await openDatabase(
    'sp.db',
    version: 1,
    onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE Service_provider(p_id INTEGER PRIMARY KEY ,pname TEXT,plocation TEXT,pnumber TEXT)');
    },
  );
}

Future<void> addProvider(Sprovider value) async {
  final _pid = await _spdb.rawInsert(
      'INSERT INTO Service_provider(pname,plocation,pnumber) VALUES (?,?,?)', [
    value.pname,
    value.plocation,
    value.pnumber,
  ]);
  value.p_id = _pid;
  await getquestion1providers();
}

Future<void> getquestion1providers() async {
  final _values = await _spdb.rawQuery('SELECT * FROM Service_provider');

  sproviderListNotifer.value.clear();
  for (var map in _values) {
    final user = Sprovider.fromMap(map);
    sproviderListNotifer.value.add(user);
  }
  sproviderListNotifer.notifyListeners();
}

Future<void> deleteProvider(int id) async {
  await _spdb.rawDelete('DELETE FROM Service_provider WHERE p_id = ?', [id]);
  await getquestion1providers();
}
