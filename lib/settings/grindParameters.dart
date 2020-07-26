import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GrindParameters extends StatefulWidget {
  @override
  _GrindParametersState createState() => _GrindParametersState();
}

class _GrindParametersState extends State<GrindParameters> {
  // SharedPreferences preferences = await SharedPreferences.getInstance();
  // String min = preferences.getInt('MIN').toString();
  getMin() async {
    final prefs = await SharedPreferences.getInstance();
    final min = prefs.getString('MIN');
    return min;
  }

  setMin(newMin) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('MIN', newMin);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Align(
            child: Text('Grinder Settings'),
            alignment: Alignment.centerLeft,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: width * 0.1,
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'MIN'),
                  initialValue: getMin().toString(),
                  onChanged: (String newMin) => setMin(newMin),
                ),
              ),
              Container(
                width: width * 0.1,
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'MAX'),
                ),
              ),
              Container(
                width: width * 0.2,
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'INTERVAL'),
                ),
              ),
            ],
          ),
        ]);
  }
}
