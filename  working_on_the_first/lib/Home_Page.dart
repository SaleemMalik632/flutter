// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:ui';

class TextPage extends StatefulWidget {
  @override
  State<TextPage> createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  String dropdownvalue = 'Item 1';
  List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];
  int selectedOption = 0;
  bool status = false;
  double _value = 10.0;
  String imageUrl =
      'https://images.unsplash.com/photo-1630519473475-7f4c9e6d9d9f?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzNnx8fHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1';
  Future<http.Response> _fetchImage() {
    return http.get(Uri.parse(imageUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Assignment'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: Text('Calculater')),
            SizedBox(height: 20),
            Text('Dropdown Button'),
            DropdownButton(
              isExpanded: true,
              value: dropdownvalue,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
            SizedBox(height: 20),
            Text('Text Field'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your name',
                ),
              ),
            ),
            SizedBox(height: 20),
            Text('Radio Button'),
            ListTile(
              title: const Text('Option 1'),
              leading: Radio(
                value: 1,
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Option 2'),
              leading: Radio(
                value: 2,
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Option 3'),
              leading: Radio(
                value: 3,
                groupValue: selectedOption,
                onChanged: (value) {
                  setState(() {
                    selectedOption = value!;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            Text('Switch'),
            FlutterSwitch(
              activeColor: Colors.green,
              width: 80.0,
              height: 40.0,
              valueFontSize: 15,
              toggleSize: 25.0,
              value: status,
              borderRadius: 15.0,
              showOnOff: true,
              onToggle: (val) {
                setState(() {
                  status = val;
                });
              },
            ),
            SizedBox(height: 20),
            Text('Slider'),
            Slider(
              value: _value,
              min: 0.0,
              max: 100.0,
              divisions: 5,
              label: _value.toString(),
              onChanged: (double val) {
                setState(() {
                  _value = val;
                });
              },
            ),
            Text('Date Picker'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2025),
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.calendar_today), // Calendar icon
                  SizedBox(width: 8), // Add some spacing
                ],
              ),
            ),
            SizedBox(height: 20),
            Text('Time Picker'),
            ElevatedButton(
              onPressed: () {
                showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.access_time), // Calendar icon
                  SizedBox(width: 8), // Add some spacing
                ],
              ),
            ),
            SizedBox(height: 20),
            Text('Alert Dialog'),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Alert Dialog'),
                      content: Text('This is an alert dialog'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Show Alert Dialog'),
            ),
            SizedBox(height: 20),
            Text('Bottom Sheet'),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 200,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Bottom Sheet'),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Close Bottom Sheet'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Text('Show Bottom Sheet'),
            ),
            SizedBox(height: 20),
            Text('Expansion Panel'),
            ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {},
              children: [
                ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      title: Text('Expansion Panel'),
                    );
                  },
                  body: ListTile(
                    title: Text('This is an expansion panel'),
                    subtitle: Text('To close, tap this text'),
                  ),
                  isExpanded: true,
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('Chip'),
            Chip(
              label: Text('This is a chip'),
            ),
            SizedBox(height: 20),
            Text('Tooltip'),
            Tooltip(
              message: 'This is a tooltip',
              child: Icon(Icons.info),
            ),
            SizedBox(height: 20),
            Text('Card'),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: Icon(Icons.album),
                    title: Text('Card'),
                    subtitle: Text('This is a card'),
                  ),
                  ButtonBar(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text('Buy'),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('Cancel'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text('Linear Progress Indicator'),
            LinearProgressIndicator(
              value: 0.5,
            ),
            SizedBox(height: 20),
            Text('Circular Progress Indicator'),
            CircularProgressIndicator(
              value: 0.5,
            ),
            SizedBox(height: 20),
            Text('image picker'),
            ElevatedButton(
              onPressed: () async {
                final ImagePicker _picker = ImagePicker();
                final XFile? image = await _picker.pickImage(
                  source: ImageSource.gallery,
                );
                print(image!.path);
              },
              child: Text('Pick Image'),
            ),
            SizedBox(height: 20),
            Text('Image'),
            Image.network(
              'https://picsum.photos/250?image=9',
            ),
            SizedBox(height: 20),
            Text('Rich Text'),
            RichText(
              overflow: TextOverflow.clip,
              textAlign: TextAlign.end,
              textDirection: TextDirection.rtl,
              softWrap: true,
              maxLines: 1,
              textScaleFactor: 1, // 1.5x size
              text: TextSpan(
                text: 'Hello ',
                style: DefaultTextStyle.of(context).style,
                children: const <TextSpan>[
                  TextSpan(
                      text: 'Saleem Malik',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text('Table'),
            Table(border: TableBorder.all(), children: [
              TableRow(
                children: [
                  Text('Name'),
                  Text('Saleem'),
                ],
              ),
              TableRow(
                children: [
                  Text('Name'),
                  Text('Malik'),
                ],
              ),
            ]),
            SizedBox(height: 20),
            Text('Wrap'),
            Wrap(
              spacing: 8.0, // gap between adjacent chips
              runSpacing: 4.0, // gap between lines
              children: [
                Chip(
                  avatar: CircleAvatar(
                      backgroundColor: Colors.blue.shade900, child: Text('AH')),
                  label: Text('Hamilton'),
                ),
                Chip(
                  avatar: CircleAvatar(
                      backgroundColor: Colors.blue.shade900, child: Text('ML')),
                  label: Text('Lafayette'),
                ),
                Chip(
                  avatar: CircleAvatar(
                      backgroundColor: Colors.blue.shade900, child: Text('HM')),
                  label: Text('Mulligan'),
                ),
                Chip(
                  avatar: CircleAvatar(
                      backgroundColor: Colors.blue.shade900, child: Text('JL')),
                  label: Text('Laurens'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('List View'),
            ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  leading: Icon(Icons.album),
                  title: Text('List View'),
                  subtitle: Text('This is a list view'),
                ),
                ListTile(
                  leading: Icon(Icons.album),
                  title: Text('List View'),
                  subtitle: Text('This is a list view'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('Flexible'),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    color: Colors.red,
                    height: 100,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    color: Colors.green,
                    height: 100,
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    color: Colors.blue,
                    height: 100,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('Expanded'),
            Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.red,
                    height: 100,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.green,
                    height: 100,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.blue,
                    height: 100,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('LimitedBox'),
            Row(
              children: [
                LimitedBox(
                  maxWidth: 100,
                  child: Container(
                    color: Colors.red,
                    height: 100,
                  ),
                ),
                LimitedBox(
                  maxWidth: 100,
                  child: Container(
                    color: Colors.green,
                    height: 100,
                  ),
                ),
                LimitedBox(
                  maxWidth: 100,
                  child: Container(
                    color: Colors.blue,
                    height: 100,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('AnimatedCrossFade'),
            AnimatedCrossFade(
              duration: const Duration(seconds: 3),
              firstChild: const FlutterLogo(
                  style: FlutterLogoStyle.horizontal, size: 100.0),
              secondChild: const FlutterLogo(
                  style: FlutterLogoStyle.stacked, size: 100.0),
              crossFadeState: CrossFadeState.showFirst,
            ),
            SizedBox(height: 20),
            Text('AnimatedOpacity'),
            AnimatedOpacity(
              opacity: 0.5,
              duration: Duration(seconds: 3),
              child:
                  FlutterLogo(style: FlutterLogoStyle.horizontal, size: 100.0),
            ),
            SizedBox(height: 20),
            Text('Menu Button'),
            PopupMenuButton(
              icon: Icon(Icons.menu),
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Text('Item 1'),
                  ),
                  PopupMenuItem(
                    child: Text('Item 2'),
                  ),
                  PopupMenuItem(
                    child: Text('Item 3'),
                  ),
                ];
              },
            ),
            SizedBox(height: 20),
            Text('devider'),
            Divider(
              color: Colors.black,
              thickness: 2,
            ),
            SizedBox(height: 20),
            Text('image filter'),
            ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Image.network(
                'https://picsum.photos/250?image=91',
              ),
            ),
            ColorFiltered(
              colorFilter:
                  const ColorFilter.mode(Colors.grey, BlendMode.saturation),
              child: Image.network(
                'https://picsum.photos/250?image=91',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
