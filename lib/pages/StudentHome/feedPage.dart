import 'package:flutter/material.dart';
import 'feedPageTabs/collabTab.dart';
import 'feedPageTabs/clubsTab.dart';

import 'feedPageTabs/universityTab.dart';

class FeedPage extends StatelessWidget {
  static const List<Widget> tabs = [
    UniversityTab(),
    ClubsTab(),
    ColabTab(),
  ];
  static const List<Widget> tabTitles = [
    Icon(Icons.business),
    Icon(Icons.people),
    Icon(Icons.forum)
  ];

  @override
  Widget build(BuildContext context) {
    double distanceFromBottom = MediaQuery.of(context).size.height * 0.2 +
        45; // TODO :: WARNING!! :: IF CHANGED THIS VALUE ALSO CHANGE IT IN OTHER AREAS {UNIVERSITY_TAB , }
    return SafeArea(
      child: DefaultTabController(
        length: tabs.length,
        child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.primary,
            body: Stack(
              children: <Widget>[
                centeredTabBar(tabTitles, context, distanceFromBottom),
                TabBarView(
                  children: tabs,
                  physics: ScrollPhysics(parent: BouncingScrollPhysics()),
                )
              ],
            )),
      ),
    );
  }
}

Widget centeredTabBar(tabTitles, context, distanceFromBottom) {
  return Positioned(
    bottom: distanceFromBottom,
    width: MediaQuery.of(context).size.width,
    child: Center(
      child: Container(
          width: 275,
          //color: Colors.yellow, // TODO :: ANIMATED SCALE AND ANIMATED OPACITY
          child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary.withAlpha(50),
                borderRadius: BorderRadius.circular(50),
              ),
              alignment: Alignment.center,
              child: tabBar(tabTitles, Theme.of(context).colorScheme.onPrimary,
                  Theme.of(context).colorScheme.onPrimary.withAlpha(75)))),
    ),
  );
}

Widget tabBar(tabTitles, selectedColor, unselectedColor) {
  return TabBar(
    isScrollable: true,
    indicatorSize: TabBarIndicatorSize.label,
    indicatorWeight: 1,
    tabs: tabTitles,
    labelStyle: TextStyle(
      fontWeight: FontWeight.w400,
    ),
    unselectedLabelColor: unselectedColor,
    labelColor: selectedColor,
    labelPadding: EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
    indicatorColor: selectedColor,
  );
}

//////////////////////////////////////////// Widgets

class ImageWithTextBlock extends StatelessWidget {
  ImageWithTextBlock({this.title, this.paragraph});

  final String title, paragraph;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title != null ? "$title" : "",
                style: TextStyle(fontSize: 26),
                textAlign: TextAlign.start,
              ),
              Row(
                children: <Widget>[Icon(Icons.report)],
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "ParagraprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIhprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIhprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIhprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIhprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIhprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIhprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIhprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIhprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIhprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIhprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIhprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIh",
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.start,
          ),
          Row(),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}

class SoloTextBlock extends StatelessWidget {
  SoloTextBlock({this.title, this.paragraph});

  final String title, paragraph;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title != null ? "$title" : "",
                style: TextStyle(fontSize: 26),
                textAlign: TextAlign.start,
              ),
              Row(
                children: <Widget>[Icon(Icons.report)],
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "ParagraprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIhprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIhprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIhprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIhprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIhprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIhprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIhprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIhprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIhprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIhprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIhprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIh",
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.start,
          ),
          Row(),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}

////////////////////////////////////////////////  TABS
///

///////////////////////// Common ListView For All

class PageContentBuilder extends StatelessWidget {
  PageContentBuilder({@required this.items, this.reverse = true});
  final List<Widget> items;
  final bool reverse;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      //will be switched from StreamBuilder
      child: ListView.builder(
        reverse: this.reverse,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return items[index];
        },
      ),
    );
  }
}
