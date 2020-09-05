import 'package:flutter/material.dart';

class NextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Next Screen")),
      body: Column(
        children: <Widget>[
          Container(
            width: 200.0,
            height: 200.0,
            color: Colors.blue[50],
            child: Align(
              alignment: Alignment(1.0, 1.0),
              child: SizedBox.shrink(
                child: OverflowBox(
                  //directly alignment not work that's why use sizedbox
                  minWidth: 0,
                  maxWidth: 100.0,
                  minHeight: 0,
                  maxHeight: 50,
                  child: Container(
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            color: Colors.blue[50],
            child: SizedOverflowBox(
              //here alignment work
              size: const Size(100.0, 100.0),
              alignment: Alignment.centerLeft,
              child: Container(
                height: 50.0,
                width: 150.0,
                color: Colors.blue,
              ),
            ),
          )
        ],
      ),
    );
  }
}
