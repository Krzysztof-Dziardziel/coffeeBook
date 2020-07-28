import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../CoffeeTool.dart';

List<CoffeeTool> icons = [
  CoffeeTool(name: 'V60', isText: false),
  CoffeeTool(name: 'Aeropress', isText: false),
  CoffeeTool(name: 'Gabi'),
  CoffeeTool(name: 'Delter'),
  CoffeeTool(name: 'Chemex', isText: false),
  CoffeeTool(name: 'Frenchpress', isText: false),
];

class NewToolMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown,
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name an item:',
                style: GoogleFonts.roboto(),
              ),
              TextFormField(
                cursorColor: Colors.brown,
                decoration: InputDecoration(
                  focusColor: Colors.brown,
                  labelText: 'Name',
                  icon: Icon(Icons.format_italic),
                ),
                onChanged: (string) {},
              ),
              Spacer(
                flex: 1,
              ),
              Text(
                'Choose an icon:',
                style: GoogleFonts.roboto(),
              ),
              Expanded(
                flex: 3,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ...icons,
                  ],
                ),
              ),
              Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
