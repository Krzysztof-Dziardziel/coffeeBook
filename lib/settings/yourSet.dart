import 'package:coffeebook/settings/toggleBtn.dart';
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
  bool aero = false;
  bool v60 = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var btnWidth = width * 0.35;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  MaterialButton(
                    child: Container(
                      height: btnWidth,
                      width: btnWidth,
                      child: Text(
                        'V60',
                        style: TextStyle(fontSize: 20),
                      ),
                      alignment: Alignment.center,
                    ),
                    color: v60 ? Colors.brown : Colors.white,
                    onPressed: () {
                      setState(
                        () {
                          v60 = !v60;
                        },
                      );
                    },
                  ),
                  MaterialButton(
                    child: Container(
                      height: btnWidth,
                      width: btnWidth,
                      child: Text(
                        'AeroPress',
                        style: TextStyle(fontSize: 20),
                      ),
                      alignment: Alignment.center,
                    ),
                    color: aero ? Colors.brown : Colors.white,
                    onPressed: () {
                      setState(
                        () {
                          aero = !aero;
                        },
                      );
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ToggleBtn(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
