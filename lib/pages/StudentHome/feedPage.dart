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
    double distanceFromBottom = MediaQuery.of(context).size.height < 1000
        ? MediaQuery.of(context).size.height * 0.2
        : MediaQuery.of(context).size.height *
            0.25; // TODO :: WARNING!! :: IF CHANGED THIS VALUE ALSO CHANGE IT IN OTHER AREAS {UNIVERSITY_TAB , }
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
    bottom: distanceFromBottom + 15,
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
