import 'package:flutter/material.dart';
import 'package:social_project/db/dataBase.dart';
import 'package:social_project/models/data_model.dart';
import 'package:social_project/pages/Provider/bookService.dart';

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
                  color: Theme.of(context).colorScheme.tertiary,
                  child: ListTile(
                    title: Text(
                      service.sname,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 18),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        primaryTextServiceDetails(
                            valuetext: 'Type: ${service.stype}'),
                        SizedBox(
                          height: 15,
                        ),
                        primaryTextServiceDetails(
                            valuetext: 'Initial Cost: ${service.icost}'),
                        SizedBox(
                          height: 15,
                        ),
                        primaryTextServiceDetails(
                            valuetext: "Cost Per Hour: ${service.cph}"),
                        SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: SizedBox(
                            width: 300,
                            height: 40,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (ctx) {
                                    return Bookservice(
                                        providerId: widget.providerId,
                                        serviceId: service.sId!);
                                  }));
                                },
                                child: Text("Book",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .tertiary))),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class primaryTextServiceDetails extends StatelessWidget {
  final String valuetext;
  const primaryTextServiceDetails({super.key, required this.valuetext});

  @override
  Widget build(BuildContext context) {
    return Text(valuetext,
        style: TextStyle(color: Theme.of(context).colorScheme.primary));
  }
}
