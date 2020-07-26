import 'package:flutter/material.dart';

class ToggleBtn extends StatefulWidget {
  @override
  _ToggleBtnState createState() => _ToggleBtnState();
}

class _ToggleBtnState extends State<ToggleBtn> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var btnWidth = width * 0.35;
    bool isOn = false;
    return MaterialButton(
      child: Container(
        height: btnWidth,
        width: btnWidth,
        child: Text(
          isOn.toString(),
          style: TextStyle(fontSize: 20),
        ),
        alignment: Alignment.center,
      ),
      color: isOn ? Colors.brown : Colors.white,
      onPressed: () {
        setState(
          () {
            isOn = !isOn;
          },
        );
      },
    );
  }
}
