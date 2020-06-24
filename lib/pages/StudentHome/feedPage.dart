import 'package:flutter/material.dart';
import 'package:psu_platform/constants.dart';
import 'feedPageTabs/clubsTab.dart';

import 'feedPageTabs/universityTab.dart';

class FeedPage extends StatelessWidget {
  List<Widget> tabs = [
    UniversityTab(),
    ClubsTab(),
    CoursesTab(),
    CollabTab(),
  ];
  List<Widget> tabTitles = [
    Icon(Icons.business),
    Icon(Icons.people),
    Icon(Icons.book),
    Icon(Icons.forum)
    
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        
        length: tabs.length,
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.primary,
          body: Stack(
            children: <Widget>[
              centeredTabBar(tabTitles, context),
              TabBarView(children: tabs)
            ],
          )
          
          
        ),
      ),
    );
  }
}


Widget centeredTabBar(tabTitles, context){
  return Positioned( bottom: MediaQuery.of(context).size.height*0.2+100, width: MediaQuery.of(context).size.width,
                child: 
              Center(
                child: Container(
                  width: 275,
                  //color: Colors.yellow, // TODO :: ANIMATED SCALE AND ANIMATED OPACITY
                  child:  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimary.withAlpha(50),
                      borderRadius: BorderRadius.circular(50), 
                      
                    ), alignment: Alignment.center,
                    child: tabBar(tabTitles, Theme.of(context).colorScheme.onPrimary, Theme.of(context).colorScheme.onPrimary.withAlpha(75)))
                ),
              ),
              
              );
}


Widget tabBar(tabTitles, selectedColor, unselectedColor){
  return TabBar(

                          isScrollable: false,
                          indicatorSize: TabBarIndicatorSize.label ,
                          indicatorWeight: 1,
                          tabs: tabTitles,
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                          ),
                          unselectedLabelColor: unselectedColor,
                          labelColor: selectedColor,
                          labelPadding:
                              EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
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




class CoursesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[],
      ),
    );
  }
}

class CollabTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Collab Page"),
    );
  }
}

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
