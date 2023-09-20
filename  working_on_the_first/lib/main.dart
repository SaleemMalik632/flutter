// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, sized_box_for_whitespace, must_be_immutable, sort_child_properties_last, non_constant_identifier_names, use_build_context_synchronously, prefer_const_literals_to_create_immutables
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
      debugShowCheckedModeBanner: false,
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
      drawer: MYDraw(),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              width: 150,
              height: 200,
              child: Image.asset('assets/images/loginpage.png'),
            ),
            Text('Welcome Page', style: TextStyle(fontSize: 20)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
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
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0), // Adjust the horizontal padding as needed
              child: TextFormField(
                validator: (value) {
                  if (value == null || value == '') {
                    return 'Email Address';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
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
                child: Check_click
                    ? Icon(Icons.done)
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

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Column(children: [
        SizedBox(height: 50),
        Text(
          'home Page ',
          style: TextStyle(fontSize: 50),
        )
      ]),
    );
  }
}

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Services Page')),
      body: Column(children: [
        SizedBox(height: 50),
        Text(
          'Services Page ',
          style: TextStyle(fontSize: 50),
        )
      ]),
    );
  }
}




class MYDraw extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              accountName: Text('Saleem Malik',
                  style: TextStyle(fontSize: 21, color: Colors.white)),
              accountEmail: Text(
                  'saleemalik444@gmail.com'), // You can add the user's email here if needed
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(
                    'assets/images/saleem.jpeg'), // Replace with the path to the user's image
              )),
          ListTile(
            leading: Icon(
              Icons.home, 
            ),
            title: const Text('Home'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Home()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.business_center,
            ),
            title: const Text('Services'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Services()));
            },
          ),
        ],
      ),
    );
  }
}
