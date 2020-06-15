import 'package:flutter/material.dart';
import 'package:psu_platform/constants.dart';
import '../homeWidgets/DashboardPageWidgets/dashboardHeader/scheduleBanner.dart';
import '../homeWidgets/DashboardPageWidgets/billboard.dart';
import '../homeWidgets/DashboardPageWidgets/quickDeadlines.dart';
import '../homeWidgets/DashboardPageWidgets/horizontal_viewers/upComingExams.dart';




class DashboardPage extends StatelessWidget {
  final List courses = [];
  ScrollController scrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: scrollController,
        headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
          return <Widget>[
            ScheduleBanner(boxIsScrolled),
          ];
        },
        body: CustomScrollView(
          slivers: <Widget>[
            DashboardPageSliver(),
          ],
        ),
      ),
    );
    
   
  }
}

class DashboardPageSliver extends StatelessWidget {
  // template.. later these blocks should take data from actual
  
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        SizedBox(
          height: 100,
        ),
        UpComingExamsViewer(
          children: cardItems,
        ),
        SizedBox(
          height: 75,
        ),
        UpComingExamsViewer(
          children: cardItems,
        ),
        SizedBox(
          height: 75,
        ),
         QuickDeadlines(),
        
        
        SizedBox(
          height: 75,
        ),
        Billboard(),
        SizedBox(
          height: 50,
        ),
      ]),
    );
  }
}

List cardItems = [
  
  CardItem(courseFullTitle: "CS 112", daysLeft: 7,),
  CardItem(courseFullTitle: "CS 112", daysLeft: 7,),
  CardItem(courseFullTitle: "CS 112", daysLeft: 7,),
  CardItem(courseFullTitle: "CS 112", daysLeft: 7,),
  CardItem(courseFullTitle: "CS 112", daysLeft: 7,),
];

