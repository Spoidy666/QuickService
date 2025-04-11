import 'package:flutter/material.dart';
import 'package:social_project/db/dataBase.dart';
import 'package:social_project/models/data_model.dart';
import 'package:social_project/pages/servicedetails.dart';

class Individualprovider extends StatelessWidget {
  final index;
  const Individualprovider({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final data = sproviderListNotifer.value[index];
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Center(
                  child: CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEbw_VY3CL8Hjs0itz6PDwFdE8fD_QWFAHmw&s'),
              )),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (data.p_id != null) {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) =>
                                ServiceDetailsPage(providerId: data.p_id!),
                          ));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Provider ID is missing!")));
                        }
                      },
                      child: Text(
                        "View Services",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.grey),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
