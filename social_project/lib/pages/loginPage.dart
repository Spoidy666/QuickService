import 'package:flutter/material.dart';
import 'package:social_project/db/dataBase.dart';
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
    initializeDataBase();
    return Container(
      color: Colors.black,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[900],
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Stack(
                    children: [
                      CustomPaint(
                        painter: CurvedPainter(),
                        child: Container(
                          height: 300,
                        ),
                      ),
                      Center(
                        child: Column(
                          children: [
                            SizedBox(height: 70),
                            Icon(
                              Icons.design_services_rounded,
                              size: 100,
                              color: Colors.white,
                            ),
                            Text(
                              "Service Provider",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Welcome",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[300]),
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
                          prefixIcon: Icon(Icons.person_2),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100)),
                          fillColor: Colors.white,
                          filled: true,
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
                            prefixIcon: Icon((Icons.lock)),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(showPasswordFunction);
                                },
                                icon: Icon(Icons.visibility)),
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Password",
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
                              style: TextStyle(color: Colors.grey[200]),
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
                          backgroundColor:
                              WidgetStatePropertyAll(Colors.black)),
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
      ),
    );
  }
}

class CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(0, size.height * 0.75);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height * 0.75);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

showPasswordFunction() {
  showPassword = !showPassword;
}
