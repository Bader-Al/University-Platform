import 'package:flutter/material.dart';

import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'package:psu_platform/constants.dart';
import 'package:concentric_transition/concentric_transition.dart';

class ColorBasedTabs extends StatefulWidget {
  @override
  _ColorBasedTabsState createState() => _ColorBasedTabsState();
}

class _ColorBasedTabsState extends State<ColorBasedTabs>
    with SingleTickerProviderStateMixin {
  // AnimationController _animationController;
  // Animation<double> _scaleAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _animationController = new AnimationController(
    //   vsync: this,
    //   duration: Duration(microseconds: 500),
    // );
    // _scaleAnimation =
    //     Tween<double>(begin: 1, end: 1.75).animate(_animationController);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.transparent,
      child:
          //  ClipPath(
          //   clipper: ConcentricClipper(
          //     progress: 0.1, // from 0.0 to 1.0
          //     reverse: false,
          //     radius: 30.0,
          //     verticalPosition: 0.82,
          //   ),
          //   child: Container(
          //     color: Colors.green,
          //   ),
          // )

          // ConcentricPageView(
          //   colors: <Color>[Colors.white, Colors.blue, Colors.red],
          //   itemCount: 1, // null = infinity
          //   physics: NeverScrollableScrollPhysics(),
          //   itemBuilder: (int index, double value) {
          //     return Center(
          //       child: Container(
          //         child: Text('Page $index'),
          //       ),
          //     );
          //   },
          // )

          Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            // foregroundColor: Colors.red,
            backgroundColor: Theme.of(context).colorScheme.primary,

            radius:
                9, // TODO TODO TODO TODO resize to fit number when user picks up the card after certain extent
            child: Text(
              "2",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          SizedBox(
            width: 13,
          ),
          CircleAvatar(
            // foregroundColor: Colors.yellow,
            backgroundColor: Colors.redAccent,
            radius: 9,
            child: Text(
              "2",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          SizedBox(
            width: 13,
          ),
          CircleAvatar(
            // foregroundColor: Colors.green,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            radius: 9,
            child: Text(
              "2",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
