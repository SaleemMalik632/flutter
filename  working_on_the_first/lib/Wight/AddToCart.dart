// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, no_leading_underscores_for_local_identifiers, avoid_print
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';


class AddtoCart extends StatelessWidget {
  const AddtoCart({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            ListV(),
          ],
        ));
  }
}

class ListV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.done),
          title: 'Card Item'.text.bold.make(),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            print('Tapped on ${[index]}');
          },
        );
      },
    );
  }
}
