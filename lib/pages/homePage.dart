import 'package:flutter/material.dart';
import 'homeWidgets/HorizentalListViewer.dart';
import 'homeWidgets/scheduleBanner.dart';
import 'homeWidgets/events.dart';




class HomePage extends StatelessWidget {
  final List courses = [];
  ScrollController scrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
    child: Scaffold(
      body: NestedScrollView(
        controller: scrollController,
        headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
          return <Widget>[
            ScheduleBanner(boxIsScrolled),
          ];
        },
        body: CustomScrollView(
          slivers: <Widget>[
            HomePageSliver(),
          ],
        ),
      ),
    ),
    );
    
   
  }
}

class HomePageSliver extends StatelessWidget {
  // template.. later these blocks should take data from actual
  final List courseBlocks = [
    SizedBox(
      width: 15,
    ),
    DataBlock(
      title: "CS",
      section: "1002",
      code: 112,
      index: 0,
    ),
    DataBlock(
      title: "CS",
      section: "1002",
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

    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        SizedBox(
          height: 80,
        ),
        
        
        HorizentalDataListViewer(
          dataBlocksList: courseBlocks,
          title: "Courses",
        ),
        HorizentalDataListViewer(
          dataBlocksList: courseBlocks,
          title: "Chatrooms",
        ),
        HorizentalDataListViewer(
          dataBlocksList: courseBlocks,
          title: "Chatrooms",
        ),
        SizedBox(
          height: 45,
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

