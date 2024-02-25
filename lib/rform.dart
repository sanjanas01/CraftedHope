import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'top.dart';
import 'bottom.dart';
import 'about.dart';
import 'thanks.dart';

void main() {
  runApp(MaterialApp(
    home: rform(),
  ));
}

class rform extends StatefulWidget {
  @override
  _rformState createState() => _rformState();
}

class _rformState extends State<rform> {
  final _dateController = TextEditingController();
  bool _otherSelected = false;
  bool _cottonSelected = false;
  bool _rayonSelected = false;
  bool _woollenSelected = false;
  bool _polyesterSelected = false;
  bool _silkSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20), // Add some space at the top
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Contact Number',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Date to Pickup',
                    ),
                    controller: _dateController,
                    readOnly: true,
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(DateTime.now().year + 1),
                      );
                      if (date != null) {
                        _dateController.text = DateFormat('dd-MM-yyyy').format(date);
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Address',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Time to Pickup',
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('What material'),
                  ),
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    childAspectRatio: 3,
                    children: <Widget>[
                      CheckboxListTile(
                        title: Text('Cotton'),
                        value: _cottonSelected,
                        onChanged: (bool? value) {
                          setState(() {
                            _cottonSelected = value ?? false;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Text('Rayon'),
                        value: _rayonSelected,
                        onChanged: (bool? value) {
                          setState(() {
                            _rayonSelected = value ?? false;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Text('Woollen'),
                        value: _woollenSelected,
                        onChanged: (bool? value) {
                          setState(() {
                            _woollenSelected = value ?? false;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Text('Polyester'),
                        value: _polyesterSelected,
                        onChanged: (bool? value) {
                          setState(() {
                            _polyesterSelected = value ?? false;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Text('Silk'),
                        value: _silkSelected,
                        onChanged: (bool? value) {
                          setState(() {
                            _silkSelected = value ?? false;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Text('Other'),
                        value: _otherSelected,
                        onChanged: (bool? value) {
                          setState(() {
                            _otherSelected = value ?? false;
                          });
                        },
                      ),
                    ],
                  ),
                  _otherSelected ? TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Material',
                    ),
                  ) : Container(),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ThankYouPage()),
                      );
                      Future.delayed(Duration(seconds: 8), () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AboutUsPage()),
                        );
                      });
                    },
                    child: Text(
                      'Recycle Now',
                      style: TextStyle(
                        fontFamily: 'Gabriela-Regular',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}