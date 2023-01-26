import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/read.dart';
import 'package:crud/userpage.dart';
import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";

import 'home.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.amber,
          appBarTheme: AppBarTheme(backgroundColor: Colors.pink)),
      home: UserPage(),
    );
  }
}
