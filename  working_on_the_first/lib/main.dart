// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, sized_box_for_whitespace, must_be_immutable, sort_child_properties_last, non_constant_identifier_names, use_build_context_synchronously, prefer_const_literals_to_create_immutables, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:working_on_the_first/Wight/AddToCart.dart';
import 'dart:convert';
import 'package:working_on_the_first/home_page.dart';
import 'package:working_on_the_first/model/catalog.dart';
import 'package:working_on_the_first/Wight/ItemWight.dart';
import 'package:working_on_the_first/Wight/AddToCart.dart';
import 'package:working_on_the_first/Wight/ItemDetail.dart';
import 'package:flutter/services.dart'; // Import for rootBundle
import 'package:velocity_x/velocity_x.dart';

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

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final dumaylist = List.generate(10, (index) => CatalogModel.AllProducts[0]);
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: ListView.builder(
        itemCount: dumaylist.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: ItemWight(
              Item: dumaylist[index],
            ),
          );
        },
      ),
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
          style: TextStyle(fontSize: 50, color: Colors.red),
        )
      ]),
    );
  }
}

// Loading Json file  and show it in the card
class LoadingJson extends StatefulWidget {
  const LoadingJson({Key? key}) : super(key: key);
  @override
  State<LoadingJson> createState() => _LoadingJsonState();
}

class _LoadingJsonState extends State<LoadingJson> {
  List<Product> dataList = [];
  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  loadJsonData() async {
    try {
      final String jsonText =
          await rootBundle.loadString('assets/files/Data.json');
      final jsonData = json.decode(jsonText);
      if (jsonData['Products'] is List) {
        dataList = (jsonData['Products'] as List)
            .map((e) => Product.fromJson(e))
            .toList();
        setState(() {});
      }
    } catch (e) {
      print('Error loading JSON: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('JSON')),
        body: ListView.builder(
          itemCount: dataList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeDetails(
                          item: dataList[
                              index])), // Replace HomePage with the actual widget for your homepage
                );
              },
              child: JsonCard(Item: dataList[index]),
            );
          },
        ));
  }
}

class Product {
  final String name;
  final String price;
  final String description;
  final String imageUrl;
  Product({
    required this.name,
    required this.price,
    required this.description,
    required this.imageUrl,
  });
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      price: json['price'],
      description: json['description'],
      imageUrl: json['imageUrl'],
    );
  }
}

// gride view of all the customers
class GridViewExample extends StatefulWidget {
  const GridViewExample({Key? key}) : super(key: key);
  @override
  _GridViewExampleState createState() => _GridViewExampleState();
}

class _GridViewExampleState extends State<GridViewExample> {
  List<Product> dataList = [];
  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    try {
      final String jsonText =
          await rootBundle.loadString('assets/files/Data.json');
      final jsonData = json.decode(jsonText);
      if (jsonData['Products'] is List) {
        dataList = (jsonData['Products'] as List)
            .map((e) => Product.fromJson(e))
            .toList();
        setState(() {});
      }
    } catch (e) {
      print('Error loading JSON: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Grid View')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // You can change the number of columns here
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          return InkWell(child: JsonCard(Item: dataList[index]));
        },
      ),
    );
  }
}

class ShoppingCard extends StatefulWidget {
  @override
  _ShoppingCardState createState() => _ShoppingCardState();
}

class _ShoppingCardState extends State<ShoppingCard> {
  bool isLoading = true; // Indicates whether data is loading
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false; // Data loading is complete
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddtoCart()),
          );
        },
        child: Icon(Icons.add_shopping_cart), // Icon for "Add to Cart"
      ),
      body: Container(
        width: 400,
        height: 200,
        child: Card(
          margin: EdgeInsets.all(8.0),
          elevation: 5,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 150,
                height: 150,
                child: Image.asset('assets/images/loginpage.png'),
              ),
              // Conditional rendering of CircularProgressIndicator
              isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                      ),
                    )
                  : SizedBox(), // Hide CircularProgressIndicator once data is loaded
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      'Product Title'
                          .text
                          .color(Color.fromARGB(255, 73, 121, 160))
                          .bold
                          .xl
                          .make(),
                      SizedBox(height: 8.0),
                      'Product Description'
                          .text
                          .textStyle(context.captionStyle)
                          .make()
                          .p12(),
                      '\$99.99'.text.bold.xl.make(),
                      SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Buy'),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite_border),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
          ListTile(
            leading: Icon(
              Icons.assessment,
            ),
            title: const Text('JSON Object'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LoadingJson()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.view_agenda,
            ),
            title: const Text('Grid View'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => GridViewExample()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.shopping_cart,
            ),
            title: const Text('Shoping Cart'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ShoppingCard()));
            },
          ),
        ],
      ),
    );
  }
}
