import 'package:flutter/material.dart';
import 'package:social_project/db/dataBase.dart';

class Individualuser extends StatelessWidget {
  final index;
  const Individualuser({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final data = userListNotifier.value[index];
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
              Center(
                child: Text(
                  data.name,
                  style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.tertiary),
                ),
              ),
              Container(
                height: 550,
                width: 330,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your email",
                      style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).colorScheme.tertiary),
                    ),
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                              style: BorderStyle.solid,
                              width: 2)),
                      color: Colors.grey[300],
                      child: SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: Center(
                              child: Text(
                            data.email,
                            style: TextStyle(color: Colors.grey[800]),
                          ))),
                    ),
                    Text(
                      "Phone Number",
                      style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).colorScheme.tertiary),
                    ),
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                              style: BorderStyle.solid,
                              width: 2)),
                      color: Colors.grey[300],
                      child: SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: Center(
                              child: Text(
                            data.c_no,
                            style: TextStyle(color: Colors.grey[800]),
                          ))),
                    ),
                    Text(
                      "Gender",
                      style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).colorScheme.tertiary),
                    ),
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                              style: BorderStyle.solid,
                              width: 2)),
                      color: Colors.grey[300],
                      child: SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: Center(
                              child: Text(
                            data.gender,
                            style: TextStyle(color: Colors.grey[800]),
                          ))),
                    ),
                    Text(
                      "Age",
                      style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).colorScheme.tertiary),
                    ),
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                              style: BorderStyle.solid,
                              width: 2)),
                      color: Colors.grey[300],
                      child: SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: Center(
                              child: Text(
                            data.age,
                            style: TextStyle(color: Colors.grey[800]),
                          ))),
                    ),
                    Text(
                      "Date of Birth",
                      style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).colorScheme.tertiary),
                    ),
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                              style: BorderStyle.solid,
                              width: 2)),
                      color: Colors.grey[300],
                      child: SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: Center(
                              child: Text(
                            data.dob,
                            style: TextStyle(color: Colors.grey[800]),
                          ))),
                    ),
                    Text(
                      "Location",
                      style: TextStyle(
                          fontSize: 15,
                          color: Theme.of(context).colorScheme.tertiary),
                    ),
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                              style: BorderStyle.solid,
                              width: 2)),
                      color: Colors.grey[300],
                      child: SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: Center(
                              child: Text(
                            data.location,
                            style: TextStyle(color: Colors.grey[800]),
                          ))),
                    )
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
