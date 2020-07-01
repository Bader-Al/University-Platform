import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psu_platform/pages/homeWidgets/AcademicPageWidgets/pageContentItem.dart';
import 'package:psu_platform/pages/homeWidgets/AcademicPageWidgets/colorCategoryHeader.dart';
// import 'package:psu_platform/pages/homeWidgets/SharedWidgets/draggableBottomSheet.dart';
import 'package:psu_platform/pages/homeWidgets/AcademicPageWidgets/bodyInBackground.dart';
import 'package:psu_platform/pages/homeWidgets/AcademicPageWidgets/academicDraggableBottomSheet.dart';
import 'package:concentric_transition/concentric_transition.dart';

import 'package:psu_platform/pages/homeWidgets/AcademicPageWidgets/HorizontalExpandingGradeViewer.dart';
import 'package:psu_platform/pages/homeWidgets/SharedWidgets/draggableBottomSheet.dart';

class AcademicsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AcademicPageState(),
      child: AcademicPageBuilder(),
    );
  }
}

List _pages;

class AcademicPageBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AcademicPageState>(
        builder: (context, academicPageState, child) {
      // _buildCourseCards(context); TODO WHEN IMPLEMENTED AS FUTURE
      _buildCoursePagesList(context);
      return Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              color: Theme.of(context).colorScheme.primary,
            ),
          ), // BG COLOR
          BodyInTheBackground(),
          DraggableSheetInTheForeground(),
        ],
      );
    });
  }

  void _buildCourseCards(context) {
    // TODO:: MAKE WORK WITH FUTURE
    // TODO:: Make it work with for loop per course fetched
    // final _academicPageState = Provider.of<AcademicPageState>(context);
    // final _courseCards = [
    //   CourseCard(
    //     courseTitle: "Introduction To Artificial Intelligence",
    //   ),
    //   CourseCard(
    //     courseTitle: "Human Computer Interaction",
    //   ),
    //   CourseCard(
    //     courseTitle: "Introduction To Psychology",
    //   ),
    // ];
    // _academicPageState.setCourseCards(_courseCards);

    _buildCoursePagesList(context);
  }

  void _buildCoursePagesList(context) {
    _pages = [
      // There might be a better widget to use than container. But, wrapping DBS in something that takes a valuekey() here is essential. for now using container till sol found
      Container(
        key: ValueKey(0),
        child: AcademicDraggableSheet(
          children: stuffs,
          pageIndex: 0,
          title: "Introduction To Artificial Intelligence",
        ),
      ),
      Container(
        key: ValueKey(1),
        child: AcademicDraggableSheet(
            children: stuffs,
            pageIndex: 1,
            title: "Human Computer Interaction"),
      ),
    ];
  }
}

class DraggableSheetInTheForeground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _academicPageState = Provider.of<AcademicPageState>(context);
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 350),
      switchInCurve: Curves.elasticInOut,
      switchOutCurve: Curves.slowMiddle,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return SlideTransition(
          child: child,
          position: Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0))
              .animate(animation),
        );
      },
      child: _academicPageState._selectedPage,
    );
  }
}

class AcademicPageState extends ChangeNotifier {
  static int _selectedPageIndex = 0;
  Widget _selectedPage;
  double backgroundWidth;
  // double backgroundHeight = 100;
  double initialExtent = 0.2;
  double currentExtent = 0;

  List courseCards = _courseCards; // TODO : IMPLEEMNT FUTURE

  bool showSheetPage = false;

  // static List _pages =

  void setCourseCards(List cards) {
    this.courseCards = cards;
    notifyListeners();
  }

  void setSelectedPageIndex(int index) {
    _selectedPageIndex = index;
    _selectedPage = _pages[index];
    notifyListeners();
  }

  void setSelectedPage(index) {
    _selectedPage = _pages[index];
    notifyListeners();
  }

