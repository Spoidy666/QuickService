import 'package:flutter/material.dart';
import 'package:social_project/db/dataBase.dart';
import 'package:social_project/models/data_model.dart';

class Individualuser extends StatelessWidget {
  final index;
  const Individualuser({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: userListNotifier,
        builder: (BuildContext ctx, List<DataModel> Userlist, Widget? child) {
          final data = Userlist[index];
          return Container(
            decoration: BoxDecoration(color: Colors.grey),
            child: Column(
              children: [
                Text(
                  "name is " + data.name,
                  style: TextStyle(
                      color: Colors.white, decoration: TextDecoration.none),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "age is  " + data.age,
                  style: TextStyle(
                      color: Colors.white, decoration: TextDecoration.none),
                )
              ],
            ),
          );
        });
  }
}
