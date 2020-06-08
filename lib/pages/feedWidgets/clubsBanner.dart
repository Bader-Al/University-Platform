import 'package:flutter/material.dart';
import 'package:psu_platform/constants.dart';
import 'package:psu_platform/pages/feedWidgets/horizontalClubView.dart';
import 'package:psu_platform/pages/feedWidgets/verticalClubView.dart';

class ClubsBanner extends StatelessWidget {
  @override
  ClubsBanner({@required this.favoriteClubs});
  final List favoriteClubs;

  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return SliverAppBar(
      floating: true,
      pinned: true,
      snap: false,
      expandedHeight: queryData.size.height*0.60,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            HorizontalClubView(
              title: "Favorites",
              items: favoriteClubs,
            ),
            VerticalClubView(
              title: "All",
            ),
          ],
        ),
      ),
      bottom: AppBar(
        title: FloatingSelectedClubBarRow(),
        elevation: 1,
      ),
    );
  }
}

class FloatingSelectedClubBarRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Next Event At 17th October",
            ),
            Text(
              "AI and Data Science",
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Organizer",
            ),
            Icon(
              Icons.person,
              size: 26,
            )
          ],
        )
      ],
    );
  }
}
