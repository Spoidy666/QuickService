import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_project/db/dataBase.dart';
import 'package:social_project/models/data_model.dart';
import 'package:social_project/pages/individualUser.dart';

class Question3 extends StatelessWidget {
  Question3({super.key});

  final TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: locationController,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.location_on, color: Colors.black),
                hintText: "Location(state)",
                hintStyle: TextStyle(color: Colors.black),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100))),
            style: TextStyle(color: Colors.black),
          ),
        ),
        SizedBox(
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              getUserLocation(locationController.text.trim() as String);
              // signUpToController(context);
            },
            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.black)),
            child: Text(
              "                 Confirm                 ",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: q3userListNotifier,
            builder:
                (BuildContext ctx, List<DataModel> userList, Widget? child) {
              if (userList.isEmpty) {
                return const Center(
                  child: Text("No users found for this location."),
                );
              }
              return ListView.separated(
                itemBuilder: (ctx, index) {
                  final data = userList[index];
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => Individualuser(index: index),
                        ),
                      );
                    },
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.tertiary,
                    ),
                    title: Text(
                      data.name,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        if (data.id != null) {
                          deleteUser(data.id!);
                        }
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  );
                },
                separatorBuilder: (ctx, index) => const Divider(),
                itemCount: userList.length,
              );
            },
          ),
        ),
      ],
    );
  }
}
