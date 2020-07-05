import 'package:flutter/material.dart';

import 'colorCategoryHeader.dart';
import 'package:psu_platform/pages/homeWidgets/SharedWidgets/draggableBottomSheet.dart';
import 'package:provider/provider.dart';
import 'package:psu_platform/pages/StudentHome/academicsPage.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AcademicDraggableSheet extends StatelessWidget {
  AcademicDraggableSheet({
    this.headerWidget,
    this.pageContent,
    this.pageIndex,
    this.title,
    this.horizontalPadding = 0,
    this.minExtent = 0,
    this.initialExtent = 0.85,
  });
  final List pageContent;
  final int pageIndex;
  final String title;
  final double horizontalPadding;
  final Widget headerWidget;
  final double minExtent, initialExtent;

  final PageController _pageController = PageController();
  @override
  //  List colors = [Colors.red, Colors.green, Colors.yellow, Colors.cyan, Colors.indigoAccent]; // JUST FOR DEBUGGING PURPOSES
  Widget build(BuildContext context) {
    var children = [
      ColorBasedTabs(
        pageController: _pageController,
      ),
      SheetTitle(
        title: this.title,
      ),
      ...pageContent
    ];
    print(pageIndex);

    return ExcludeSemantics(
      child: ChangeNotifierProvider(
          create: (context) => BackgroundState(),
          child: Consumer<BackgroundState>(
            builder: (context, bgState, child) {
              return NotificationListener(
                onNotification: (notification) {
                  // print(notification);
                  if (notification is ScrollUpdateNotification) {
                    notification.metrics.extentBefore > 0
                        ? bgState.showBG()
                        : bgState.hideBG();
                  } else if (notification is DraggableScrollableNotification) {
                    bgState.hideBG();
                  }
                },
                child: DraggableScrollableSheet(
                    key: ValueKey(pageIndex),
                    initialChildSize: initialExtent ?? 0.2,
                    minChildSize: minExtent ?? 0.2,
                    maxChildSize: 1,
                    builder: (context, scrollController) {
                      return Stack(
                        children: <Widget>[
                          Positioned(
                            child: SmartBackground(),
                            left: -10,
                            right: -10,
                            bottom: 0,
                            top: 0,
                          ),
                          // Positioned(
                          //   child: ColorBasedTabs(
                          //     pageController: PageController(),
                          //   ),
                          //   top: 10,
                          // ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: horizontalPadding,
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.surface,
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(15)),
                              ),
                              child: ListView.builder(
                                itemCount: children.length,
                                cacheExtent: MediaQuery.of(context).size.height,
                                physics: ScrollPhysics(
                                    parent: BouncingScrollPhysics()),
                                controller: scrollController,
                                padding: EdgeInsets.only(left: 0, top: 10),
                                itemBuilder: (context, index) {
                                  return children[index];
                                },
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              );
            },
          )),
    );
  }
}

// class SearchHeader extends StatelessWidget {
//   const SearchHeader();
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//           decoration: BoxDecoration(),
//           height: 60,
//           width: MediaQuery.of(context).size.width,
//           child: Padding(
//               padding: const EdgeInsets.only(top: 5.0, bottom: 5),
//               child: Center(child: SearchButton()))),
//     );
//     // );
//   }
// }

class SheetTitle extends StatelessWidget {
  const SheetTitle({this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 65),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w300,
            color: Theme.of(context).colorScheme.onSurface),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class SmartBackground extends StatefulWidget {
  @override
  _SmartBackgroundState createState() => _SmartBackgroundState();
}

class _SmartBackgroundState extends State<SmartBackground> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: Provider.of<BackgroundState>(context).visibility,
      child: Container(
        color: Theme.of(context).colorScheme.surface,
      ),
    );
  }
}

class BackgroundState extends ChangeNotifier {
  bool visibility = false;

  void hideBG() {
    visibility = false;
    notifyListeners();
  }

  void showBG() {
    visibility = true;
    notifyListeners();
  }
}
