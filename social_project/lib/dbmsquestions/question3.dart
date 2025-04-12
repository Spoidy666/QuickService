import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_project/db/dataBase.dart';
import 'package:social_project/dbmsquestions/individualProvider3.dart';
import 'package:social_project/models/data_model.dart';
import 'package:social_project/pages/User/individualUser.dart';

class Question3 extends StatelessWidget {
  Question3({super.key});

  final TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: Column(
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
            height: 10,
          ),
          SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                getUserLocation(locationController.text.trim() as String);
              },
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                      Theme.of(context).colorScheme.primary)),
              child: Text(
                "                 Confirm                 ",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.tertiary,
                    fontSize: 16),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ValueListenableBuilder(
                valueListenable: q3userListNotifier,
                builder: (BuildContext ctx, List<DataModel> userList,
                    Widget? child) {
                  if (userList.isEmpty) {
                    return const Center(
                      child: Text("No users found for this location."),
                    );
                  }
                  return ListView.separated(
                    itemBuilder: (ctx, index) {
                      final data = userList[index];
                      return Card(
                        color: Theme.of(context).colorScheme.primary,
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => Individualuser(
                                  index: index,
                                ),
                              ),
                            );
                          },
                          leading: CircleAvatar(
                            backgroundColor:
                                Theme.of(context).colorScheme.tertiary,
                          ),
                          title: Text(
                            data.name,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                          ),
                          subtitle: Text(
                            data.email,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (ctx, index) {
                      return SizedBox(
                        height: 2,
                      );
                    },
                    itemCount: userList.length,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
