import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_project/db/dataBase.dart'; // Assumes your query function is here

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<Map<String, dynamic>> historyList = [];

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('id');

    if (userId == null) return;

    final data = await getUserHistory(userId); // Define this in database.dart
    setState(() {
      historyList = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Service History")),
      body: historyList.isEmpty
          ? const Center(child: Text("No service history available."))
          : ListView.builder(
              itemCount: historyList.length,
              itemBuilder: (context, index) {
                final item = historyList[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  color: Colors.grey[850],
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Service: ${item['sname']}",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                        SizedBox(height: 6),
                        Text("Provider: ${item['pname']}",
                            style: TextStyle(color: Colors.grey[300])),
                        SizedBox(height: 6),
                        Text(
                            "Booked For: ${item['service_date'].split('T')[0]}",
                            style: TextStyle(color: Colors.grey[400])),
                        SizedBox(height: 6),
                        Text("Cost: ₹${item['cost']}",
                            style: TextStyle(color: Colors.greenAccent)),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
