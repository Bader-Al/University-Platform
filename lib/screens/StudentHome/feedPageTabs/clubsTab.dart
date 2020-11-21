import 'package:flutter/material.dart';
import 'package:psu_platform/screens/StudentHome/homeWidgets/SharedWidgets/draggableBottomSheet.dart';
import 'package:psu_platform/screens/StudentHome/homeWidgets/feedWidgets/clubsTabWidgets/clubsGrid.dart';

class ClubsTab extends StatelessWidget {
  const ClubsTab(
      {@required this.distanceFromBottom,
      @required this.dbsExtent,
      @required this.dbsHeadingTextStyle,
      this.paddingFromTop = 15});
  final double distanceFromBottom, dbsExtent;
  final TextStyle dbsHeadingTextStyle;
  final paddingFromTop;

  @override
  Widget build(BuildContext context) {
    final minorFlexFactor = 1;
    final majorFlexFactor = 5;
    return Stack(
      children: <Widget>[
        Positioned(
          child: Container(
            width: 500,
            height: 700,
            child: ClubsGrid(),
          ),
          bottom: distanceFromBottom + 70,
          top: paddingFromTop,
          right: 0,
          left: 0,
        ),
        Positioned(
            child: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: Text("Clubs".toUpperCase(), style: dbsHeadingTextStyle),
            ),
            bottom: distanceFromBottom * 0.9),
        DraggableBottomSheet(
          title: "Robotics and IOT",
          initialExtent: dbsExtent,
          minExtent: dbsExtent,
          pageIndex: 0,
          pageContent: [Text("data"), Text("data")],
          horizontalPadding: 2,
        ),
      ],
    );
  }
}
