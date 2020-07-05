import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psu_platform/pages/homeWidgets/AcademicPageWidgets/pageContentItem.dart';
import 'package:psu_platform/pages/homeWidgets/AcademicPageWidgets/colorCategoryHeader.dart';
import 'package:psu_platform/pages/homeWidgets/SharedWidgets/draggableBottomSheet.dart';
import 'package:psu_platform/pages/homeWidgets/AcademicPageWidgets/courseSelectionGrid.dart';
import 'package:psu_platform/pages/homeWidgets/AcademicPageWidgets/academicDraggableBottomSheet.dart';

import 'package:psu_platform/pages/homeWidgets/AcademicPageWidgets/tabbedOverview.dart';

import 'package:psu_platform/pages/homeWidgets/AcademicPageWidgets/HorizontalExpandingGradeViewer.dart';

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
PageController mainPageController;
Curve switchPageCurve = Curves.ease;

class AcademicPageBuilder extends StatelessWidget {
  final List _pages = [PrimaryPage(), AnnouncementsPage(), CalendarPage()];

  final PageController _pageController = new PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  Widget build(BuildContext context) {
    mainPageController = _pageController;
    return Consumer<AcademicPageState>(
        builder: (context, academicPageState, child) {
      // _buildCourseCards(context); TODO WHEN IMPLEMENTED AS FUTURE

      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Stack(
          children: <Widget>[
            PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                physics: academicPageState.aCourseIsSelected
                    ? NeverScrollableScrollPhysics()
                    : BouncingScrollPhysics(),
                itemBuilder: (context, index) => _pages[index]),
            AnimatedOpacity(
              opacity: academicPageState.aCourseIsSelected ? 0 : 1,
              duration: Duration(milliseconds: 400),
              child: Container(
                  padding: EdgeInsets.only(top: 5),
                  child: ColorBasedTabs(
                    pageController: _pageController,
                  )),
            ),
            // Positioned(
            //               child: Row(
            //     children: <Widget>[
            //       Flexible(child: PrevPageButton()),
            //       Flexible(child: NextPageButton()),
            //     ],
            //   ),
            // )
          ],
        ),
      );
    });
  }
}

class NextPageButton extends StatelessWidget {
  NextPageButton({this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: GestureDetector(
        onTap: () => mainPageController.animateToPage(
          mainPageController.page.toInt() + 1,
          duration: Duration(milliseconds: 350),
          curve: switchPageCurve,
        ),
        child: Container(
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.horizontal(le),
            color: Theme.of(context).colorScheme.background,
          ),
          child: Center(
              child: Icon(
            Icons.keyboard_arrow_right,
            color: color,
          )),
          width: 25,
          height: 25,
        ),
      ),
      bottom: 0,
      right: 0,
    );
  }
}

class PrevPageButton extends StatelessWidget {
  PrevPageButton({this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: GestureDetector(
        onTap: () => mainPageController.animateToPage(
          mainPageController.page.toInt() - 1,
          duration: Duration(milliseconds: 350),
          curve: switchPageCurve,
        ),
        child: Container(
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.horizontal(le),
            color: Theme.of(context).colorScheme.background,
          ),
          child: Center(
              child: Icon(
            Icons.keyboard_arrow_left,
            color: color,
          )),
          width: 25,
          height: 25,
        ),
      ),
      bottom: 0,
      left: 0,
    );
  }
}

class PrimaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _buildCoursePagesList(context);
    return Container(
      color: Theme.of(context).colorScheme.primaryVariant,
      child: Stack(
        children: <Widget>[
          TabbedAcademicOverView(),
          CouseSelectionGrid(),
          DraggableSheetInTheForeground(),
          NextPageButton(
            color: Theme.of(context).colorScheme.secondaryVariant,
          )
        ],
      ),
    );
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
      Container(
        key: ValueKey(0),
        child: AcademicDraggableSheet(
          pageContent: stuffs,
          pageIndex: 0,
          title: "Intro To Artificial Intelligence",
        ),
      ),
      Container(
        key: ValueKey(1),
        child: AcademicDraggableSheet(
          pageContent: stuffs,
          pageIndex: 1,
          title: "Intro To Artificial Intelligence",
        ),
      ),
      Container(
        key: ValueKey(2),
        child: AcademicDraggableSheet(
          pageContent: stuffs,
          pageIndex: 2,
          title: "Intro To Artificial Intelligence",
        ),
      ),
    ];
  }
}

class AnnouncementsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 25),
            // width: double.infinity,
            // height: double.infinity,
            color: Theme.of(context).colorScheme.secondaryVariant,
            child: Container(
                color: Theme.of(context).colorScheme.surface,
                child: Center(
                    child: Text(
                  "Announcements and Absences",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground),
                ))),
          ),
          NextPageButton(color: Colors.redAccent),
          PrevPageButton(
            color: Theme.of(context).colorScheme.primaryVariant,
          )
        ],
      ),
    );
  }
}

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 25),
            width: double.infinity,
            height: double.infinity,
            color: Colors.redAccent,
            child: Container(
                color: Theme.of(context).colorScheme.surface,
                child: Center(
                    child: Text(
                  "Announcements and Absences",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground),
                ))),
          ),
          PrevPageButton(
            color: Theme.of(context).colorScheme.secondaryVariant,
          )
        ],
      ),
    );
  }
}

class DraggableSheetInTheForeground extends StatelessWidget {
  const DraggableSheetInTheForeground();
  @override
  Widget build(BuildContext context) {
    final _academicPageState = Provider.of<AcademicPageState>(context);
    return NotificationListener(
      onNotification: (notification) {
        if (notification is DraggableScrollableNotification) {
          if (notification.extent < 0.05) {
            _academicPageState.closeSelectedCourse();
          }
        }
      },
      child: AnimatedSwitcher(
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
      ),
    );
  }
}

class AcademicPageState extends ChangeNotifier {
  int _selectedPageIndex = 0;
  Widget _selectedPage;
  bool aCourseIsSelected = false;
  double backgroundWidth;
  // double backgroundHeight = 100;
  double initialExtent = 0.35;
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
    aCourseIsSelected = true;
    notifyListeners();
  }

  void closeSelectedCourse() {
    _selectedPage = SizedBox();
    _selectedPageIndex = 0;
    aCourseIsSelected = false;
    notifyListeners();
  }

  // void setSelectedPage(Widget page) {
  //   _selectedPage = page;

  //   notifyListeners();
  // }

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

    aCourseIsSelected = true;
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
  // SheetTitle(
  //   title: "Introduction To Artificial Intelligence",
  // ),
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
