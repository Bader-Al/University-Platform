import 'package:flutter/material.dart';
import 'package:psu_platform/appState.dart';
import 'package:psu_platform/constants.dart';
import 'package:provider/provider.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TabbedAcademicOverView extends StatelessWidget {
  final PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    final pages = [
      Container(
        color: Theme.of(context).colorScheme.background,
        child: Center(child: Text("Assignments")),
        height: double.infinity,
        width: double.infinity,
      ),
      Container(
        color: Theme.of(context).colorScheme.background,
        child: RecentFileAccess(),
        height: double.infinity,
        width: double.infinity,
      ),
      Container(
        color: kYellowIndication,
        child: Text("Idk"),
        height: double.infinity,
        width: double.infinity,
      ),
    ];

    return Positioned(
        bottom: 25,
        top: MediaQuery.of(context).size.height * 0.56,
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
          ],
        ));
  }
}

class RecentFileAccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildRecentFileAccess(context);
  }

  Widget buildRecentFileAccess(context) {
    final _queryData = MediaQuery.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(2),
      child: Container(
          alignment: Alignment.center,
          // height: 200,
          width: MediaQuery.of(context).size.width,
          child: GridView.count(
            scrollDirection: Axis.horizontal,
            reverse: true,
            physics: BouncingScrollPhysics(),
            crossAxisCount: _queryData.size.height < 650
                ? 1
                : _queryData.size.height < 1110 ? 2 : 3,
            children: recentFilesAccessed,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: 4 / 6,
            padding: EdgeInsets.only(top: 20, bottom: 10, left: 15, right: 15),
          )),
    );
  }
}

final List<Widget> recentFilesAccessed = [
  FileItem(
    isDownloaded: true,
  ),
  FileItem(isDownloaded: true),
  FileItem(isDownloaded: true),
  FileItem(),
  FileItem(),
  FileItem(isDownloaded: true),
  FileItem(),
  FileItem(),
  FileItem(),
  FileItem(),
  FileItem(),
  FileItem(),
];

class FileItem extends StatelessWidget {
  FileItem({this.isDownloaded = false});
  final isDownloaded;
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, appState, child) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 7, vertical: 0),
        decoration: BoxDecoration(
            color: isDownloaded
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.primaryVariant,
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
