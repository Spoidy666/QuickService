import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 170,
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.grey,
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
                    "Name_of_user", 
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
                      Text("Location"),
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
            ),
          ),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all(30.0),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              ServiceCategory(icon: Icons.plumbing, label: 'plumbing'),
              ServiceCategory(
                  icon: Icons.electrical_services, label: 'electrician'),
              ServiceCategory(icon: Icons.school, label: 'Tutor'),
              ServiceCategory(icon: Icons.food_bank, label: 'Food'),
              ServiceCategory(icon: Icons.cleaning_services, label: 'cleaning'),
              ServiceCategory(icon: Icons.carpenter, label: 'carpenter'),
              ServiceCategory(icon: Icons.local_hospital, label: 'Health care'),
              ServiceCategory(icon: Icons.car_repair, label: 'mechanical'),
              ServiceCategory(
                  icon: Icons.local_grocery_store, label: 'grocery'),
              ServiceCategory(icon: Icons.gavel, label: 'lawyer'),
              ServiceCategory(icon: Icons.local_florist, label: 'gardener'),
            ],
          ),
        ),
      ]),
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
              color: Colors.black,
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
              ),
              Text(label),
              SizedBox(
                height: 8,
              )
            ],
          ),
        ));
  }
}
