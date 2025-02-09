import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_project/db/dataBase.dart';
import 'package:social_project/dbmsquestions/individualProvider.dart';
import 'package:social_project/models/data_model.dart';

class Providerlist extends StatelessWidget {
  const Providerlist({super.key});

  @override
  Widget build(BuildContext context) {

    return ValueListenableBuilder(
      valueListenable: sproviderListNotifer,
      builder: (BuildContext ctx, List<Sprovider> Userlist, Widget? child) {
        return ListView.separated(
            itemBuilder: (ctx, index) {
              final data = Userlist[index];
              return ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => Individualprovider(
                                index: index,
                              )));
                },
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.tertiary,
                ),
                title: Text(
                  data.pname,
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.tertiary),
                ),
                trailing: IconButton(
                    onPressed: () {
                      if (data.p_id != null) {
                        deleteProvider(data.p_id!);
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
