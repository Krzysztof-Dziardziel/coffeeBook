import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:coffeebook/newCoffee/countries.dart';
import 'package:flutter/material.dart';

class CountrySelector extends StatefulWidget {
  final onChanged;
  const CountrySelector({Key key, this.onChanged}) : super(key: key);
  @override
  _CountrySelectorState createState() => _CountrySelectorState();
}

class _CountrySelectorState extends State<CountrySelector> {
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SimpleAutoCompleteTextField(
      decoration:
          InputDecoration(labelText: 'Country', icon: Icon(Icons.public)),
      key: key,
      suggestions: countries,
      textChanged: widget.onChanged,
      clearOnSubmit: false,
    );
  }
}
