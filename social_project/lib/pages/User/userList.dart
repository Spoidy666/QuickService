import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_project/db/dataBase.dart';
import 'package:social_project/models/data_model.dart';
import 'package:social_project/pages/User/individualUser.dart';

class Userlist extends StatelessWidget {
  const Userlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: ValueListenableBuilder(
        valueListenable: userListNotifier,
        builder: (BuildContext ctx, List<DataModel> Userlist, Widget? child) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (ctx, index) {
                  final data = Userlist[index];
                  return Card(
                    color: Theme.of(context).colorScheme.primary,
                    elevation: 20,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => Individualuser(
                                      index: index,
                                    )));
                      },
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).colorScheme.tertiary,
                      ),
                      title: Text(
                        data.name,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary),
                      ),
                      subtitle: Text(
                        data.location,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary),
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            if (data.id != Null) {
                              deleteUser(data.id!);
                              deleteSharedPreferenceName();
                            }
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                    ),
                  );
                },
                separatorBuilder: (ctx, index) {
                  return SizedBox(
                    height: 2,
                  );
                },
                itemCount: Userlist.length),
          );
        },
      ),
    );
  }
}

Future<void> deleteSharedPreferenceName() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.remove('name');
  sharedPreferences.remove('email');
}