  void incrementPageIndex() {
    print("selected index was: $_selectedPageIndex");
    if (_selectedPageIndex == null) {
      setSelectedPageIndex(0);
    } else {
      _selectedPageIndex == _pages.length - 1
          ? _selectedPageIndex = 0
          : _selectedPageIndex++;
      _selectedPage = _pages[_selectedPageIndex];
    }
    print("selected index is: $_selectedPageIndex");
    notifyListeners();
  }

  void setShowSheetPage(bool value) {
    showSheetPage = value;
    notifyListeners();
  }

  void updateExtent(draggableSheetExtent) {
    currentExtent = draggableSheetExtent;
    notifyListeners();
  }

  Widget returnSelectedPage() {
    return _selectedPage;
  }

  int getSelectedPageIndex() {
    return _selectedPageIndex;
  }
}

List stuffs = [
  ColorBasedTabs(),
  SheetTitle(
    title: "Introduction To Artificial Intelligence",
  ),
  GradeViewer(gradesList: _grades),
  AcademicItem(),
  AcademicItem(),
  AcademicItem(),
  AcademicItem(),
  AcademicItem(),
  AcademicItem(),
  AcademicItem(),
  AcademicItem(),
  AcademicItem(),
  AcademicItem(),
  AcademicItem(),
  AcademicItem(),
  AcademicItem(),
  AcademicItem(),
  AcademicItem(),
  AcademicItem(),
  AcademicItem(),
  AcademicItem(),
  AcademicItem(),
  AcademicItem(),
  AcademicItem(),
];

List<Grade> _grades = [
  Grade(
      examType: "Quiz".toUpperCase(),
      earnedGrade: 7,
      gradePossible: 10,
      isSeen: false),
  Grade(
      examType: "Quiz".toUpperCase(),
      earnedGrade: 7,
      gradePossible: 10,
      isSeen: false),
  Grade(
      examType: "Major".toUpperCase(),
      earnedGrade: 16,
      gradePossible: 20,
      isSeen: false),
  Grade(examType: "Project".toUpperCase(), earnedGrade: 7, gradePossible: 15),
  Grade(
      examType: "Quiz".toUpperCase(),
      earnedGrade: 7,
      gradePossible: 10,
      isSeen: true),
  Grade(examType: "Major".toUpperCase(), earnedGrade: 9, gradePossible: 20),
  Grade(
      examType: "Quiz".toUpperCase(),
      earnedGrade: 7,
      gradePossible: 10,
      isSeen: true),
  Grade(examType: "Quiz".toUpperCase(), earnedGrade: 7, gradePossible: 10),
];

final _courseCards = [
  // TODO  ::  ALL THESE ARE TEMP FOR UI DEVELOPMENT... LATER SHOULD BE FUTURE THAT'S BUILT
  CourseCard(
    courseTitle: "Introduction To Artificial Intelligence",
    courseCode: "CS410",
  ),
  CourseCard(
    courseTitle: "Human Computer Interaction",
    courseCode: "CS 201",
  ),
  CourseCard(
    courseTitle: "Introduction To Psychology",
    courseCode: "PSY 101",
  ),
  CourseCard(
    courseTitle: "Introduction To Artificial Intelligence",
    courseCode: "CS410",
  ),
  CourseCard(
    courseTitle: "Human Computer Interaction",
    courseCode: "CS 201",
  ),
  CourseCard(
    courseTitle: "Introduction To Psychology",
    courseCode: "PSY 101",
  ),
  CourseCard(
    courseTitle: "Introduction To Artificial Intelligence",
    courseCode: "CS410",
  ),
  CourseCard(
    courseTitle: "Human Computer Interaction",
    courseCode: "CS 201",
  ),
  CourseCard(
    courseTitle: "Introduction To Psychology",
    courseCode: "PSY 101",
  ),
  CourseCard(
    courseTitle: "Introduction To Artificial Intelligence",
    courseCode: "CS410",
  ),
];
