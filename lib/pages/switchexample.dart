import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

final database = FirebaseDatabase.instance;
final reference = database.ref('switch_value');

class SwitchExample extends StatefulWidget {
  @override
  _SwitchExampleState createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Switch Example'),
      ),
      body: Center(
        child: Switch(
          value: isSwitched,
          onChanged: (value) {
            setState(() {
              isSwitched = value;
              reference.set(isSwitched ? 1 : 0); // Update Firebase database
            });
          },
        ),
      ),
    );
  }
}
