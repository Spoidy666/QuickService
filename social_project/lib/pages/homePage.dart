import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_project/pages/profilePage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

String? Username;
String? Useremail;
String? Userlocation;

class _HomeScreenState extends State<HomeScreen> {
  Future<void> loadUserName() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String name = sharedPreferences.getString('name') ?? "Guest";
    String email = sharedPreferences.getString('email') ?? "";
    String location = sharedPreferences.getString('location') ?? "Location";
    setState(() {
      Username = name;
      Useremail = email;
      Userlocation = location;
    });
  }

  @override
  Widget build(BuildContext context) {
    loadUserName();
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.surface,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 170,
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(width: 3, color: Colors.grey),
                borderRadius: BorderRadius.circular(25)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: DefaultTextStyle(
                style: TextStyle(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hi,", style: TextStyle(fontSize: 30)),
                    Text(
                      Username.toString(),
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                        Text(Userlocation.toString()),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 16.0, 0.0, 0.0),
            child: Text(
              "Service Category",
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                  color: Theme.of(context).colorScheme.tertiary),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(30.0),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                ServiceCategory(
                  icon: Icons.plumbing,
                  label: 'plumbing',
                ),
                ServiceCategory(
                    icon: Icons.electrical_services, label: 'electrician'),
                ServiceCategory(icon: Icons.school, label: 'Tutor'),
                ServiceCategory(icon: Icons.food_bank, label: 'Food'),
                ServiceCategory(
                    icon: Icons.cleaning_services, label: 'cleaning'),
                ServiceCategory(icon: Icons.carpenter, label: 'carpenter'),
                ServiceCategory(
                    icon: Icons.local_hospital, label: 'Health care'),
                ServiceCategory(icon: Icons.car_repair, label: 'mechanical'),
                ServiceCategory(
                    icon: Icons.local_grocery_store, label: 'grocery'),
                ServiceCategory(icon: Icons.gavel, label: 'lawyer'),
                ServiceCategory(icon: Icons.local_florist, label: 'gardener'),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class ServiceCategory extends StatelessWidget {
  final IconData icon;
  final String label;

  const ServiceCategory({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          print('opening all the available ${label}s');
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.tertiary,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 50,
                color: Theme.of(context).colorScheme.tertiary,
              ),
              Text(
                label,
                style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
              ),
              SizedBox(
                height: 8,
              )
            ],
          ),
        ));
  }
}
