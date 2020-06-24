import 'package:flutter/material.dart';
import 'package:psu_platform/pages/homeWidgets/SharedWidgets/draggableBottomSheet.dart';
import 'universityTabWidgets/eventsBanner.dart';
import 'universityTabWidgets/billboardHeader.dart';

class UniversityTab extends StatelessWidget {
  const UniversityTab();
  

  @override
  Widget build(BuildContext context) {
    
    double distanceFromBottom = MediaQuery.of(context).size.height*0.2+20; 

    return Stack(
      children: <Widget>[

      //  Positioned(child: BillBoardHeader() , top: 50,),
        Positioned(child: Container(
        //  height: MediaQuery.of(context).size.height-distanceFromBottom,
          // color:Colors.red,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
             BillBoardHeader(5),
              SizedBox(height:20),
             UniversityEventsHighlightsBanner(8), // the Ints passed in are the FLEX FACTOR FOR EXPANDED!!!
            ],
          ),
        ), bottom: distanceFromBottom+75, top: 50,left: 0, right: 0,), // value added to the right is like padding between this and tabselector

        Positioned(
          child: Container(
            width: MediaQuery.of(context).size.width, alignment: Alignment.center,
            child: Text("University".toUpperCase(), style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16, color: Theme.of(context).colorScheme.onPrimary),), ), bottom: MediaQuery.of(context).size.height*0.2 ,),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: DraggableBottomSheet(
            pageIndex: 0,
            pageContent: [Text("data"), Text("data")],
          ),
        ),
      ],
    );
  }
}
