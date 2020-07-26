import 'package:coffeebook/newCoffee/countrySelector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:coffeebook/models.dart';
import 'package:coffeebook/database/databaseHelpers.dart';

import '../main.dart';

class NewCoffee extends StatefulWidget {
  @override
  _NewCoffeeState createState() => _NewCoffeeState();
}

class _NewCoffeeState extends State<NewCoffee> {
  DatabaseHelpers db = DatabaseHelpers();
  CoffeeCardModel _coffeeCard = CoffeeCardModel();
  final dateFormat = DateFormat('yyyy-MM-dd');
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.brown,
          child: Icon(Icons.add),
          onPressed: () async {
            _coffeeCard.lastUseDate = DateTime.now().toString();
            await db.addCoffeeCard(_coffeeCard);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => (MyApp())));
          },
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CountrySelector(
                    onChanged: (String input) => _coffeeCard.country = input),
                TextFormField(
                  cursorColor: Colors.brown,
                  decoration: InputDecoration(
                    focusColor: Colors.brown,
                    labelText: 'Region',
                    icon: Icon(Icons.location_on),
                  ),
                  onChanged: (String input) => _coffeeCard.region = (input),
                ),
                TextFormField(
                  cursorColor: Colors.brown,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    focusColor: Colors.brown,
                    labelText: 'Package size',
                    icon: Icon(FontAwesome.dropbox),
                  ),
                  onChanged: (String input) =>
                      _coffeeCard.packageSize = int.parse(input),
                ),
                DateTimeField(
                    cursorColor: Colors.brown,
                    format: dateFormat,
                    decoration: InputDecoration(
                      labelText: 'Roast Date',
                      icon: Icon(Icons.calendar_today),
                    ),
                    onShowPicker: (context, currentValue) {
                      return showDatePicker(
                        context: context,
                        initialDate: currentValue ?? DateTime.now(),
                        firstDate: DateTime(1683, 9, 12),
                        lastDate: DateTime.now(),
                      );
                    },
                    onChanged: (DateTime input) =>
                        _coffeeCard.roastDate = input.toString()),
              ],
            ),
          ),
        ));
  }
}
