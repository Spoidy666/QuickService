import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_project/db/dataBase.dart';
import 'package:social_project/models/data_model.dart';
import 'package:social_project/pages/home/loginPage.dart';
import 'package:social_project/pages/home/termsScreen.dart';

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
String? _genderController;
final _dobController = TextEditingController();
final _ageController = TextEditingController();
final _createPasswordController = TextEditingController();
final _confirmPasswordController = TextEditingController();
final _locationcontroller = TextEditingController();
final TextEditingController _cityController = TextEditingController();
final TextEditingController _stateController = TextEditingController();

final class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Form(
              child: Container(
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
                          Text(
                            "SignUp",
                            style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).colorScheme.tertiary),
                          ),
                          SizedBox(
                            height: 15,
                          ),
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
                          DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.male, color: Colors.black),
                              hintText: "Select Gender",
                              hintStyle: TextStyle(color: Colors.black),
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
                            value: _genderController,
                            onChanged: (value) {
                              _genderController = value;
                            },
                            dropdownColor:
                                Theme.of(context).colorScheme.surface,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _emailController,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                prefixIcon:
                                    Icon(Icons.email, color: Colors.black),
                                hintText: "Email",
                                hintStyle: TextStyle(color: Colors.black),
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
                          Row(
                            children: [
                              Expanded(
                                flex: 6,
                                child: TextFormField(
                                  style: TextStyle(color: Colors.black),
                                  controller: _dobController,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.date_range,
                                          color: Colors.black),
                                      hintText: "YYYY-MM-DD",
                                      hintStyle: TextStyle(color: Colors.black),
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(100))),
                                ),
                              ),
                              Expanded(flex: 1, child: SizedBox(width: 1)),
                              Expanded(
                                flex: 4,
                                child: TextFormField(
                                  style: TextStyle(color: Colors.black),
                                  controller: _ageController,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.numbers_outlined,
                                          color: Colors.black),
                                      hintText: "Age",
                                      hintStyle: TextStyle(color: Colors.black),
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(100))),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _stateController,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.location_on,
                                    color: Colors.black),
                                hintText: "Location(state)",
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
                            controller: _cityController,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.location_on,
                                    color: Colors.black),
                                hintText: "Location(city)",
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
                            style: TextStyle(color: Colors.black),
                            controller: _createPasswordController,
                            obscureText: show_create_password,
                            decoration: InputDecoration(
                                hintStyle: TextStyle(color: Colors.black),
                                prefixIcon:
                                    Icon(Icons.lock, color: Colors.black),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(create_password_function);
                                    },
                                    icon: Icon(Icons.visibility,
                                        color: Colors.black)),
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
                            style: TextStyle(color: Colors.black),
                            controller: _confirmPasswordController,
                            obscureText: show_confirm_password,
                            decoration: InputDecoration(
                                prefixIcon:
                                    Icon(Icons.lock, color: Colors.black),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(confirm_password_function);
                                    },
                                    icon: Icon(Icons.visibility,
                                        color: Colors.black)),
                                hintText: "Confirm Password",
                                hintStyle: TextStyle(color: Colors.black),
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100))),
                            validator: (value) {
                              if (_confirmPasswordController.text !=
                                  _createPasswordController.text) {
                                return "p";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                onAddUserButtonClicked();
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
                                    fontSize: 15,
                                    color:
                                        Theme.of(context).colorScheme.tertiary),
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
                                        color: Theme.of(context)
                                            .colorScheme
                                            .tertiary)),
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

  // Future<void> onAddUserButtonClicked() async {
  //   final _name = _nameController.text.trim();
  //   final _age = _ageController.text.trim();
  //   final _phoneNo = _phoneNumberController.text.trim();

  //   if (_name.isEmpty) {
  //     return snack(context, "Please enter your username");
  //   } else if (_genderController == null) {
  //     return snack(context, "Select your gender ");
  //   } else if (_emailController.text.isEmpty) {
  //     return snack(context, "Please enter your email");
  //   } else if (_phoneNo.isEmpty) {
  //     return snack(context, "Please enter the phone number");
  //   } else if (_dobController.text.isEmpty) {
  //     return snack(context, "Please enter your date of birth");
  //   } else if (_age.isEmpty) {
  //     return snack(context, "Please enter your age");
  //   } else if (_locationcontroller.text.trim().isEmpty) {
  //     return snack(context, "Enter your state ");
  //   } else if (_createPasswordController.text.isEmpty ||
  //       _createPasswordController.text != _confirmPasswordController.text) {
  //     return snack(context, "Password doesn't match");
  //   } else {
  //     final _user = DataModel(
  //         name: _name,
  //         gender: _genderController.toString(),
  //         age: _age,
  //         c_no: _phoneNumberController.text.trim(),
  //         dob: _dobController.text.trim(),
  //         email: _emailController.text.trim(),
  //         location: _locationcontroller.text.trim());
  //     Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
  //       return Termsscreen();
  //     }));
  //     saveName(
  //         _name, _emailController.text.trim(), _locationcontroller.text.trim());
  //     addUser(_user);
  //   }
  // }
  Future<void> onAddUserButtonClicked() async {
    final String name = _nameController.text.trim();
    final String email = _emailController.text.trim();
    final String phone = _phoneNumberController.text.trim();
    final String dob = _dobController.text.trim();
    final String age = _ageController.text.trim();
    final String city =
        _cityController.text.trim(); // Changed from location to city
    final String state = _stateController.text.trim(); // New state controller
    final String password = _createPasswordController.text;
    final String confirmPassword = _confirmPasswordController.text;
    final String? gender = _genderController;

    if (name.isEmpty) {
      return snack(context, "Please enter your username");
    } else if (gender == null) {
      return snack(context, "Please select your gender");
    } else if (email.isEmpty) {
      return snack(context, "Please enter your email");
    } else if (phone.isEmpty) {
      return snack(context, "Please enter your phone number");
    } else if (dob.isEmpty) {
      return snack(context, "Please enter your date of birth");
    } else if (age.isEmpty) {
      return snack(context, "Please enter your age");
    } else if (city.isEmpty || state.isEmpty) {
      // Make sure both city and state are filled
      return snack(context, "Please enter your city and state");
    } else if (password != confirmPassword || password.isEmpty) {
      return snack(context, "Passwords do not match or are empty");
    }

    final user = DataModel(
      name: name,
      gender: gender,
      age: age,
      c_no: phone,
      dob: dob,
      email: email,
      city: city, // Pass city here
      state: state, // Pass state here
    );

    await addUser(user);
    await saveName(name, email, city);

    Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) => Termsscreen()),
    );
  }
}

create_password_function() {
  show_create_password = !show_create_password;
}

confirm_password_function() {
  show_confirm_password = !show_confirm_password;
}

Future<void> saveName(String name, String email, String location) async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sharedPreferences.setString('name', name);
  sharedPreferences.setString('email', email);
  sharedPreferences.setString('location', location);
}

void snack(context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(content),
    backgroundColor: Colors.red,
    behavior: SnackBarBehavior.floating,
  ));
}

// Future signUpToController(context) async {
//   if (_createPasswordController.text == _confirmPasswordController.text) {
//     await addUser(
//         _nameController.text,
//         _emailController.text,
//         int.parse(_phoneNumberController.text),
//         _dobController.text,
//         int.parse(_ageController.text),
//         _createPasswordController.text,
//         _confirmPasswordController.text);
//     Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
//       return Termsscreen();
//     }));
//   } else {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//       content: Text("password does not match"),
//       backgroundColor: Colors.red,
//     ));
//   }
// }
