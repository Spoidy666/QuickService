import 'package:flutter/material.dart';

import 'package:social_project/pages/loginPage.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.grey[500]),
      home: Loginpage(),
    );
  }
}
