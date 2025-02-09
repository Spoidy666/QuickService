import 'package:flutter/material.dart';
import 'package:social_project/db/dataBase.dart';
import 'package:social_project/models/data_model.dart';
import 'package:social_project/pages/mainPage.dart';

class Sproviderinsertionpage extends StatelessWidget {
  Sproviderinsertionpage({super.key});

  final _nameController = TextEditingController();

  final _phoneNumberController = TextEditingController();
  final _plocationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    getquestion1providers();
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Form(
              child: Container(
                height: 800,
                color: Theme.of(context).colorScheme.primary,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 25, 20, 30),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 50),
                      child: Column(
                        children: [
                          Text(
                            '''Let's create your
      account''',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Theme.of(context).colorScheme.tertiary),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person_2,
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100)),
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "Username",
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _phoneNumberController,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.phone_android,
                                    color: Colors.black),
                                hintText: "Phone Number",
                                hintStyle: TextStyle(color: Colors.black),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100))),
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _plocationController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.location_city,
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100)),
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "Location",
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                onAddproviderButtonClicked(context);
                                // signUpToController(context);
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStatePropertyAll(Colors.black)),
                              child: Text(
                                "                 Confirm                 ",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onAddproviderButtonClicked(context) async {
    final _name = _nameController.text.trim();
    final _location = _plocationController.text.trim();
    final _phoneNo = _phoneNumberController.text.trim();

    if (_name.isEmpty) {
      return snack(context, "Please enter your username");
    } else if (_phoneNo.isEmpty) {
      return snack(context, "Please enter the phone number");
    } else if (_location.isEmpty) {
      return snack(context, "Please enter your location");
    } else {
      final _user = Sprovider(
        pname: _name,
        pnumber: _phoneNo,
        plocation: _location,
      );
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
        return Mainpage();
      }));
      addProvider(_user);
    }
  }
}

void snack(context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(content),
    backgroundColor: Colors.red,
    behavior: SnackBarBehavior.floating,
  ));
}
