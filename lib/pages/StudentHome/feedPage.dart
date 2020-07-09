import 'package:flutter/material.dart';
import 'feedPageTabs/collabTab.dart';
import 'feedPageTabs/clubsTab.dart';

import 'feedPageTabs/universityTab.dart';

class FeedPage extends StatelessWidget {
  final paddingFromTop = 15.0;

  final List<Widget> tabTitles = [
    Icon(Icons.business),
    Icon(Icons.people),
    Icon(Icons.forum)
  ];

  @override
  Widget build(BuildContext context) {
    double distanceFromBottom = MediaQuery.of(context).size.height < 1000
        ? MediaQuery.of(context).size.height * 0.2
        : MediaQuery.of(context).size.height * 0.25;

    final dbsHeadingTextStyle = TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: MediaQuery.of(context).size.height < 750 ? 14 : 16,
        color: Theme.of(context).colorScheme.primary);

    final draggableSheetExtent = MediaQuery.of(context).size.height < 960
        ? (distanceFromBottom * 0.90) / MediaQuery.of(context).size.height
        : (distanceFromBottom * 0.93) / MediaQuery.of(context).size.height;

    final List<Widget> tabs = [
      UniversityTab(
        distanceFromBottom: distanceFromBottom,
        dbsExtent: draggableSheetExtent,
        dbsHeadingTextStyle: dbsHeadingTextStyle,
        paddingFromTop: this.paddingFromTop,
      ),
      ClubsTab(
        distanceFromBottom: distanceFromBottom,
        dbsExtent: draggableSheetExtent,
        dbsHeadingTextStyle: dbsHeadingTextStyle,
        paddingFromTop: this.paddingFromTop,
      ),
      ColabTab(
        distanceFromBottom: distanceFromBottom,
        dbsExtent: draggableSheetExtent,
        dbsHeadingTextStyle: dbsHeadingTextStyle,
        paddingFromTop: this.paddingFromTop,
      )
    ];
    return SafeArea(
      child: DefaultTabController(
        length: tabs.length,
        child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surface,
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
    bottom: distanceFromBottom + 15,
    width: MediaQuery.of(context).size.width,
    child: Center(
      child: Container(
          width: 275,
          //color: Colors.yellow, // TODO :: ANIMATED SCALE AND ANIMATED OPACITY
          child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context)
                    .colorScheme
                    .onBackground
                    .withOpacity(0.05),
                borderRadius: BorderRadius.circular(50),
              ),
              alignment: Alignment.center,
              child: tabBar(tabTitles, Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.primary.withAlpha(75)))),
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
