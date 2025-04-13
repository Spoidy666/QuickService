import 'package:flutter/material.dart';

class BookingDetailsPage extends StatelessWidget {
  final Map<String, dynamic> booking;

  const BookingDetailsPage({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 40, 10, 30),
        child: Card(
          color: Theme.of(context).colorScheme.secondary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: [
                _infoTile("Service", booking['sname']),
                _infoTile("Type", booking['stype']),
                _infoTile("Cost", "₹${booking['cost']}"),
                _infoTile("Service Date", formatDate(booking['service_date'])),
                _infoTile("Appointment Date",
                    formatDate(booking['appointment_date'])),
                _infoTile("Provider", booking['pname']),
                _infoTile("Phone", booking['pnumber']),
                _infoTile("Location", booking['plocation']),
                _infoTile("Notes", booking['notes'] ?? "None"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _infoTile(String label, dynamic value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 16, color: Colors.white),
          children: [
            TextSpan(
                text: "$label: ",
                style: const TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: value?.toString() ?? 'N/A'),
          ],
        ),
      ),
    );
  }
}

String formatDate(String? rawDate) {
  if (rawDate == null) return 'N/A';
  try {
    DateTime parsedDate = DateTime.parse(rawDate);
    return "${parsedDate.day.toString().padLeft(2, '0')}-"
        "${parsedDate.month.toString().padLeft(2, '0')}-"
        "${parsedDate.year}";
  } catch (e) {
    return rawDate;
  }
}
