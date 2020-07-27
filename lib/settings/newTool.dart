import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class NewTool extends StatelessWidget {
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
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                AutoSizeText(
                  'Add another one',
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          alignment: Alignment.center,
        ),
        color: Colors.brown,
        onPressed: () {},
      ),
    );
  }
}
