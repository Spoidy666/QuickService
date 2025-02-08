import 'package:flutter/material.dart';
import 'package:social_project/db/dataBase.dart';
import 'package:social_project/models/data_model.dart';

class Individualuser extends StatelessWidget {
  final index;
  const Individualuser({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ValueListenableBuilder(
          valueListenable: userListNotifier,
          builder: (BuildContext ctx, List<DataModel> Userlist, Widget? child) {
            final data = Userlist[index];
            return Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.black),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "name is " + data.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          decoration: TextDecoration.none),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "gender is " + data.gender,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          decoration: TextDecoration.none),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "age is  " + data.age,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          decoration: TextDecoration.none),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Email is " + data.email,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          decoration: TextDecoration.none),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Phone number  is " + data.c_no,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          decoration: TextDecoration.none),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Dob is " + data.dob,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          decoration: TextDecoration.none),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      return Navigator.of(context).pop();
                    },
                    child: Text(
                      "Back",
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                      Colors.grey,
                    )),
                  )
                ],
              ),
            );
          }),
    );
  }
}
