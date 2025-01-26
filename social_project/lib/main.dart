import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_project/db/dataBase.dart';
import 'package:social_project/firebase_options.dart';
import 'package:social_project/pages/loginPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDataBase();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
