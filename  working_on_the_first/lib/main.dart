// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:working_on_the_first/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.green),
      routes: {
        '/MyCenteredMessage': (context) => HomePage(),
        '/': (context) => MyCenteredMessage()
      },
    );
  }
}

class MyCenteredMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('image shower '),
        ),
        body: Column(children: [
          Container(
            width: 150.0, // Set the desired width
            height: 200.0, // Set the desired height
            child: Image.asset('assets/images/loginpage.png'),
          ),
          SizedBox(
            height: 50, // <-- SEE HERE
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Enter something',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ]));
  }
}
