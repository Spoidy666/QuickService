import 'package:flutter/material.dart';
import 'package:social_project/db/dataBase.dart';
import 'package:social_project/models/data_model.dart';

class Individualprovider extends StatelessWidget {
  final index;
  const Individualprovider({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ValueListenableBuilder(
          valueListenable: sproviderListNotifer,
          builder: (BuildContext ctx, List<Sprovider> Userlist, Widget? child) {
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
                      "Phone number  is " + data.pnumber,
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
                      "Location is " + data.plocation,
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
