import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:psu_platform/constants.dart';
import 'package:psu_platform/pages/feedWidgets/HorizontalClubView.dart';
import 'package:psu_platform/pages/feedWidgets/VerticalClubView.dart';

class FeedPage extends StatelessWidget {
  List<Widget> tabs = [
    UniversityTab(),
    ClubsTab(),
    CoursesTab(),
    CollabTab(),
  ];
  List<Widget> tabTitles = [
    CustomTab(
      text: "University",
      icon: Icon(Icons.school),
    ),
    CustomTab(
      text: "Clubs",
      icon: Icon(Icons.people),
    ),
    CustomTab(
      text: "Courses",
      icon: Icon(Icons.class_),
    ),
    CustomTab(
      text: "Collaborations",
      icon: Icon(Icons
          .forum), // icon should represent idea icon like lightbulb or handshake not search!
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          // backgroundColor: Theme.of(context).primaryColor,
          appBar: AppBar(
            elevation: 0,
            titleSpacing: 0.0,
            backgroundColor: Theme.of(context).appBarTheme.color,
            title: Column(
              // Tha Appbar is just wrapped in a column cz somehow tht automatically pads that mainaxis Start. Column could be removed but the top will be touched (Appbar edge top screen)
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TabBar(
                  isScrollable: true,
                  tabs: tabTitles,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                  unselectedLabelColor: Colors.black38,
                  labelColor: Colors.white,
                  labelPadding:
                      EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
                  indicatorColor: Colors.white,
                ),
              ],
            ),
          ),
          body: TabBarView(children: tabs),
        ),
      ),
    );
  }
}

////////////////////// CustomTab
class CustomTab extends StatelessWidget {
  CustomTab({@required this.text, @required this.icon, this.flipped = false});
  final String text;
  final Icon icon;
  final bool flipped;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: !flipped
              ? [this.icon, Text(this.text)]
              : [Text(this.text), this.icon]),
    );
  }
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
double bannerHeight = 500;

class UniversityTab extends StatelessWidget {
  final List<Widget> pageContent = [
    ImageWithTextBlock(
      title: "Imagee",
    ),
    SoloTextBlock(
      title: "Header",
    ),
    SoloTextBlock(),
    SoloTextBlock(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageContentBuilder(
        items: pageContent,
      ),
    );
  }
}

class ClubsTab extends StatelessWidget {
  final List<Widget> favoriteClubs = [
    Container(
      child: FlatButton(
        splashColor: kMainRed,
        onPressed: () {},
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "AI and Data Science", //60 char max
                  overflow: TextOverflow.clip,
                  style: kBannerMediumText.copyWith(color: Colors.black),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Next Event:",
                      style: kBannerSmallText.copyWith(color: Colors.black45),
                    ),
                    Text(
                      "17 October 2019",
                      style: kBannerSmallText.copyWith(color: Colors.black45),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      width: 200,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(2, 2))]),
    ),Container(
      child: FlatButton(
        splashColor: kMainRed,
        onPressed: () {},
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "AI and Data Science", //60 char max
                  overflow: TextOverflow.clip,
                  style: kBannerMediumText.copyWith(color: Colors.black),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Next Event:",
                      style: kBannerSmallText.copyWith(color: Colors.black45),
                    ),
                    Text(
                      "17 October 2019",
                      style: kBannerSmallText.copyWith(color: Colors.black45),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      width: 200,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(2, 2))]),
    ),Container(
      child: FlatButton(
        splashColor: kMainRed,
        onPressed: () {},
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "AI and Data Science", //60 char max
                  overflow: TextOverflow.clip,
                  style: kBannerMediumText.copyWith(color: Colors.black),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Next Event:",
                      style: kBannerSmallText.copyWith(color: Colors.black45),
                    ),
                    Text(
                      "17 October 2019",
                      style: kBannerSmallText.copyWith(color: Colors.black45),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      width: 200,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(2, 2))]),
    ),
  ];

  final List<Widget> pageContent = [
    Container(
      height: 100,
      width: double.infinity,
      child: Text("DATAAA"),
    ),
    Container(
      height: 100,
      width: double.infinity,
      child: Text("DATAAA"),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: false,
            expandedHeight: bannerHeight,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                 HorizontalClubView(title: "Favorites", items: favoriteClubs,),
                 VerticalClubView(),
                ],
              ),
            ),
            bottom: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Next Event At 17th October",
                        style: kBannerSmallText,
                      ),
                      Text(
                        "AI and Data Science",
                        style: kBannerMediumText,
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Organizer",
                        style: kBannerSmallText,
                      ),
                      Icon(
                        Icons.person,
                        size: 26,
                      )
                    ],
                  )
                ],
              ),
              elevation: 1,
            ),
          ),
        ];
      },
      body: ListView.builder(
        itemCount: 500,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 100,
            child: Text("Data $index"),
          );
        },
      ),

      // PageContentBuilder(
      //   items: pageContent,
      // ),
    );
  }
}

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
