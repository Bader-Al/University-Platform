import 'package:flutter/material.dart';
import '../../../../constants.dart';
import 'package:provider/provider.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PostedGradesViewer extends StatelessWidget {
  PostedGradesViewer(
      {@required this.children,
      this.title = "Upcoming Exams",
      this.marginTitleToChildren = 15});

  final List children;
  final String title;
  final double marginTitleToChildren;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: 15,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              "$title",
              style: kDashboardHeading.copyWith(
                  color: Theme.of(context).colorScheme.onBackground),
            ),
            Icon(
              Icons.add,
            ),
          ]),
          SizedBox(height: marginTitleToChildren),
          Container(
            // Contains the listView
            height: 155,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              //      color: kSecondColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  bottomLeft: Radius.circular(25)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: children.length,
                  itemBuilder: (BuildContext context, int index) {
                    return children[index];
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PostedGradeCard extends StatelessWidget {
  PostedGradeCard(
      {@required this.courseFullTitle, @required this.gradeAttained, @required this.gradePossible, @required this.examType, this.splashColor});
  final int gradeAttained , gradePossible;
  final String courseFullTitle;
  final examType;
  final splashColor;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Theme.of(context).colorScheme.background,
      clipBehavior: Clip.hardEdge,
      child: FlatButton(
        padding: EdgeInsets.all(0),
        splashColor: splashColor ?? Theme.of(context).colorScheme.secondary,
        onPressed: () {
          print("OUCH");
        },
        child: Container(
            width: 150,
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                circleIndicator(context, gradeAttained, gradePossible),
                SizedBox(height: 5),
                bottomDetails(context, examType)
              ],
            )),
      ),
    );
  }

  Widget circleIndicator(context, gradeAttained, gradePossible) {
    return Expanded(
        child: CircularPercentIndicator(
      radius: 75,
      lineWidth: 4,
      backgroundColor: Theme.of(context).colorScheme.background,
      percent: gradeAttained/gradePossible,
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: Theme.of(context).colorScheme.primary,
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "$gradeAttained",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontWeight: FontWeight.w300,
                fontSize: 18),
          ), SizedBox(height:4),Container(height:1, width: 25, color: Theme.of(context).colorScheme.primary.withAlpha(50)),SizedBox(height: 4,),
          Text(
            "$gradePossible",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontWeight: FontWeight.w300,
                fontSize: 18),
          ),
          SizedBox(height: 7)
        ],
      ),
    ));
  }

  Widget bottomDetails(context, examType) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          //Checks to see if section is inputted. this determines wether the table is for courses or for chats etc
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "$courseFullTitle",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).colorScheme.onBackground),
            ),
            Text(
              "18 Jan 2018",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withAlpha(150)),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 1),
          child: Text(
            "$examType",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.background),
          ),
          decoration: BoxDecoration(
              color: kGreenIndication, borderRadius: BorderRadius.circular(50)),
        )
      ],
    );
  }
}

enum ExamType {
  quiz,
  majorExam,
  finalExam,
}
