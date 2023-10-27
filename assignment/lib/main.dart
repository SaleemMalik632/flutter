// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, no_leading_underscores_for_local_identifiers
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './service/http_.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: NavigationExample(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, children: []),
        ));
  }
}

class NavigationExample extends StatefulWidget {
  @override
  _NavigationExampleState createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    RadioPage(),
    AllProdect(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Navigation Example"),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        currentIndex: _currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.radio, color: Colors.white, size: 30),
            label: 'Radio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list, color: Colors.white, size: 30),
            label: 'All Prodects',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add, color: Colors.white, size: 30),
            label: 'Post Data',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class RadioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Radio Page"),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Home Page"),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

TextEditingController name = TextEditingController();
TextEditingController price = TextEditingController();
TextEditingController desc = TextEditingController();

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: name,
              decoration: const InputDecoration(label: Text("Product-name")),
            ),
            const SizedBox(height: 50),
            TextField(
              controller: price,
              decoration: const InputDecoration(label: Text("Product-price")),
            ),
            const SizedBox(height: 50),
            TextField(
              controller: desc,
              decoration: const InputDecoration(label: Text("Product-desc")),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
                onPressed: () {
                  var data = {
                    "name": name.text,
                    "price": price.text,
                    "description": desc.text
                  };
                  HttpService.postProduct(data);
                },
                child: const Text("POST"))
          ],
        ),
      ),
    );
  }
}

// make the screen to show all the prodect name and price and desc from list of prodects
class AllProdect extends StatefulWidget {
  const AllProdect({super.key});
  @override
  State<AllProdect> createState() => _AllProdectState();
}

class _AllProdectState extends State<AllProdect> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: HttpService.getProducts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                var data = snapshot.data[index];
                return ListTile(
                  title: Text(data.name),
                  subtitle: Text(data.price),
                  trailing: Text(data.desc),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
