import 'package:flutter/material.dart';
import 'quickCalendar.dart';
import '../../../constants.dart';

class ScheduleBanner extends StatelessWidget {
  ScheduleBanner(this.boxIsScrolled);
  final bool boxIsScrolled;
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return SliverAppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      expandedHeight: queryData.size.height*0.80,
      floating: false,
      pinned: true,
      snap: false,
      centerTitle: true,
      
      
      title: SecondaryAppBarRow(),
      bottom: AppBar(
        
        title: PrimaryAppBarRow(),
        shape: kAppBarShape,
        backgroundColor: Theme.of(context).colorScheme.background
      ),
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
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        BannerColumn(topTitle: "ABSENCES", bottomTitle: "2/16"), //TODO

        BannerColumn(
          topTitle: "LOCATION",
          bottomTitle: "New Building", // TODO ONCLICK FLIP NAMING CONVENTION
        ),
        //add option in settings to choose which building convention they want highlighted

        BannerColumn(
          topTitle: "ROOM",
          bottomTitle: "A-12",
        ),

        BannerColumn(
          topTitle: "TIME",
          bottomTitle: "1:50 pm",
        ), //TODO
      ],
    );
  }
}

class SecondaryAppBarRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Theme.of(context).colorScheme.primary),
      child: Text(
      "CS285",
      style: TextStyle(fontSize: 14 , color: Theme.of(context).colorScheme.surface),
    ),
    );
  }
}

class BannerColumn extends StatelessWidget {
  final String topTitle;
  final String bottomTitle;
  final Color color;

 
  BannerColumn(
      {@required this.bottomTitle, @required this.topTitle, this.color});

  @override
  Widget build(BuildContext context) {
     final TextStyle upperStyle = TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w300,
      color:  Theme.of(context).colorScheme.onSurface.withOpacity(0.5));
  final TextStyle lowerStyle = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, color: Theme.of(context).colorScheme.onSurface);

    return Padding(
      padding: const EdgeInsets.only(
          left: 5.0), // there is a previous 10px idk where so this makes 15 PX
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "$topTitle",
            style: upperStyle.copyWith(),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            "$bottomTitle",
            style: lowerStyle,
          )
        ],
      ),
    );
  }
}
