import 'package:flutter/material.dart';
import 'package:social_project/db/dataBase.dart';
import 'package:social_project/models/data_model.dart';
import 'package:social_project/pages/individualUser.dart';

class Userlist extends StatelessWidget {
  const Userlist({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: userListNotifier,
      builder: (BuildContext ctx, List<DataModel> Userlist, Widget? child) {
        return ListView.separated(
            itemBuilder: (ctx, index) {
              final data = Userlist[index];
              return ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => Individualuser(
                                index: index,
                              )));
                },
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                ),
                title: Text(
                  data.name,
                  style: TextStyle(color: Colors.white),
                ),
                trailing: IconButton(
                    onPressed: () {
                      if (data.id != Null) {
                        deleteUser(data.id!);
                      }
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
              );
            },
            separatorBuilder: (ctx, index) {
              return Divider();
            },
            itemCount: Userlist.length);
      },
    );
  }
}
