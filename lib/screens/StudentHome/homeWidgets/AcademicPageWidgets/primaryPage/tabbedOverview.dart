import 'package:flutter/material.dart';
import 'package:psu_platform/appState.dart';
import 'package:psu_platform/screens/StudentHome/academicsPage.dart';
import 'package:psu_platform/theme_constants.dart';
import 'package:provider/provider.dart';

class TabbedAcademicOverView extends StatelessWidget {
  final PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    AcademicPageState _academicPageState =
        Provider.of<AcademicPageState>(context, listen: false);

    final pages = [
      AssignmentsOverView(),
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
                onPageChanged: (value) {
                  print(value);
                  _academicPageState.setFocusedWidget(value);
                },
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

class AssignmentsOverView extends StatelessWidget {
  Widget build(BuildContext context) {
    return buildAssignmentsOverview(context);
  }

  Widget buildAssignmentsOverview(context) {
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
                : _queryData.size.height < 1110
                    ? 2
                    : 3,
            children: assignmentsOverview,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: _queryData.size.width < 360 ? 4 / 6 : 3 / 8,
            padding: EdgeInsets.only(top: 20, bottom: 10, left: 15, right: 15),
          )),
    );
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
                : _queryData.size.height < 1110
                    ? 2
                    : 3,
            children: recentFilesAccessed,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: 1 / 2,
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

final List<Widget> assignmentsOverview = [
  AssignmentItem(),
  AssignmentItem(),
  AssignmentItem(
    isComplete: true,
    deadlineIsSoon: true,
  ),
  AssignmentItem(
    isSubmitted: true,
    deadlineIsSoon: true,
  ),
  AssignmentItem(
    deadlineIsSoon: true,
  ),
  AssignmentItem(
    deadlineIsSoon: true,
  ),
  AssignmentItem(),
  AssignmentItem(
    isMissed: true,
  ),
  AssignmentItem(
    isMissed: true,
  ),
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
            borderRadius: BorderRadius.circular(3)),
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

class AssignmentItem extends StatelessWidget {
  AssignmentItem(
      {this.isSubmitted = false,
      this.isComplete = false,
      this.isMissed = false,
      this.deadlineIsSoon = false});
  final isSubmitted, isMissed, deadlineIsSoon, isComplete;
  @override
  Widget build(BuildContext context) {
    final isHighlighted = (isSubmitted || isComplete || isMissed);
    return Consumer<AppState>(builder: (context, appState, child) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 7, vertical: 3),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(3)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Text(
                    isSubmitted
                        ? "Submitted"
                        : isComplete
                            ? "Complete"
                            : "No Attmept",
                    style: TextStyle(
                      color: isComplete
                          ? kGreenIndication
                          : isSubmitted
                              ? kYellowIndication
                              : deadlineIsSoon
                                  ? Colors.redAccent
                                  : isMissed
                                      ? Colors.red[500]
                                      : Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                    ),
                  ),
                ),
                Flexible(
                  child: Text(
                    "Due in 12 days",
                    softWrap: true,
                    textAlign: TextAlign.end,
                    maxLines: 2,
                    style: TextStyle(
                        color: deadlineIsSoon
                            ? Colors.redAccent
                            : Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w400,
                        fontSize: 10),
                  ),
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
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 12)),
                SizedBox(
                  height: 2,
                ),
                Container(
                  width: double.maxFinite,
                  // color: Colors.red,
                  child: Text(
                    "Chapter 17 Lorem Ipsum Something Buffing.pdf",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
