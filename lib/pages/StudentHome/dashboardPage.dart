import 'package:flutter/material.dart';
import '../homeWidgets/DashboardPageWidgets/HorizentalListViewer.dart';
import '../homeWidgets/DashboardPageWidgets/scheduleBanner.dart';
import '../homeWidgets/DashboardPageWidgets/billboard.dart';
import '../homeWidgets/DashboardPageWidgets/quickDeadlines.dart';




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
  final List courseBlocks = [
    DataBlock(
      title: "MATH",
      section: "113",
      code: 112,
      index: 0,
    ),
    DataBlock(
      title: "ISC",
      section: "120",
      code: 112,
      index: 1,
    ),
    DataBlock(
      title: "CS",
      section: "1002",
      code: 112,
      index: 2,
    ),
    DataBlock(
      title: "CS",
      section: "1002",
      code: 112,
      index: 3,
    ),
    
    DataBlock(
      title: "HI",
      section: "1002",
      code: 112,
      index: 3,
    ),
    DataBlock(

    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        SizedBox(
          height: 100,
        ),
        HorizentalDataListViewer(
          dataBlocksList: courseBlocks,
          title: "Courses",
        ),
        SizedBox(
          height: 75,
        ),
        HorizentalDataListViewer(
          dataBlocksList: courseBlocks,
          title: "Chatrooms",
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


