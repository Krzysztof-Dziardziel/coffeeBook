import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CoffeeTool extends StatefulWidget {
  CoffeeTool(
      {@required this.name, this.isAvailable = false, this.isText = true});
  final String name;
  bool isAvailable;
  bool isText;
  @override
  _CoffeeToolState createState() => _CoffeeToolState();
}

class _CoffeeToolState extends State<CoffeeTool> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var btnWidth = width * 0.35;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        child: Container(
          height: btnWidth,
          width: btnWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/tools/${widget.name.toLowerCase()}.svg',
                color: widget.isAvailable ? Colors.white : Colors.brown,
              ),
              widget.isText
                  ? Text(
                      widget.name,
                      style: TextStyle(
                        fontSize: 20,
                        color: widget.isAvailable ? Colors.white : Colors.brown,
                      ),
                    )
                  : Container(),
            ],
          ),
          alignment: Alignment.center,
        ),
        color: widget.isAvailable ? Colors.brown : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        onPressed: () {
          setState(
            () {
              widget.isAvailable = !widget.isAvailable;
            },
          );
        },
      ),
    );
  }
}
