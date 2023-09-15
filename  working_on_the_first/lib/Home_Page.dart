// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Page')),
      body: const Center(
        child: Text(
          'This is the first page of the application',
          style: TextStyle(fontSize: 20),
        ),
      ),
      drawer: const Drawer(),
    );
  }
}
