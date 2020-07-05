import 'package:flutter/material.dart';

import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'package:psu_platform/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ColorBasedTabs extends StatelessWidget {
  ColorBasedTabs({this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Stack(
        children: <Widget>[
          //Positioned(top: 12, right: 0, child: circlesRow(context)),
          Positioned(
            right: 0,
            top: 12,
            child: SmoothPageIndicator(
              controller: pageController,
              count: 3,
              effect: WormEffect(
                  dotHeight: 12,
                  dotWidth: 12,
                  activeDotColor: Theme.of(context).colorScheme.background,
                  dotColor: Theme.of(context).colorScheme.primary),
            ),
          )
        ],
      ),
    );
  }

  Widget circlesRow(context) {
    return Row(
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
          backgroundColor: Theme.of(context).colorScheme.secondary,
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
          backgroundColor: Colors.redAccent,
          radius: 6,
          // child: Text(
          //   "2",
          //   style: TextStyle(color: Colors.white, fontSize: 12),
          // ),
        ),
      ],
    );
  }
}
