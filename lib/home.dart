import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          controller: controller,
        ),
        actions: [
          IconButton(
              onPressed: () {
                final name = controller.text;
                createUser(nameT: name);
              },
              icon: Icon(Icons.add))
        ],
      ),
    );
  }

  Future createUser({required String nameT}) async {
    final docUser =
        FirebaseFirestore.instance.collection('user').doc('mero-id');
    final json = {
      'name': nameT,
      'age': 21,
    };
    //create document and write data to firebase
    await docUser.set(json);
  }
}

class User {
  String id;
  final String name;
  final int age;
  final DateTime birthday;

  User({
    this.id = '',
    required this.name,
    required this.age,
    required this.birthday,
  });
}
