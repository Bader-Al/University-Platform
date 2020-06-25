import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psu_platform/pages/homeWidgets/AcademicPageWidgets/HorizontalExpandingGradeViewer.dart';
// import 'package:psu_platform/pages/homeWidgets/AcademicPageWidgets/academicDraggableBottomSheet.dart';
import 'package:psu_platform/pages/homeWidgets/AcademicPageWidgets/pageContentItem.dart';
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

class AcademicPageBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AcademicPageState>(builder: (context, appState, child) {
      return Stack(
        children: <Widget>[
          BodyInTheBackground(),
          DraggableSheetInTheForeground()
        ],
      );
    });
  }
}

class DraggableSheetInTheForeground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      child: Provider.of<AcademicPageState>(context)._selectedPage,
    );
  }
}

class BodyInTheBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).colorScheme.primary,
        child: FlatButton(
            onPressed: () {
              Provider.of<AcademicPageState>(context).incrementPageIndex();
            },
            child: Text("Change page yay")),
      ),
      top: 0,
    );
  }
}

class AcademicPageState extends ChangeNotifier {
  static int _selectedPageIndex = 0;
  var _selectedPage;

  bool showSheetPage = false;

  static List _pages = [
    // There might be a better widget to use than container. But, wrapping DBS in something that takes a valuekey() here is essential. for now using container till sol found
    Container(
      key: ValueKey(0),
      child: DraggableBottomSheet(
        pageContent: stuffs,
        pageIndex: 0,
        title: "Introduction To Artificial Intelligence",
      ),
    ),
    Container(
      key: ValueKey(1),
      child: DraggableBottomSheet(
        horizontalPadding: 0,
          pageContent: stuffs,
          pageIndex: 1,
          title: "Human Computer Interaction"),
    )
  ];

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
  }

  Widget returnSelectedPage() {
    return _selectedPage;
  }
}

List stuffs = [
  GradeViewer(gradesList: [
    Grade(examType: "Quiz".toUpperCase(), earnedGrade: 7, gradePossible: 10, isSeen: false),
    Grade(examType: "Quiz".toUpperCase(), earnedGrade: 7, gradePossible: 10, isSeen: false),
    Grade(examType: "Quiz".toUpperCase(), earnedGrade: 7, gradePossible: 10, isSeen: false),
    Grade(examType: "Quiz".toUpperCase(), earnedGrade: 7, gradePossible: 10),
  ]),

  AcademicItem(),
  AcademicItem(),
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
