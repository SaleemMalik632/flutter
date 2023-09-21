// ignore_for_file: non_constant_identifier_names, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:working_on_the_first/model/catalog.dart';

class ItemWight extends StatelessWidget {
  final item Item;

  ItemWight({Key? key, required this.Item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Image.network(Item.ProImage),
      title: Text(Item.ProductName),
      subtitle: Text(Item.ProdcictDis),
      trailing: Text(Item.ProductPrice,
          style: TextStyle(color: Colors.blue, fontSize: 15)),
    ));
  }
}
