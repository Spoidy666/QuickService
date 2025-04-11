import 'package:flutter/material.dart';
import 'package:social_project/db/dataBase.dart';
import 'package:social_project/pages/servicedetails.dart';
class Individualprovider extends StatelessWidget {
  final index;
  const Individualprovider({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    final data = sproviderListNotifer.value[index];
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                padding: EdgeInsets.all(8),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEbw_VY3CL8Hjs0itz6PDwFdE8fD_QWFAHmw&s'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      data.pname,
                      style: TextStyle(
                          fontSize: 30,
                          color: Theme.of(context).colorScheme.tertiary),
                    ),
                    PrimaryText(textvalue: 'Location : ' + data.plocation),
                    SizedBox(
                      height: 7,
                    ),
                    PrimaryText(
                      textvalue: 'Ph number : ' + data.pnumber,
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    PrimaryText(
                      textvalue: 'Primary Service : ' + data.service,
                    ),
                    SizedBox(
                      height: 7,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      width: 150,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                  Theme.of(context).colorScheme.tertiary)),
                          onPressed: () {},
                          child: Text(
                            'Message',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary),
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          if (data.p_id != null) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) =>
                                  ServiceDetailsPage(providerId: data.p_id!),
                            ));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("Provider ID is missing!")));
                          }
                        },
                        child: Text(
                          "View Services",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                        style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                                Theme.of(context).colorScheme.tertiary)),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PrimaryText extends StatelessWidget {
  final String textvalue;
  const PrimaryText({super.key, required this.textvalue});

  @override
  Widget build(BuildContext context) {
    return Text(
      textvalue,
      style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
    );
  }
}
