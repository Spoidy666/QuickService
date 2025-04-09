import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:social_project/dbmsquestions/individualProvider.dart';
import 'package:sqflite/sqflite.dart';

class ProviderSearch extends StatefulWidget {
  final String serviceType;

  const ProviderSearch({super.key, required this.serviceType});

  @override
  _ProviderSearchState createState() => _ProviderSearchState();
}

class _ProviderSearchState extends State<ProviderSearch> {
  List<Map<String, dynamic>> serviceProviders = [];
  Database? _db;

  @override
  void initState() {
    super.initState();
    _initializeDatabase();
  }

  Future<void> _initializeDatabase() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, 'sp.db');

    _db = await openDatabase(path);

    if (_db != null) {
      loadServiceProviders();
    }
  }

  Future<void> loadServiceProviders() async {
    if (_db == null) return;

    final List<Map<String, dynamic>> result = await _db!.rawQuery(
        "SELECT * FROM Service_provider WHERE LOWER(service) LIKE LOWER(?)",
        ['%${widget.serviceType}%']);

    setState(() {
      serviceProviders = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.serviceType} Providers")),
      body: serviceProviders.isEmpty
          ? const Center(
              child: CircularProgressIndicator(
              color: Colors.black,
            ))
          : ListView.builder(
              itemCount: serviceProviders.length,
              itemBuilder: (context, index) {
                final provider = serviceProviders[index];
                return Card(
                  child: ListTile(
                    title: Text(provider['pname']),
                    subtitle: Text("${provider['plocation']}"),
                    trailing: const Icon(Icons.chat, color: Colors.black),
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) {
                        return Individualprovider(index: index);
                      }));
                    },
                  ),
                );
              },
            ),
    );
  }
}
