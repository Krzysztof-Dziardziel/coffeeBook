import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ParameterSlider extends StatefulWidget {
  ParameterSlider({this.parameterVal = 5});
  final double parameterVal;
  @override
  _ParameterSliderState createState() => _ParameterSliderState();
}

class _ParameterSliderState extends State<ParameterSlider> {
  double parameterVal = 5;

  @override
  Widget build(BuildContext context) {
    return Slider(
      min: 0,
      max: 10,
      value: parameterVal,
      onChanged: (newParameterVal) {
        setState(() {
          parameterVal = newParameterVal;
        });
      },
      divisions: 10,
      label: "$parameterVal",
    );
  }
}
