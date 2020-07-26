import 'package:coffeebook/brews/brews.dart';
import 'package:coffeebook/newCoffee/newCoffee.dart';
import 'package:coffeebook/coffeeCarousel/daysSinceRoast.dart';
import 'package:flutter/material.dart';

class CoffeeCard extends StatelessWidget {
  CoffeeCard({this.img, this.text, this.subtext});
  final img;
  final text;
  final subtext;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MaterialButton(
        child: Container(
            height: 0.8 * height,
            width: 1.0 * width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(img),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[DaysSinceRoast()]),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      FittedBox(
                        child: Text(
                          text,
                          style: DefaultTextStyle.of(context)
                              .style
                              .apply(fontSizeFactor: 3.0, color: Colors.white),
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          subtext,
                          style: DefaultTextStyle.of(context)
                              .style
                              .apply(fontSizeFactor: 2.0, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Brews()));
        },
        onLongPress: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NewCoffee()));
        });
  }
}
