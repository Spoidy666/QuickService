import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_project/models/data_model.dart';
import 'package:social_project/pages/home/services.dart';
import 'package:sqflite/sqflite.dart';

//Customer tables and its functions
int? icost;
ValueNotifier<List<DataModel>> userListNotifier = ValueNotifier([]);
ValueNotifier<List<DataModel>> q3userListNotifier = ValueNotifier([]);

late Database _db;
Future<void> initializeDataBase() async {
  String dbPath = await getDatabasesPath();
  String path = join(dbPath, 'user1.db');

  _db = await openDatabase(
    path,
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
  saveId(_id);
  getAllUsers();
}

Future<void> saveId(int id) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setInt('id', id);
}

Future<void> getAllUsers() async {
  final _values =
      await _db.rawQuery('SELECT * FROM user ORDER BY name COLLATE NOCASE');
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
  await _db.rawDelete('DELETE FROM user WHERE id = ?', [id]);
  await _spdb.rawDelete('DELETE FROM Admin Where user_id =?', [id]);
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

ValueNotifier<List<Sprovider>> sproviderListNotifer = ValueNotifier([]);
ValueNotifier<List<Sprovider>> UniqueListNotifier = ValueNotifier([]);
late Database _spdb;
Future<void> initializeSPdatabase() async {
  String dbPath = await getDatabasesPath();
  String path = join(dbPath, 'sp1.db');
  _spdb = await openDatabase(
    path,
    version: 1,
    onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE Service_provider(p_id INTEGER PRIMARY KEY ,pname TEXT,plocation TEXT,pnumber TEXT,service TEXT)');
      await db.execute('''CREATE TABLE Services(s_id INTEGER PRIMARY KEY,
          sname TEXT,
          stype TEXT,icost TEXT,
          cph TEXT,provider_id INTEGER,
          FOREIGN KEY (provider_id) REFERENCES Service_provider (p_id) ON DELETE CASCADE)''');
      await db.execute('''CREATE TABLE Admin(
  admin_id INTEGER PRIMARY KEY,
  user_id INTEGER,
  service_id INTEGER,
  provider_id INTEGER,
  service_date TEXT,
  cost REAL,
  appointment_date TEXT,
  notes TEXT,
  FOREIGN KEY (user_id) REFERENCES user(id),
  FOREIGN KEY (service_id) REFERENCES Services(s_id) on DELETE CASCADE,
  FOREIGN KEY (provider_id) REFERENCES Service_provider(p_id) ON DELETE CASCADE
)
''');
      await db.execute('''
CREATE TRIGGER prevent_duplicate_provider_number
BEFORE INSERT ON Service_provider
WHEN EXISTS (
  SELECT 1 FROM Service_provider WHERE pnumber = NEW.pnumber
)
BEGIN
  SELECT RAISE(FAIL, 'Phone number already exists for another provider');
END;
''');
      await db.execute('''
CREATE TRIGGER autofill_notes_if_empty
AFTER INSERT ON Admin
WHEN NEW.notes IS NULL OR LENGTH(NEW.notes) = 0
BEGIN
  UPDATE Admin
  SET notes = 'No special instructions'
  WHERE admin_id = NEW.admin_id;
END;
''');
    },
  );
}

