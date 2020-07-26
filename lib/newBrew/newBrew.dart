import 'package:coffeebook/newBrew/parameterSlider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'aromas.dart';

class NewBrew extends StatefulWidget {
  @override
  _NewBrewState createState() => _NewBrewState();
}

class _NewBrewState extends State<NewBrew> {
  List<bool> isSelected = [false, false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              backgroundColor: Colors.brown,
              child: Icon(Icons.add),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Not done yet :('),
                    actions: <Widget>[
                      MaterialButton(
                        child: const Text('K. Heading back to work'),
                        color: Colors.blue,
                        onPressed: () {
                          Navigator.pop(context, 'ok');
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 8),
          children: <Widget>[
            Text(
              'Parameters:',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 30),
            ),
            Spacer(),
            Text(
              'Fragrance:',
            ),
            ParameterSlider(),
            Spacer(),
            Text(
              'Aroma:',
            ),
            ParameterSlider(),
            Spacer(),
            Text(
              'Flavor:',
            ),
            ParameterSlider(),
            Spacer(),
            Text(
              'Body:',
            ),
            ParameterSlider(),
            Spacer(),
            Text(
              'Acidity:',
            ),
            ParameterSlider(),
            Spacer(),
            Text(
              'Aftertaste:',
            ),
            ParameterSlider(),
            Spacer(),
            Aromas(),
          ],
        ),
      ),
    );
  }
}
