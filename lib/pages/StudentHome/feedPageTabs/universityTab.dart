import 'package:flutter/material.dart';
import 'package:psu_platform/pages/homeWidgets/DashboardPageWidgets/billboard.dart';
import 'package:psu_platform/pages/homeWidgets/feedWidgets/draggableBottomSheet.dart';
import 'universityTabWidgets/eventsBanner.dart';
import 'universityTabWidgets/billboardHeader.dart';

class UniversityTab extends StatelessWidget {
  
  

  @override
  Widget build(BuildContext context) {
    
    double distanceFromBottom = MediaQuery.of(context).size.height*0.2+60; 

    return Stack(
      children: <Widget>[

      //  Positioned(child: BillBoardHeader() , top: 50,),
        Positioned(child: Container(
        //  height: MediaQuery.of(context).size.height-distanceFromBottom,
          // color:Colors.red,
          child: Column(
            children: <Widget>[
              BillBoardHeader(4),
              SizedBox(height:30),
              UniversityEventsHighlightsBanner(9), // the Ints passed in are the FLEX FACTOR FOR EXPANDED!!!
            ],
          ),
        ), bottom: distanceFromBottom+75, top: 50,left: 0, right: 0,), // value added to the right is like padding between this and tabselector

        Positioned(
          child: Container(
            width: MediaQuery.of(context).size.width, alignment: Alignment.center,
            child: Text("University".toUpperCase(), style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Theme.of(context).colorScheme.onPrimary),), ), bottom: MediaQuery.of(context).size.height*0.2 + 10,),

        DraggableBottomSheet(
          pageIndex: 0,
          pageContent: [Text("data"), Text("data")],
        ),
      ],
    );
  }
}
