import 'package:flutter/material.dart';
import 'quickCalendar.dart';
import '../../../../constants.dart';

class ScheduleBanner extends StatelessWidget {
  ScheduleBanner(this.boxIsScrolled);
  final bool boxIsScrolled;
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return SliverAppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      expandedHeight: queryData.size.height * 0.80,
      floating: false,
      pinned: true,
      snap: false,
      centerTitle: true,
      titleSpacing: 0,
      title: SecondaryAppBarRow(),
      
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: <Widget>[
      //     //SecondaryAppBarRow(),
      //     SizedBox(height:10),
      //     PrimaryAppBarRow(
      //       color: Theme.of(context).colorScheme.background,
      //       noPlaceHolders: true,
      //     )
      //   ],
      // ),
      bottom: AppBar( 
          titleSpacing: 0,
          elevation: 1,
          title: PrimaryAppBarRow(isFlipped: true,),
          shape: kAppBarShape,
          backgroundColor: Theme.of(context).colorScheme.background),
      flexibleSpace: FlexibleSpaceBar(
        // title: Container(height: 100, width: 100, color: Colors.red,child: Text("data")),
        collapseMode: CollapseMode.parallax,

        background: QuickCalendar(),
      ),
      shape: kAppBarShape,
      elevation: 1,
    );
  }
}

class PrimaryAppBarRow extends StatelessWidget {
  PrimaryAppBarRow({this.justThePlacerHolders = false, this.color, this.noPlaceHolders = false, this.showNextClass=false, this.isFlipped=false});
  final bool justThePlacerHolders, noPlaceHolders, showNextClass, isFlipped;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0, left: 30),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Container(child:Icon(Icons.drag_handle, color: Theme.of(context).colorScheme.primary,), color: Colors.red, height: 60,),
              // Container(height:2 , width: 12, decoration: BoxDecoration(
              //   borderRadius:BorderRadius.horizontal(right: Radius.circular(25)),
              //   color: Theme.of(context).colorScheme.primary
              // ),),
              BannerColumn(
                placeHolder: "ABSENCES",
                value:  "2/16",
                color: this.color,
                justPlaceHolders: this.justThePlacerHolders,
                noPlaceHolders: this.noPlaceHolders,
                isFlipped: this.isFlipped,
              ), //TODO

              BannerColumn(
                placeHolder: "LOCATION",
                value: "New Building", // TODO ONCLICK FLIP NAMING CONVENTION
                color: this.color,
                justPlaceHolders: this.justThePlacerHolders,
                noPlaceHolders: this.noPlaceHolders,
                isFlipped: this.isFlipped,
              ),
              //add option in settings to choose which building convention they want highlighted

              BannerColumn(
                placeHolder: "ROOM",
                value:  "A-12",
                color: this.color,
                justPlaceHolders: this.justThePlacerHolders,
                noPlaceHolders: this.noPlaceHolders,
                isFlipped: this.isFlipped,
              ),

              BannerColumn(
                placeHolder: "TIME",
                value: "1:50 pm",
                color: this.color,
                justPlaceHolders: this.justThePlacerHolders,
                noPlaceHolders: this.noPlaceHolders,
                isFlipped: this.isFlipped,
              ), //TODO
              
            ],
          ),
        ],
      ),
    );
  }
}

class SecondaryAppBarRow extends StatelessWidget {
  final Color color;
  SecondaryAppBarRow({this.color});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0, left: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          SizedBox(height: 20),
          // Container(
          //   padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          //   //decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Theme.of(context).colorScheme.primary),
          //   child: Text(
          //   "Next Class",
          //   style: TextStyle(fontSize: 14 , color: Theme.of(context).colorScheme.background, fontWeight: FontWeight.w300),
          // ),
          // ),
          Container(
            //decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Theme.of(context).colorScheme.primary),
            child: Text(
              "Next Class : CS285",
              style: TextStyle(
                  fontSize: 14,
                  color: color??Theme.of(context).colorScheme.background,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ],
      ),
    );
  }
}

class BannerColumn extends StatelessWidget {
  final String placeHolder;
  final String value;
  final Color color;
  final bool justPlaceHolders;
  final bool noPlaceHolders;
  final bool isFlipped;

  BannerColumn(
      { this.value,
      @required this.placeHolder,
      this.color,
      this.justPlaceHolders = false,
      this.noPlaceHolders = false,
      this.isFlipped = false
      });

  @override
  Widget build(BuildContext context) {
    final TextStyle smallText = TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w300,
        color: this.color ??
            Theme.of(context).colorScheme.primary.withOpacity(0.7));
    final TextStyle bigText = TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: this.color?? Theme.of(context).colorScheme.primary);

    return Padding(
      padding: const EdgeInsets.only(
          left: 5.0), // there is a previous 10px idk where so this makes 15 PX
      child: 
      justPlaceHolders? Text(
            "$placeHolder",
            style: smallText,
          ) :
      
       noPlaceHolders? Column(
         children: <Widget>[
           SizedBox(height: 25,),
           Text(
                "$value",
                style: color !=null? bigText.copyWith(color: color) : bigText,
              ),
         ],
       ):
      !isFlipped?
      
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "$placeHolder",
            style: smallText,
          ) ,
          SizedBox(
            height: 2,
          ),
          Text(
            "$value",
            style: bigText,
          )  
        ],
      ):
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "$value",
            style: bigText,
          ) ,
          SizedBox(
            height: 2,
          ),
          Text(
            "$placeHolder",
            style: smallText,
          )  
        ],
      )

    );
    
  }
}





/////////////////////////////////////////////////////
///
///
///
/// stashed

// SliverAppBar(
//       backgroundColor: Theme.of(context).colorScheme.primary,
//       expandedHeight: queryData.size.height * 0.80,
//       floating: false,
//       pinned: true,
//       snap: false,
//       centerTitle: true,
//       titleSpacing: 0,
//       title: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           //SecondaryAppBarRow(),
//           SizedBox(height:10),
//           PrimaryAppBarRow(
//             color: Theme.of(context).colorScheme.background,
//             noPlaceHolders: true,
//           )
//         ],
//       ),
//       bottom: AppBar(
//           titleSpacing: 0,
//           elevation: 1,
//           title: Container(
//             child: Column(
//               children: <Widget>[
//                 PrimaryAppBarRow(justThePlacerHolders: true,color: Theme.of(context).colorScheme.primary,),
//                 SecondaryAppBarRow(color: Theme.of(context).colorScheme.primary,)
//               ],
//             ),
//           ),
//           shape: kAppBarShape,
//           backgroundColor: Theme.of(context).colorScheme.background),
//       flexibleSpace: FlexibleSpaceBar(
//         // title: Container(height: 100, width: 100, color: Colors.red,child: Text("data")),
//         collapseMode: CollapseMode.parallax,

//         background: QuickCalendar(),
//       ),
//       shape: kAppBarShape,
//       elevation: 1,
//     );