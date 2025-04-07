import 'package:flutter/material.dart';
import 'package:social_project/pages/home/homePage.dart';

class Testpage extends StatefulWidget {
  const Testpage({super.key});

  @override
  State<Testpage> createState() => _TestpageState();
}

class _TestpageState extends State<Testpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            color: Theme.of(context).colorScheme.surface,
          
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.tertiary,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Welcome',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.tertiary,
                                fontSize: 25,
                                fontWeight: FontWeight.bold)),
                        Text(
                          Username.toString() + "!",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.tertiary,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search_rounded),
                    label: Text("Search"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.black)),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("Popular Services",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_right_alt_rounded))
                  ],
                ),
                ListView(
                  
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
