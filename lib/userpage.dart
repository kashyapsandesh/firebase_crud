import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud/home.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add user'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "Name",
                focusColor: Colors.red,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: ageController,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "Name",
                focusColor: Colors.red,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: dateController,
              decoration: InputDecoration(
                  icon: Icon(Icons.calendar_view_day_outlined),
                  labelText: 'select date'),
              onTap: () async {
                DateTime? Pickeddate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101));
                if (Pickeddate != null) {
                  setState(() {
                    dateController.text =
                        DateFormat('yyyy-mm-dd').format(Pickeddate);
                  });
                }
              },
            ),
            SizedBox(
              height: 0,
            ),
            ElevatedButton(
                onPressed: () {
                  final user = User(
                    name: nameController.text,
                    age: int.parse(ageController.text),
                    birthday: DateTime.parse(dateController.text),
                  );
                  createUser(user);

                  Navigator.pop(context);
                },
                child: Text("Send to database"))
          ]),
        ),
      ),
    );
  }

  Future createUser(User user) async {
    final docUser = FirebaseFirestore.instance.collection('user').doc();
    user.id = docUser.id;
    final json = user.toJson();
    //create document and write data to firebase
    await docUser.set(json);
  }
}
