import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:social_project/db/dataBase.dart';
import 'package:social_project/dbmsquestions/individualProvider.dart';
import 'package:social_project/models/data_model.dart';

String formatDate(String dateString) {
  try {
    DateTime date = DateTime.parse(dateString);
    return DateFormat('yyyy-MM-dd').format(date);
  } catch (e) {
    return 'Invalid date';
  }
}

class Q4 extends StatelessWidget {
  const Q4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: q4userListNotifier,
        builder: (BuildContext ctx, List<Admin> Userlist, Widget? child) {
          return ListView.separated(
            itemBuilder: (ctx, index) {
              final data = Userlist[index];
              return FutureBuilder<String?>(
                future: getcustomerPlumberName(data.userId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return ListTile(
                      title: Text('Loading...'),
                    );
                  }

                  if (snapshot.hasError) {
                    return ListTile(
                      title: Text('Error loading name'),
                    );
                  }

                  final customerName = snapshot.data ?? 'Unknown';

                  return ListTile(
                    onTap: () {},
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.tertiary,
                    ),
                    title: Text(
                      customerName,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary),
                    ),
                    subtitle: Text(
                      formatDate(data.appointmentDate),
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary),
                    ),
                  );
                },
              );
            },
            separatorBuilder: (ctx, index) {
              return Divider();
            },
            itemCount: Userlist.length,
          );
        },
      ),
    );
  }
}
