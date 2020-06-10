import 'package:flutter/material.dart';
import '../homeWidgets/HorizentalListViewer.dart';
import '../homeWidgets/scheduleBanner.dart';
import '../homeWidgets/events.dart';
import '../homeWidgets/quickDeadlines.dart';




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
          height: 25,
        ),
        HorizentalDataListViewer(
          dataBlocksList: courseBlocks,
          title: "Chatrooms",
        ),
        SizedBox(
          height: 25,
        ),
        QuickDeadlines(),
        
        
        SizedBox(
          height: 25,
        ),
        LatestNews(),
        SizedBox(
          height: 50,
        ),
      ]),
    );
  }
}

class LatestNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 15, top: 10),
          child: Container(
            child: Text(
              "Latest Events",
              style: TextStyle(fontSize: 26),
            ),
            alignment: AlignmentDirectional.centerStart,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        EventBox()
      ],
    );
  }
}

