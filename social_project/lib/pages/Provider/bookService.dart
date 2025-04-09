import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_project/db/dataBase.dart';

class Bookservice extends StatefulWidget {
  final int providerId;
  final int serviceId;

  const Bookservice(
      {super.key, required this.providerId, required this.serviceId});

  @override
  State<Bookservice> createState() => _BookserviceState();
}

class _BookserviceState extends State<Bookservice> {
  DateTime? selectedDate;
  final TextEditingController notesController = TextEditingController();

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _submit() async {
    final prefs = await SharedPreferences.getInstance();
    final int? userId = prefs.getInt('id');

    if (userId == null || selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please complete all fields")),
      );
      return;
    }

    final now = DateTime.now();
    final serviceDate = now.toIso8601String();
    final appointmentDate = selectedDate!.toIso8601String();

    await insertIntoAdminTable(
      userId: userId,
      providerId: widget.providerId,
      serviceId: widget.serviceId,
      serviceDate: serviceDate,
      cost: 0.0,
      appointmentDate: appointmentDate,
      notes: notesController.text,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Service booked successfully")),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Schedule Service")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.black)),
              onPressed: _pickDate,
              child: Text(
                selectedDate == null
                    ? "Select Date"
                    : "Selected: ${selectedDate!.toLocal().toString().split(' ')[0]}",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: notesController,
              decoration: InputDecoration(
                labelText: "Additional Notes",
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
            ),
            Spacer(),
            ElevatedButton(
              onPressed: _submit,
              child: Text(
                "Confirm Booking",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
