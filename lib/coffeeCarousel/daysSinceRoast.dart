import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class DaysSinceRoast extends StatelessWidget {
  DaysSinceRoast({this.daysSinceRoast = 26});
  final int daysSinceRoast;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Color color = Colors.black;
    return Container(
        height: height * 0.15,
        width: width * 0.2,
        decoration: ShapeDecoration(
          color: Color.fromRGBO(236, 228, 183, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 2, right: 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Flexible(
                flex: 3,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(daysSinceRoast.toString(),
                      style: TextStyle(fontSize: 2000)),
                ),
              ),
              Flexible(
                flex: 2,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Column(
                      children: <Widget>[
                        AutoSizeText(
                          'DAYS',
                          style: TextStyle(
                            fontSize: 20,
                            color: color,
                          ),
                        ),
                        AutoSizeText(
                          'SINCE ROAST',
                          style: TextStyle(
                            color: color,
                          ),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
