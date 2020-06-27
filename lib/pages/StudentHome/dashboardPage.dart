import 'package:flutter/material.dart';
import 'package:psu_platform/constants.dart';
import 'package:psu_platform/pages/homeWidgets/DashboardPageWidgets/horizontal_viewers/postedGrades.dart';
import '../homeWidgets/DashboardPageWidgets/dashboardHeader/scheduleBanner.dart';
import '../homeWidgets/DashboardPageWidgets/billboard.dart';
import '../homeWidgets/DashboardPageWidgets/quickDeadlines.dart';
import '../homeWidgets/DashboardPageWidgets/horizontal_viewers/upComingExams.dart';
import 'package:after_layout/after_layout.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with AfterLayoutMixin<DashboardPage> {
  final List courses = [];
  ScrollController scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController = new ScrollController();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: ScrollPhysics(parent: BouncingScrollPhysics()),
        cacheExtent: MediaQuery.of(context).size.height,
        controller: scrollController,
        slivers: <Widget>[
          ScheduleBanner(),
          DashboardPageSliver(), // TODO: maybe change to sliverlist fill remaining and us listview builder... test for performance diff
        ],
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    // TODO: implement afterFirstLayout
    scrollController.animateTo(MediaQuery.of(context).size.height * 0.8 - 90,
        curve: Curves.easeOut, duration: Duration(milliseconds: 550));
  }
}

class DashboardPageSliver extends StatelessWidget {
  // template.. later these blocks should take data from actual
  // const DashboardPageSliver();

  List pageContent = [
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
    QuickDeadlines(
      deadLines: deadLinesItems,
    ),
    SizedBox(
      height: 75,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => pageContent[index],
        childCount: pageContent.length,
      ),
    );

    // return SliverList(delegate: SliverChildListDelegate(pageContent) );
  }
}

const List upcomingExams = [
  UpcomingExamCard(
    courseFullTitle: "CS 112",
    daysLeft: 7,
  ),
  UpcomingExamCard(
    courseFullTitle: "CS 112",
    daysLeft: 7,
  ),
  UpcomingExamCard(
    courseFullTitle: "CS 112",
    daysLeft: 7,
  ),
  UpcomingExamCard(
    courseFullTitle: "CS 112",
    daysLeft: 7,
  ),
  UpcomingExamCard(
    courseFullTitle: "CS 112",
    daysLeft: 7,
  ),
];

const List postedGrades = [
  PostedGradeCard(
    courseFullTitle: "ISC 101",
    gradeAttained: 5,
    gradePossible: 10,
    examType: "Quiz",
  ),
  PostedGradeCard(
    courseFullTitle: "CS 101",
    gradeAttained: 7,
    gradePossible: 10,
    examType: "Quiz",
  ),
  PostedGradeCard(
    courseFullTitle: "PSY 101",
    gradeAttained: 8,
    gradePossible: 10,
    examType: "Quiz",
  ),
  PostedGradeCard(
    courseFullTitle: "ISC 101",
    gradeAttained: 2,
    gradePossible: 10,
    examType: "Quiz",
  ),
];

List deadLinesItems = [
  Deadline(
    deadlineCourseName: "PSY 420 : Ape Psychology",
    deadlineType: "Project Phase 3",
    deadlineDueDate: "19 November",
    deadlineTitle: "Project Due",
  ),
  Deadline(),
  Deadline(),
  Deadline(),
];
