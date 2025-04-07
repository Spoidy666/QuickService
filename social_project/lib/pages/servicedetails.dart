import 'package:flutter/material.dart';
import 'package:social_project/db/dataBase.dart';
import 'package:social_project/models/data_model.dart';

class ServiceDetailsPage extends StatefulWidget {
  final int providerId;

  const ServiceDetailsPage({super.key, required this.providerId});

  @override
  State<ServiceDetailsPage> createState() => _ServiceDetailsPageState();
}

class _ServiceDetailsPageState extends State<ServiceDetailsPage> {
  List<Service> serviceList = [];

  @override
  void initState() {
    super.initState();
    fetchServices();
  }

  Future<void> fetchServices() async {
    final services = await getServicesByProvider(widget.providerId);
    setState(() {
      serviceList = services;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: serviceList.isEmpty
          ? Center(
              child: Text(
                "No services available.",
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: serviceList.length,
              itemBuilder: (context, index) {
                final service = serviceList[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  color: Colors.grey[900],
                  child: ListTile(
                    title: Text(
                      service.sname,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text("Type: ${service.stype}",
                            style: TextStyle(color: Colors.grey[400])),
                        SizedBox(
                          height: 15,
                        ),
                        Text("Initial Cost: ${service.icost}",
                            style: TextStyle(color: Colors.grey[400])),
                        SizedBox(
                          height: 15,
                        ),
                        Text("Cost Per Hour: ${service.cph}",
                            style: TextStyle(color: Colors.grey[400])),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
