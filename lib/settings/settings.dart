import 'package:coffeebook/database/databaseHelpers.dart';
import 'package:coffeebook/settings/yourSet.dart';
import 'package:flutter/material.dart';

import 'grindParameters.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: width * 0.02, right: width * 0.02),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            GrindParameters(),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                child: Text('Your brewing set'),
                color: Colors.brown,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => YourSet()));
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                child: Text('Delete DB'),
                color: Colors.brown,
                onPressed: () {
                  DatabaseHelpers db = DatabaseHelpers();
                  db.clean();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
