import 'package:flutter/material.dart';
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
          'CREATE TABLE customer(c_id INTEGER PRIMARY KEY AUTOINCREMENT,name VARCHAR(20) NOT NULL , c_no INTEGER NOT NULL,dob DATE,password VARCHAR(20) NOT NULL,age INTEGER,location VARCHAR(20) NOT NULL,email VARCHAR(20));');
    },
  );
}

Future<void> addUser(DataModel value) async {
  await _db.insert('customer', value.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
  await getAllCustomer(); 
}

Future<void> getAllCustomer() async {
  final List<Map<String, dynamic>> _values =
      await _db.rawQuery('SELECT * FROM customer');

  userListNotifier.value =
      _values.map((map) => DataModel.fromMap(map)).toList();
  print(_values);

  userListNotifier.notifyListeners();
}
