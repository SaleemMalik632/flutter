// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:working_on_the_first/main.dart';
import 'package:working_on_the_first/model/catalog.dart';

class HomeDetails extends StatelessWidget {
  final Product item;
  const HomeDetails({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Prodect View'.text.bold.make(),
      ),
      backgroundColor:Colors.deepPurple,
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text('Buy'),
          ),
          item.price.text.bold.make(),
        ],
      ).p16(),
      body: SafeArea(
          child: Column(children: [
        Hero(tag: {item.name}, child: Image.network(item.imageUrl)).p16(),
        Expanded(
          child: VxArc(
              height: 30,
              edge: VxEdge.top,
              arcType: VxArcType.convey,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    item.name.text
                        .color(Color.fromARGB(255, 73, 121, 160))
                        .bold
                        .xl4
                        .make(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.0), // Adjust the value as needed
                      child: item.description.text.xl
                          .textStyle(context.captionStyle)
                          .make()
                          .p16(),
                    )
                  ],
                ).py64(),
              )),
        )
      ])),
    );
  }
}
