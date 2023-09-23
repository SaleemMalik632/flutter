// ignore_for_file: non_constant_identifier_names, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:working_on_the_first/main.dart';
import 'package:working_on_the_first/model/catalog.dart';

class JsonCard extends StatelessWidget {
  final Product Item;

  JsonCard({Key? key, required this.Item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Image.network(Item.imageUrl),
      title: Text(Item.name),
      subtitle: Text(Item.description),
      trailing:
          Text(Item.price, style: TextStyle(color: Colors.blue, fontSize: 15)),
    ));
  }
}
