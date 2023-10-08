// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, no_leading_underscores_for_local_identifiers, avoid_print

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddtoCart extends StatelessWidget {
  const AddtoCart({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: 'List View'.text.bold.make()),
        body: Column(
          children: [
            List_().p32().expand(),
            Divider(),
            CartChart(),
          ],
        ));
  }
}  

class CartChart extends StatelessWidget {
  const CartChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          '1000RS'.text.bold.make(),
          ElevatedButton(
              onPressed: () { 
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Buy not supported yet'),
                  ),
                );
              },
              child: 'Buy'.text.bold.make())
        ],
      ),
    );
  }
}

class List_ extends StatelessWidget {
  const List_({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.done),
          title: Text('Card Item'), // Corrected title
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            print('Tapped on $index'); // Corrected index
          },
        );
      },
    );
  }
}
