import 'package:flutter/material.dart';
import 'package:social_project/db/dataBase.dart';
import 'package:social_project/models/data_model.dart';
import 'package:social_project/pages/home/homePage.dart';
import 'package:social_project/pages/home/mainPage.dart';

class AddServicePage extends StatelessWidget {
  final int providerId; // Receive provider ID from previous screen

  AddServicePage({super.key, required this.providerId});

  final _nameController = TextEditingController();
  final _typeController = TextEditingController();
  final _icostController = TextEditingController();
  final _cphController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Service"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.supervised_user_circle,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100)),
                fillColor: Colors.white,
                filled: true,
                hintText: "Service name",
                hintStyle: TextStyle(color: Colors.black),
              ),
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: _typeController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.type_specimen,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100)),
                fillColor: Colors.white,
                filled: true,
                hintText: "Service type",
                hintStyle: TextStyle(color: Colors.black),
              ),
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: _icostController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.money_outlined,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100)),
                fillColor: Colors.white,
                filled: true,
                hintText: "Initial cost",
                hintStyle: TextStyle(color: Colors.black),
              ),
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: _cphController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.timelapse_outlined,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100)),
                fillColor: Colors.white,
                filled: true,
                hintText: "Cost per hour",
                hintStyle: TextStyle(color: Colors.black),
              ),
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                onAddServiceButtonClicked(context);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text("Add Service", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onAddServiceButtonClicked(BuildContext context) async {
    final _name = _nameController.text.trim();
    final _type = _typeController.text.trim();
    final _icost = _icostController.text.trim();
    final _cph = _cphController.text.trim();

    if (_name.isEmpty || _type.isEmpty || _icost.isEmpty || _cph.isEmpty) {
      return snack(context, "All fields are required");
    }

    final newService = Service(
      sname: _name,
      stype: _type,
      icost: _icost,
      cph: _cph,
      providerId: providerId,
    );
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
      return Mainpage();
    }));
    await addService(newService);
  }
}

void snack(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.fixed,
    ),
  );
}