Future<int> addProvider(Sprovider value, context) async {
  try {
    final _pid = await _spdb.rawInsert(
        'INSERT INTO Service_provider(pname,plocation,pnumber,service) VALUES (?,?,?,?)',
        [value.pname, value.plocation, value.pnumber, value.service]);
    value.p_id = _pid;
    await getquestion1providers();
    return _pid;
  } catch (e) {
    snack(context, 'Phone number already exist ');
    return -1;
  }
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

Future<void> uniqueService() async {
  final _values =
      await _spdb.rawQuery('SELECT Distinct(service) FROM Service_provider');

  sproviderListNotifer.value.clear();
  for (var map in _values) {
    final user = Sprovider.fromMap(map);
    sproviderListNotifer.value.add(user);
  }
  UniqueListNotifier.notifyListeners();
}

Future<void> deleteProvider(int id) async {
  await _spdb.rawDelete('DELETE FROM Service_provider WHERE p_id = ?', [id]);
  await _spdb.rawDelete('DELETE FROM Services WHERE provider_id = ?', [id]);
  await _spdb.rawDelete('DELETE FROM Admin WHERE provider_id=?', [id]);
  await getquestion1providers();
}

ValueNotifier<List<Service>> serviceListNotifier = ValueNotifier([]);

Future<void> getAllServices() async {
  final _values = await _spdb.rawQuery('SELECT * FROM Services');

  serviceListNotifier.value.clear();
  for (var map in _values) {
    final service = Service.fromMap(map);
    serviceListNotifier.value.add(service);
  }
  serviceListNotifier.notifyListeners();
}

Future<void> addService(Service service) async {
  await _spdb.rawInsert(
    'INSERT INTO Services (sname, stype, icost, cph, provider_id) VALUES (?, ?, ?, ?, ?)',
    [
      service.sname,
      service.stype,
      service.icost,
      service.cph,
      service.providerId
    ],
  );
}

Future<List<Service>> getServicesByProvider(int providerId) async {
  final List<Map<String, dynamic>> serviceMaps = await _spdb.rawQuery(
    'SELECT * FROM Services WHERE provider_id = ?',
    [providerId],
  );

  return serviceMaps.map((map) => Service.fromMap(map)).toList();
}

Future<void> insertIntoAdminTable({
  required int userId,
  required int serviceId,
  required int providerId,
  required String serviceDate,
  required double cost,
  required String appointmentDate,
  required String notes,
}) async {
  await _spdb.rawInsert(
    'INSERT INTO Admin(user_id, service_id, provider_id, service_date, cost, appointment_date, notes) VALUES (?, ?, ?, ?, ?, ?, ?)',
    [userId, serviceId, providerId, serviceDate, cost, appointmentDate, notes],
  );
}

Future<List<Map<String, dynamic>>> getUserHistory(int userId) async {
  final db = await initializeDataBase();
  return await _spdb.rawQuery('''
    SELECT a.*, s.sname, p.pname,s.stype,plocation,pnumber 
    FROM Admin a
    JOIN Services s ON a.service_id = s.s_id
    JOIN Service_provider p ON a.provider_id = p.p_id
    WHERE a.user_id = ?
    ORDER BY a.service_date DESC 
  ''', [userId]);
}

ValueNotifier<List<Admin>> q4userListNotifier = ValueNotifier([]);
Future<void> getcustomerPlumber() async {
  final _values = await _spdb.rawQuery('''
    SELECT a.*, s.sname, s.stype, p.pname 
    FROM Admin a
    JOIN Services s ON a.service_id = s.s_id
    JOIN Service_provider p ON a.provider_id = p.p_id
    WHERE LOWER(s.stype) = 'plumbing'
  ''');

  q4userListNotifier.value.clear();
  for (var map in _values) {
    final value = Admin.fromMap(map);
    q4userListNotifier.value.add(value);
  }
  q4userListNotifier.notifyListeners();
}

Future<String?> getcustomerPlumberName(int userId) async {
  final _values = await _db.rawQuery(
    'SELECT name FROM User WHERE id = ?',
    [userId],
  );

  if (_values.isNotEmpty) {
    return _values.first['name'] as String?;
  }
}

Future<int?> geticost(int id) async {
  final List<Map<String, dynamic>> rows =
      await _spdb.rawQuery('SELECT icost FROM Services WHERE s_id = ?', [id]);

  if (rows.isNotEmpty) {
    final costString = rows.first['icost'].toString();
    icost = int.tryParse(costString) ?? 0;
  } else {
    icost = 0;
  }

  return icost;
}
