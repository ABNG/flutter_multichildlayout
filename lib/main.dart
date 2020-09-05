import 'package:flutter/material.dart';
import 'package:flutter_doc_test_app/next_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Baseline(
                      baseline: 20.0,
                      baselineType: TextBaseline.alphabetic,
                      child: Text("First")),
                  Text(
                    "Second",
                    textScaleFactor: 2.0,
                  ),
                ],
              ),
              Container(
                width: 200,
                height: 200,
                color: Colors.black38,
                child: UnconstrainedBox(
                  //best example https://www.woolha.com/tutorials/flutter-using-unconstrainedbox-widget-examples
                  child: RaisedButton(
                    //we can also wrap RaisedButton with SizedBox(width:100,height:50) inside unconstrainedBox
                    color: Colors.teal,
                    child: Text(
                      "google",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: CustomMultiChildLayout(
                  delegate: MyLayoutDelegate(position: Offset.zero),
                  children: <Widget>[
                    LayoutId(
                      id: 1,
                      child: Text("Widget One"),
                    ),
                    LayoutId(
                      id: 2,
                      child: Text("Widget Two"),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CustomSingleChildLayout(
                  delegate: MySingleLayoutDelegate(position: Offset.zero),
                  child: Text("Single Child"),
                ),
              ),
              RaisedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => NextScreen())),
                child: Text("Next Screen"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyLayoutDelegate extends MultiChildLayoutDelegate {
  final Offset position;

  MyLayoutDelegate({this.position});

  @override
  void performLayout(Size size) {
    // TODO: implement performLayout
    Size leadingSize = Size.zero;
    if (hasChild(1)) {
      leadingSize =
          layoutChild(1, BoxConstraints.loose(size)); //give size of child
    }
    if (hasChild(2)) {
      final secondSize =
          layoutChild(2, BoxConstraints.loose(size)); //give size of child
      positionChild(2,
          Offset(leadingSize.width, size.height / 2 - secondSize.height / 2));
    }
  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) {
    // TODO: implement shouldRelayout
    return true;
  }
}

class MySingleLayoutDelegate extends SingleChildLayoutDelegate {
  final Offset position;

  MySingleLayoutDelegate({this.position});
  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    // TODO: implement getConstraintsForChild
    return BoxConstraints.loose(super.getSize(constraints));
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    // TODO: implement getPositionForChild
    return Offset(100, size.height / 2 - childSize.height / 2);
  }

  @override
  bool shouldRelayout(SingleChildLayoutDelegate oldDelegate) {
    // TODO: implement shouldRelayout
    return true;
  }
}
