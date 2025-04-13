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
    String path = join(dbPath, 'sp1.db');

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
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Theme.of(context).colorScheme.primary,
                    child: ListTile(
                      title: Text(
                        provider['pname'],
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary),
                      ),
                      subtitle: Text(
                        "${provider['plocation']}",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary),
                      ),
                      trailing: const Icon(
                        Icons.chat,
                        color: Colors.blue,
                      ),
                      onTap: () {
  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
    return Individualprovider(provider: provider); // Pass the whole data
  }));
}
,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
