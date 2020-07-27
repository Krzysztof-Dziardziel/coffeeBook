import 'package:flutter/material.dart';
import 'CoffeeTool.dart';

//POSSIBLE ITEMS:
List<CoffeeTool> items = [
  CoffeeTool(name: 'V60'),
  CoffeeTool(name: 'Aeropress'),
  CoffeeTool(name: 'Gabi'),
  CoffeeTool(name: 'Delter'),
  CoffeeTool(name: 'Chemex'),
  CoffeeTool(name: 'Frenchpress'),
];

class YourSet extends StatefulWidget {
  @override
  _YourSetState createState() => _YourSetState();
}

class _YourSetState extends State<YourSet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              children: <Widget>[
                ...items,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
