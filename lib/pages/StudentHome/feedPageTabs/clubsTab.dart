import 'package:flutter/material.dart';
import 'package:psu_platform/pages/homeWidgets/SharedWidgets/draggableBottomSheet.dart';

class ClubsTab extends StatelessWidget {
  const ClubsTab();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          child: Container(
            width: MediaQuery.of(context).size.width, alignment: Alignment.center,
            child: Text("Clubs".toUpperCase(), style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Theme.of(context).colorScheme.onPrimary),), ), bottom: MediaQuery.of(context).size.height*0.2 ,),

        DraggableBottomSheet(
          title: "Robotics and IOT",
          pageIndex: 0,
          pageContent: [Text("data"), Text("data")],
          horizontalPadding: 2,
        ),
      ],
    );
  }
}