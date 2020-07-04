import 'package:flutter/material.dart';
import 'package:psu_platform/appState.dart';
import 'package:psu_platform/constants.dart';
import 'package:provider/provider.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TabbedAcademicOverView extends StatelessWidget {
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    final pages = [
      Container(
        color: Theme.of(context).colorScheme.background,
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
        top: MediaQuery.of(context).size.height * 0.55,
        right: 0,
        left: 0,
        child: Stack(
          children: <Widget>[
            PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: pages.length,
                controller: controller,
                itemBuilder: (context, index) {
                  return pages[index];
                }),
            // Positioned(
            //   right: 45,
            //   top: 10,
            //   child: Stack(
            //     children: <Widget>[
            //       SmoothPageIndicator(
            //         controller: controller, // PageController
            //         count: 3,
            //         effect: WormEffect(
            //             dotHeight: 12,
            //             dotWidth: 12,
            //             strokeWidth: 0,
            //             dotColor: Theme.of(context)
            //                 .colorScheme
            //                 .primary, // treat this as first dot cz dot the second and third are explicit
            //             activeDotColor: Theme.of(context)
            //                 .colorScheme
            //                 .background), // your preferred effect
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ));
  }
}

class PrimaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildRecentFileAccess(context);
  }

  Widget buildRecentFileAccess(context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
          alignment: Alignment.center,
          // height: 200,
          width: MediaQuery.of(context).size.width,
          child: GridView.count(
            scrollDirection: Axis.horizontal,
            reverse: true,
            physics: BouncingScrollPhysics(),
            crossAxisCount: 2,
            children: recentFilesAccessed,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: 4 / 6,
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          )),
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
    return Consumer<AppState>(builder: (context, appState, child) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
            // border: appState.isDarkMode
            //     ? Border.all(
            //         width: 1,
            //         color: Theme.of(context).colorScheme.primary,
            //       )
            //     : null,
            color:
                // appState.isDarkMode
                //     ? null
                //     :
                Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(appState.isDarkMode ? 5 : 5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "Today",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.background,
                      fontWeight: FontWeight.w300,
                      fontSize: 10),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("CS 112",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Theme.of(context).colorScheme.background,
                        fontSize: 12)),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "Chapter 17.pdf",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.background),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
