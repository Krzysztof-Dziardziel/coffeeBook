import 'package:flutter/material.dart';

//POSSIBLE ITEMS:
List<String> items = [
  'V60',
  'AeroPress',
  'Gabi',
  'Delter',
  'Chemex',
  'Hourglass(?)',
  'Frenchpress'
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
                CoffeeTool(name: 'V60'),
                CoffeeTool(name: 'Aeropress'),
                CoffeeTool(name: 'Gabi'),
                CoffeeTool(name: 'Delter'),
                CoffeeTool(name: 'Chemex'),
                CoffeeTool(name: 'Frenchpress'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CoffeeTool extends StatefulWidget {
  CoffeeTool({@required this.name, this.isAvailable = false});
  final String name;
  bool isAvailable;
  @override
  _CoffeeToolState createState() => _CoffeeToolState();
}

class _CoffeeToolState extends State<CoffeeTool> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var btnWidth = width * 0.35;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        child: Container(
          height: btnWidth,
          width: btnWidth,
          child: Text(
            widget.name,
            style: TextStyle(fontSize: 20),
          ),
          alignment: Alignment.center,
        ),
        color: widget.isAvailable ? Colors.brown : Colors.white,
        onPressed: () {
          setState(
            () {
              widget.isAvailable = !widget.isAvailable;
            },
          );
        },
      ),
    );
  }
}
