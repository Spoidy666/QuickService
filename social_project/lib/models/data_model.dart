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
    final location = map['location'] as String;
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
  final String service;
  Sprovider(
      {required this.pname,
      required this.plocation,
      required this.pnumber,
      required this.service,
      this.p_id});
  static Sprovider fromMap(Map<String, Object?> map) {
    final p_id = map['p_id'] as int;
    final name = map['pname'] as String;
    final service = map['service'] as String;
    final phone = map['pnumber'] as String;
    final location = map['plocation'] as String;

    return Sprovider(
        p_id: p_id,
        pname: name,
        pnumber: phone,
        plocation: location,
        service: service);
  }
}

class Service {
  int? sId;
  String sname;
  String stype;
  String icost;
  String cph;
  int providerId; 

  Service({
    this.sId,
    required this.sname,
    required this.stype,
    required this.icost,
    required this.cph,
    required this.providerId,
  });

  Map<String, dynamic> toMap() {
    return {
      's_id': sId,
      'sname': sname,
      'stype': stype,
      'icost': icost,
      'cph': cph,
      'provider_id': providerId,
    };
  }

  
  factory Service.fromMap(Map<String, dynamic> map) {
    return Service(
      sId: map['s_id'],
      sname: map['sname'],
      stype: map['stype'],
      icost: map['icost'],
      cph: map['cph'],
      providerId: map['provider_id'],
    );
  }
}
class Admin {
  int? adminId;
  int userId;
  int serviceId;
  int providerId;
  String serviceDate;
  double cost;
  String appointmentDate;

  Admin({
    this.adminId,
    required this.userId,
    required this.serviceId,
    required this.providerId,
    required this.serviceDate,
    required this.cost,
    required this.appointmentDate,
  });
  factory Admin.fromMap(Map<String, dynamic> map) {
    return Admin(
      adminId: map['admin_id'] as int?,
      userId: map['user_id'] as int,
      serviceId: map['service_id'] as int,
      providerId: map['provider_id'] as int,
      serviceDate: map['service_date'] as String,
      cost: map['cost'] as double,
      appointmentDate: map['appointment_date'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'admin_id': adminId,
      'user_id': userId,
      'service_id': serviceId,
      'provider_id': providerId,
      'service_date': serviceDate,
      'cost': cost,
      'appointment_date': appointmentDate,
    };
  }
}
