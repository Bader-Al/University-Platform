import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

class DraggableSheetInTheForeground extends StatefulWidget {
  @override
  DraggableSheetInTheForegroundState createState() =>
      DraggableSheetInTheForegroundState();
}

class DraggableSheetInTheForegroundState
    extends State<DraggableSheetInTheForeground> {
  @override
  Widget build(BuildContext context) {
    // if (!Provider.of<AcademicPageState>(context).showSheetPage) {
    //   return Positioned(
    //     child: handleFirstTime(),
    //     bottom: 0,
    //   );
    // }
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

  Widget handleFirstTime() {
    print("showing firstTime");
    return Container(
      color: Colors.red,
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.4,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
              onPressed: () {
                Provider.of<AcademicPageState>(context).setSelectedPageIndex(1);

                Provider.of<AcademicPageState>(context).setShowSheetPage(true);
              },
              child: Text("1")),
          FlatButton(
              onPressed: () {
                Provider.of<AcademicPageState>(context).setSelectedPageIndex(2);
                Provider.of<AcademicPageState>(context).setShowSheetPage(true);
              },
              child: Text("2")),
          FlatButton(
              onPressed: () {
                Provider.of<AcademicPageState>(context).setSelectedPageIndex(3);
                Provider.of<AcademicPageState>(context).setShowSheetPage(true);
              },
              child: Text("3")),
        ],
      ),
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
    page(pageIndex: 0, pageChildren: stuffs),
    page(pageIndex: 1, pageChildren: stuffs),
    page(pageIndex: 2, pageChildren: stuffs),
    page(pageIndex: 3, pageChildren: stuffs),
    page(pageIndex: 4, pageChildren: stuffs),
    page(pageIndex: 5, pageChildren: stuffs),
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

Widget page({@required pageIndex, @required pageChildren}) {
  //ScrollController scrollController = new ScrollController();
  return DraggableScrollableSheet(
    key: ValueKey(pageIndex),
      initialChildSize: 0.4,
      minChildSize: 0.2,
      maxChildSize: 1,
      builder: (context, scrollController) {
        return Transform.translate(
          offset: Offset(0,-8),
          
                  child: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                    child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface , ),
                child: CustomScrollView(
                    controller: scrollController,
                    slivers: <Widget>[
                      SliverAppBar(
                        pinned: true,
                        floating: false,
                        titleSpacing: 0,
                        title: Container(
                          decoration: BoxDecoration(color: Colors.yellow, ),
                height: 60,
                width: MediaQuery.of(context).size.width,
                
                child: Text(pageIndex.toString())) ,

                      ),
                      SliverFillRemaining(
                        child: ListView.builder(
                          itemBuilder: (context, index) => stuffs[index],
                          itemCount: stuffs.length,
                          controller: scrollController,
                        ),
                      )
                    ],
                  )),
          ),
        );
      });
}

List stuffs = [
  Container(
    child: Text("data"),
    color: Colors.blue,
  ),
  SizedBox(height: 25),
  Container(
    child: Text("data"),
    color: Colors.blue,
  ),
  SizedBox(height: 25),
  Container(
    child: Text("data"),
    color: Colors.blue,
  ),
  SizedBox(height: 25),
  Container(
    child: Text("data"),
    color: Colors.blue,
  ),
  SizedBox(height: 25),
  Container(
    child: Text("data"),
    color: Colors.blue,
  ),
  SizedBox(height: 25),
  Container(
    child: Text("data"),
    color: Colors.blue,
  ),
  SizedBox(height: 25),
  Container(
    child: Text("data"),
    color: Colors.blue,
  ),
  SizedBox(height: 25),
  Container(
    child: Text("data"),
    color: Colors.blue,
  ),
  SizedBox(height: 25),
  Container(
    child: Text("data"),
    color: Colors.blue,
  ),
  SizedBox(height: 25),
  Container(
    child: Text("data"),
    color: Colors.blue,
  ),
  SizedBox(height: 25),
  Container(
    child: Text("data"),
    color: Colors.blue,
  ),
  SizedBox(height: 25),
  Container(
    child: Text("data"),
    color: Colors.blue,
  ),
  SizedBox(height: 25),
  Container(
    child: Text("data"),
    color: Colors.blue,
  ),
  SizedBox(height: 25),
  Container(
    child: Text("data"),
    color: Colors.blue,
  ),
  SizedBox(height: 25),
  Container(
    child: Text("data"),
    color: Colors.blue,
  ),
  SizedBox(height: 25),
  Container(
    child: Text("data"),
    color: Colors.blue,
  ),
  SizedBox(height: 25),
  Container(
    child: Text("data"),
    color: Colors.blue,
  ),
  SizedBox(height: 25),
  Container(
    child: Text("data"),
    color: Colors.blue,
  ),
  SizedBox(height: 25),
  Container(
    child: Text("data"),
    color: Colors.blue,
  ),
  SizedBox(height: 25),
  Container(
    child: Text("data"),
    color: Colors.blue,
  ),
  SizedBox(height: 25),
  Container(
    child: Text("data"),
    color: Colors.blue,
  ),
  SizedBox(height: 25),
  Container(
    child: Text("data"),
    color: Colors.blue,
  ),
  SizedBox(height: 25),
  Container(
    child: Text("data"),
    color: Colors.blue,
  ),
  SizedBox(height: 25),
  Container(
    child: Text("data"),
    color: Colors.blue,
  ),
  SizedBox(height: 25),
];
