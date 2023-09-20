// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, sized_box_for_whitespace, must_be_immutable, sort_child_properties_last, non_constant_identifier_names, use_build_context_synchronously
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String name = '';
  bool Check_click = false;

  Move_on(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        Check_click = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => TextPage()),
      );
      setState(() {
        Check_click = false;
      });
    } 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page')),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              width: 150.0,
              height: 200.0,
              child: Image.asset('assets/images/loginpage.png'),
            ),
            Text('Welcome Page', style: TextStyle(fontSize: 20)),
            TextFormField(
              validator: (value) {
                if (value == null || value == '') {
                  return 'Please Enter Name';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              validator: (value) {
                if (value == null || value == '') {
                  return 'Email Addesss';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 5),
            InkWell(
              onTap: () => Move_on(context),
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                height: 30,
                width: Check_click ? 50 : 100,
                alignment: Alignment.center,
                child: Check_click? Icon(Icons.done)
                : Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(Check_click ? 50 : 10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
