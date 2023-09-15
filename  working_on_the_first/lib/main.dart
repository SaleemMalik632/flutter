// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:working_on_the_first/home_page.dart';


void main(){
  runApp(MyApp());
}           


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(), // Use the HomePage widget here
    );
  }
}


class MyCenteredMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Centered Message'),
      ),
      body: Center(
        child: Text(
          'This is the first  of application',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
