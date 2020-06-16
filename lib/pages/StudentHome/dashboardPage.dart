import 'package:flutter/material.dart';
import 'package:psu_platform/constants.dart';
import 'package:psu_platform/pages/homeWidgets/DashboardPageWidgets/horizontal_viewers/postedGrades.dart';
import '../homeWidgets/DashboardPageWidgets/dashboardHeader/scheduleBanner.dart';
import '../homeWidgets/DashboardPageWidgets/billboard.dart';
import '../homeWidgets/DashboardPageWidgets/quickDeadlines.dart';
import '../homeWidgets/DashboardPageWidgets/horizontal_viewers/upComingExams.dart';




class DashboardPage extends StatelessWidget {
  final List courses = [];
  ScrollController scrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: scrollController,
        headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
          return <Widget>[
            ScheduleBanner(boxIsScrolled),
          ];
        },
        body: CustomScrollView(
          slivers: <Widget>[
            DashboardPageSliver(),
          ],
        ),
      ),
    );
    
   
  }
}

class DashboardPageSliver extends StatelessWidget {
  // template.. later these blocks should take data from actual
  
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        SizedBox(
          height: 100,
        ),
        UpComingExamsViewer(
          children: upcomingExams,
        ),
        SizedBox(
          height: 75,
        ),
        PostedGradesViewer(
          children: postedGrades,
        ),
        SizedBox(
          height: 75,
        ),
         QuickDeadlines(),
        
        
        SizedBox(
          height: 75,
        ),
        Billboard(),
        SizedBox(
          height: 50,
        ),
      ]),
    );
  }
}

List upcomingExams = [
  
  UpcomingExamCard(courseFullTitle: "CS 112", daysLeft: 7,),
  UpcomingExamCard(courseFullTitle: "CS 112", daysLeft: 7,),
  UpcomingExamCard(courseFullTitle: "CS 112", daysLeft: 7,),
  UpcomingExamCard(courseFullTitle: "CS 112", daysLeft: 7,),
  UpcomingExamCard(courseFullTitle: "CS 112", daysLeft: 7,),
];

List postedGrades = [
  PostedGradeCard(courseFullTitle: "ISC 101", gradeAttained: 5, gradePossible: 10, examType: "Quiz",),
  PostedGradeCard(courseFullTitle: "CS 101", gradeAttained: 7, gradePossible: 10, examType: "Quiz",),
  PostedGradeCard(courseFullTitle: "PSY 101", gradeAttained: 8, gradePossible: 10, examType: "Quiz",),
  PostedGradeCard(courseFullTitle: "ISC 101", gradeAttained: 2, gradePossible: 10, examType: "Quiz",),

];
