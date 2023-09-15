// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, prefer_const_constructors, annotate_overrides
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyCenteredMessage(),
    );
  }
}

class MyCenteredMessage extends StatelessWidget {
  @override
  int data = 30;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Centered Message'),
      ),
      body: Center(
        child: Text(
          'This is the first $data of application',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
