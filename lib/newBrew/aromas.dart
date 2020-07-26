import 'package:flutter/material.dart';

class Aromas extends StatefulWidget {
  @override
  _AromasState createState() => _AromasState();
}

class _AromasState extends State<Aromas> {
  List<bool> isSelected = [false, false, false];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ToggleButtons(
        children: <Widget>[
          Text('Floral'),
          Text('Earthy'),
          Text('Freakin\' delicious'),
        ],
        onPressed: (int index) {
          setState(() {
            isSelected[index] = !isSelected[index];
          });
        },
        isSelected: isSelected,
      ),
    );
  }
}
