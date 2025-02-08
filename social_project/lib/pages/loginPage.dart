import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:social_project/pages/mainPage.dart';
import 'package:social_project/pages/signUp.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

bool showPassword = true;

class _LoginpageState extends State<Loginpage> {
  final loginUserName = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 300,
                  child: Lottie.asset(
                    'assets/login.json',
                  ),
                ),
                Text(
                  "Welcome",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.tertiary),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "username is required";
                      }
                      return null;
                    },
                    controller: loginUserName,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person_2,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100)),
                        fillColor: Colors.white,
                        filled: true,
                        hintStyle: TextStyle(color: Colors.black),
                        hintText: "Username"),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "password is required";
                        }
                        return null;
                      },
                      obscureText: showPassword,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            (Icons.lock),
                            color: Colors.black,
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(showPasswordFunction);
                              },
                              icon:
                                  Icon(Icons.visibility, color: Colors.black)),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100)))),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (ctx) {
                              return Signup();
                            }));
                          },
                          child: Text(
                            "Not registered? Signup..",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.tertiary),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 0,
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) {
                        return Mainpage();
                      }));
                    },
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.black)),
                    child: Text(
                      "                 Login                 ",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

showPasswordFunction() {
  showPassword = !showPassword;
}
