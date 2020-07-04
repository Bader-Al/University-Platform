import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psu_platform/pages/StudentHome/academicsPage.dart';

class CouseSelectionGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _academicPageState = Provider.of<AcademicPageState>(context);
    final List<CourseCard> courseCardList = _academicPageState.courseCards;
    return Positioned(
      top: 0,
      right: 0,
      left: 0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.55,
        color: Theme.of(context).colorScheme.background,
        padding: EdgeInsets.symmetric(
          vertical: 15,
        ),
        child: GridView.count(
          cacheExtent: 25,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 15),
          childAspectRatio: 4 / 6,
          scrollDirection: Axis.horizontal,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,

          crossAxisCount:
              3, // 200 is the target height im trying to acheive.. so basically the height will stay 200 and if there's room for more. the count grows
          children: courseCardList,
        ),
      ),
    );
  }
}
// TODO :: probably gona need a layout builder to make responsive grid over horizontal list layout

class CourseCard extends StatelessWidget {
  CourseCard(
      {this.courseIndex,
      this.courseTitle = "Some Course",
      this.courseCode = "CS101"});
  final courseIndex;
  final String courseTitle, courseCode;
  @override
  Widget build(BuildContext context) {
    final _academicPageState = Provider.of<AcademicPageState>(context);
    return Container(
        // height: 20,
        // width: 4000,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(5)),
        child: FlatButton(
            padding: EdgeInsets.symmetric(horizontal: 25),
            onPressed: () {
              _academicPageState.incrementPageIndex();
              _academicPageState.updateExtent(_academicPageState.initialExtent);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  // color: Colors.yellow,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 3,
                      ),
                      SizedBox(
                        width: 1,
                      ),
                      CircleAvatar(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        radius: 3,
                      ),
                      SizedBox(
                        width: 1,
                      ),
                      CircleAvatar(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        radius: 3,
                      ),
                    ],
                  ),
                  height: 5,
                ),
                returnCardText(context),
                // SizedBox()
              ],
            )));
  }

  returnCardText(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          courseCode,
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "$courseTitle",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
          // textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
