import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_project/db/dataBase.dart';
import 'package:social_project/pages/navigationpages/profilePage.dart';
import 'package:social_project/pages/Provider/providerSearch.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

String? Username;
String? Useremail;
String? Userlocation;
final _searchController = TextEditingController();

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
    getquestion1providers();

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
            padding: const EdgeInsets.fromLTRB(30.0, 6.0, 0.0, 0.0),
            child: Column(
              children: [
                Text(
                  "Service Category",
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                      color: Theme.of(context).colorScheme.tertiary),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 20, 9),
                  child: TextFormField(
                    controller: _searchController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, color: Colors.black),
                        hintText: "Search",
                        hintStyle: TextStyle(color: Colors.black),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100))),
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(30.0),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                ServiceCategory(
                    icon: Icons.plumbing,
                    label: 'Plumbing',
                    onTap: () => navigateToServiceProviders('Plumbing')),
                ServiceCategory(
                    icon: Icons.security,
                    label: 'Cybersecurity',
                    onTap: () => navigateToServiceProviders('Cybersecurity')),
                ServiceCategory(
                    icon: Icons.electrical_services,
                    label: 'Electrician',
                    onTap: () => navigateToServiceProviders('Electrician')),
                ServiceCategory(
                    icon: Icons.school,
                    label: 'Tutor',
                    onTap: () => navigateToServiceProviders('Tutor')),
                ServiceCategory(
                    icon: Icons.food_bank,
                    label: 'Food',
                    onTap: () => navigateToServiceProviders('Food')),
                ServiceCategory(
                    icon: Icons.cleaning_services,
                    label: 'Cleaning',
                    onTap: () => navigateToServiceProviders('Cleaning')),
                ServiceCategory(
                    icon: Icons.carpenter,
                    label: 'Carpenter',
                    onTap: () => navigateToServiceProviders('Carpenter')),
                ServiceCategory(
                    icon: Icons.local_hospital,
                    label: 'Health Care',
                    onTap: () => navigateToServiceProviders('Health Care')),
                ServiceCategory(
                    icon: Icons.car_repair,
                    label: 'Mechanic',
                    onTap: () => navigateToServiceProviders('Mechanic')),
                ServiceCategory(
                    icon: Icons.local_grocery_store,
                    label: 'Grocery',
                    onTap: () => navigateToServiceProviders('Grocery')),
                ServiceCategory(
                    icon: Icons.gavel,
                    label: 'Lawyer',
                    onTap: () => navigateToServiceProviders('Lawyer')),
                ServiceCategory(
                    icon: Icons.local_florist,
                    label: 'Gardener',
                    onTap: () => navigateToServiceProviders('Gardener')),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  void navigateToServiceProviders(String serviceType) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProviderSearch(serviceType: serviceType),
      ),
    );
  }
}

class ServiceCategory extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const ServiceCategory(
      {super.key,
      required this.icon,
      required this.label,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
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
