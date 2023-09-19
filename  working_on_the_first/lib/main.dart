// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, sized_box_for_whitespace, must_be_immutable
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
        '/MyCenteredMessage': (context) => TextPage(),
        '/': (context) => MyCenteredMessage()
      },
    );
  }
}

class MyCenteredMessage extends StatefulWidget {
  @override
  State<MyCenteredMessage> createState() => _MyCenteredMessageState();
}

class _MyCenteredMessageState extends State<MyCenteredMessage> {
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page')),
      body: Column(
        children: [
          Container(
            width: 150.0, // Set the desired width
            height: 200.0, // Set the desired height
            child: Image.asset('assets/images/loginpage.png'),
          ),
          SizedBox(height: 10),
          Text(
            'Wellcome Page $name',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              decoration: InputDecoration(
                  labelText: 'Email', border: OutlineInputBorder()),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TextPage()),
              );
            },
            child: Text('Sign In'), // Replace with your button text
          ),
        ],
      ),
    );
  }
}
