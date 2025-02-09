import 'package:flutter/material.dart';
import 'package:social_project/db/dataBase.dart';
import 'package:social_project/models/data_model.dart';

import 'package:social_project/pages/homePage.dart';

class Profilepage extends StatefulWidget {
  Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

DataModel? user;

class _ProfilepageState extends State<Profilepage> {
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    final fetchedUser = await getLastUser();
    setState(() {
      user = fetchedUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
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
                user!.name,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              height: 400,
              width: 330,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Your email"),
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
                          user!.email,
                          style: TextStyle(color: Colors.grey[800]),
                        ))),
                  ),
                  Text("Phone Number"),
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
                          user!.c_no,
                          style: TextStyle(color: Colors.grey[800]),
                        ))),
                  ),
                  Text("Gender"),
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
                          user!.gender,
                          style: TextStyle(color: Colors.grey[800]),
                        ))),
                  ),
                  Text("Age"),
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
                          user!.age,
                          style: TextStyle(color: Colors.grey[800]),
                        ))),
                  ),
                  Text("Data of Birth"),
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
                          user!.dob,
                          style: TextStyle(color: Colors.grey[800]),
                        ))),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  
}

