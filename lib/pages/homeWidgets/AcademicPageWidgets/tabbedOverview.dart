import 'package:flutter/material.dart';
// import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:psu_platform/constants.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TabbedAcademicOverView extends StatelessWidget {
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    final pages = [
      Container(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        color: Theme.of(context).colorScheme.primary,
        child: PrimaryPage(),
        height: double.infinity,
        width: double.infinity,
      ),
      Container(
        color: Colors.red,
        child: Text("Hello"),
        height: double.infinity,
        width: double.infinity,
      ),
      Container(
        color: kYellowIndication,
        child: Text("Hello"),
        height: double.infinity,
        width: double.infinity,
      ),
    ];

    return Positioned(
        bottom: 0,
        top: MediaQuery.of(context).size.height * 0.6,
        right: 0,
        left: 0,
        child: Stack(
          children: <Widget>[
            LiquidSwipe(
              pages: pages,
              currentUpdateTypeCallback: (updateType) =>
                  print(updateType.index),
            ),
            Positioned(
              right: 45,
              top: 45,
              child: Stack(
                children: <Widget>[
                  SmoothPageIndicator(
                    controller: controller, // PageController
                    count: 3,
                    effect: WormEffect(
                        dotHeight: 12,
                        dotWidth: 12,
                        paintStyle: PaintingStyle.stroke,
                        strokeWidth: 0,
                        activeDotColor: Theme.of(context)
                            .colorScheme
                            .background), // your preferred effect
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class PrimaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildRecentFileAccess(context),
      ],
    );
  }

  Widget buildRecentFileAccess(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 40.0, bottom: 15),
          child: Text(
            "Recent File Access",
            style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w300,
                color: Theme.of(context).colorScheme.onPrimary),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
            alignment: Alignment.center,
            // height: 200,
            width: MediaQuery.of(context).size.width,
            child: GridView.extent(
              physics: NeverScrollableScrollPhysics(),
              maxCrossAxisExtent: 175,
              children: recentFilesAccessed,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
              childAspectRatio: 12 / 7,
              shrinkWrap: true,
            )),
      ],
    );
  }
}

final List<Widget> recentFilesAccessed = [
  FileItem(),
  FileItem(),
  FileItem(),
  FileItem(),
  FileItem(),
  FileItem(),
];

class FileItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
          // border: Border.all(
          //     width: 1, color: Theme.of(context).colorScheme.onPrimary),
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("CS 112",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 12)),
          Text(
            "Chapter 17.pdf",
            style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
          ),
        ],
      ),
    );
  }
}
