import 'package:flutter/material.dart';
import 'package:psu_platform/pages/homeWidgets/SharedWidgets/draggableBottomSheet.dart';

class ColabTab extends StatelessWidget {
  const ColabTab(
      {@required this.distanceFromBottom,
      @required this.dbsExtent,
      @required this.dbsHeadingTextStyle,
      this.paddingFromTop = 15});
  final double distanceFromBottom, dbsExtent;
  final TextStyle dbsHeadingTextStyle;
  final double paddingFromTop;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          child: Container(
            color: Colors.red,
            child: Text("data", style: TextStyle(color: Colors.black)),
          ),
          left: 0,
          right: 0,
          top: paddingFromTop,
        ),
        returnDbsHeading(context),
        DraggableBottomSheet(
          title: "Robotics and IOT",
          minExtent: dbsExtent,
          initialExtent: dbsExtent,
          pageIndex: 0,
          pageContent: [Text("data"), Text("data")],
          horizontalPadding: 2,
        ),
      ],
    );
  }

  Widget returnDbsHeading(context) {
    return Positioned(
      child: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Text("IDK".toUpperCase(), style: dbsHeadingTextStyle),
      ),
      bottom: distanceFromBottom * 0.9,
    );
  }
}
