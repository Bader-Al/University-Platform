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
      height: 30,
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          CircleAvatar(
            // foregroundColor: Colors.red,
            backgroundColor: Theme.of(context).colorScheme.primary,

            radius:
                6, // TODO TODO TODO TODO resize to fit number when user picks up the card after certain extent

            // child: Text(
            //   "2",
            //   style: TextStyle(color: Colors.white, fontSize: 12),
            // ),
          ),
          SizedBox(
            width: 9,
          ),
          CircleAvatar(
            // foregroundColor: Colors.yellow,
            backgroundColor: Colors.redAccent.withAlpha(35),
            radius: 6,
            // child: Text(
            //   "2",
            //   style: TextStyle(color: Colors.white, fontSize: 12),
            // ),
          ),
          SizedBox(
            width: 9,
          ),
          CircleAvatar(
            // foregroundColor: Colors.green,
            backgroundColor: kYellowIndication.withAlpha(150),
            radius: 6,
            // child: Text(
            //   "2",
            //   style: TextStyle(color: Colors.white, fontSize: 12),
            // ),
          ),
        ],
      ),
    );
  }
}
