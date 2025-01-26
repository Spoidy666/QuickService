import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:social_project/db/dataBase.dart';
import 'package:social_project/models/data_model.dart';

import 'package:social_project/pages/loginPage.dart';
import 'package:social_project/pages/termsScreen.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

bool show_confirm_password = true;
bool show_create_password = true;
final _nameController = TextEditingController();
final _emailController = TextEditingController();
final _phoneNumberController = TextEditingController();
final _dobController = TextEditingController();
final _ageController = TextEditingController();
final _locationController = TextEditingController();
final _createPasswordController = TextEditingController();
final _confirmPasswordController = TextEditingController();

final class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    initializeDataBase();
    return Container(
      color: Colors.black,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Form(
              child: Container(
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 25, 20, 30),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(30)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 50),
                      child: Column(
                        children: [
                          Text(
                            "Sign Up",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.grey[200]),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Create your account ",
                            style: TextStyle(
                                fontSize: 20, color: Colors.grey[200]),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person_2),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100)),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Username"),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.male),
                              hintText: "Select Gender",
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            items: ["Male", "Female"]
                                .map((gender) => DropdownMenuItem<String>(
                                      value: gender,
                                      child: Text(gender),
                                    ))
                                .toList(),
                            onChanged: (value) {},
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                hintText: "Email",
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100))),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _phoneNumberController,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.phone_android),
                                hintText: "Phone Number",
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100))),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _dobController,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.date_range),
                                hintText: "DD-MM-YYYY",
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100))),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _ageController,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.numbers_outlined),
                                hintText: "Age",
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100))),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _locationController,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.location_on),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100)),
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'Location'),
                          ),
                          SizedBox(height: 15),
                          TextFormField(
                            controller: _createPasswordController,
                            obscureText: show_create_password,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(create_password_function);
                                    },
                                    icon: Icon(Icons.visibility)),
                                hintText: "Create Password",
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100))),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _confirmPasswordController,
                            obscureText: show_confirm_password,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(confirm_password_function);
                                    },
                                    icon: Icon(Icons.visibility)),
                                hintText: "Confirm Password",
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100))),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                onClickAddUser();
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (ctx) {
                                  return Termsscreen();
                                }));
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already a user?",
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (ctx) {
                                    return Loginpage();
                                  }));
                                },
                                child: Text("Login",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.white)),
                              )
                            ],
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
}

create_password_function() {
  show_create_password = !show_create_password;
}

confirm_password_function() {
  show_confirm_password = !show_confirm_password;
}

Future<void> onClickAddUser() async {
  final _name = _nameController.text.trim();
  final _email = _emailController.text.trim();
  final _dob = _dobController.text.trim();
  final _age = _ageController.text.trim();
  final _confirmPass = _confirmPasswordController.text.trim();
  final _createPass = _createPasswordController.text.trim();
  final _phoneNo = _phoneNumberController.text.trim();
  final _location = _locationController.text.trim();
  if (_name.isEmpty ||
      _age.isEmpty ||
      _email.isEmpty ||
      _dob.isEmpty ||
      _confirmPass.isEmpty ||
      _createPass.isEmpty ||
      _phoneNo.isEmpty ||
      _location.isEmpty) {
    return;
  } else {
    addUser(DataModel(
        name: _name,
        c_no: _phoneNo,
        dob: _dob,
        password: _confirmPass,
        age: _age,
        location: _location,
        email: _email));
  }
}
