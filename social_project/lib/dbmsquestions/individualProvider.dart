import 'package:flutter/material.dart';
import 'package:social_project/pages/servicedetails.dart';

class Individualprovider extends StatelessWidget {
  final Map<String, dynamic> provider;

  const Individualprovider({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Container(
                padding: const EdgeInsets.all(8),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSEbw_VY3CL8Hjs0itz6PDwFdE8fD_QWFAHmw&s',
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      provider['pname'],
                      style: TextStyle(
                        fontSize: 30,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                    PrimaryText(
                        textvalue: 'Location : ${provider['plocation']}'),
                    const SizedBox(height: 7),
                    PrimaryText(
                        textvalue: 'Ph number : ${provider['pnumber']}'),
                    const SizedBox(height: 7),
                    PrimaryText(
                        textvalue: 'Primary Service : ${provider['service']}'),
                    const SizedBox(height: 7),
                  ],
                ),
              ),
              Row(
                children: [
                  const SizedBox(width: 10),
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            Theme.of(context).colorScheme.tertiary,
                          ),
                        ),
                        onPressed: () {
                          // Placeholder for messaging feature
                        },
                        child: Text(
                          'Message',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          if (provider['p_id'] != null) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => ServiceDetailsPage(
                                  providerId: provider['p_id']),
                            ));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Provider ID is missing!")),
                            );
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            Theme.of(context).colorScheme.tertiary,
                          ),
                        ),
                        child: Text(
                          "View Services",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15),
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
