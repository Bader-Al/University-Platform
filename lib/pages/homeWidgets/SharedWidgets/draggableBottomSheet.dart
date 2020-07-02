import 'package:flutter/material.dart';
import 'searchBarForSheetHeader.dart';
import 'package:provider/provider.dart';

// Widget headerButton({context, bool hideShadow = false, Function onPressed}) {
//   return Container(
//     decoration: BoxDecoration(
//         boxShadow: [
//           BoxShadow(
//               offset: Offset(0, 1),
//               blurRadius: 0.25,
//               spreadRadius: 0.1,
//               color:
//                   hideShadow ? Colors.transparent : Colors.black.withAlpha(25)),
//         ],
//         borderRadius: BorderRadius.circular(50),
//         color: Theme.of(context).colorScheme.background),
//     height: 32,
//     width: 53,
//     child: ClipRRect(
//         borderRadius: BorderRadius.circular(50),
//         child: FlatButton(
//             onPressed: onPressed,
//             child: Icon(
//               Icons.calendar_today,
//               size: 18,
//               color: Theme.of(context).colorScheme.primary,
//             ))),
//   );
// }

///////////////////////////////////// above is not in a class because it's used by two classes that are not linked

class DraggableBottomSheet extends StatelessWidget {
  const DraggableBottomSheet({
    this.headerWidget,
    this.pageContent,
    this.pageIndex,
    this.title,
    this.horizontalPadding = 0,
    this.minExtent = 0.2,
    this.initialExtent = 0.2,
  });
  final List pageContent;
  final int pageIndex;
  final String title;
  final double horizontalPadding;
  final Widget headerWidget;
  final double minExtent, initialExtent;
  @override
  //  List colors = [Colors.red, Colors.green, Colors.yellow, Colors.cyan, Colors.indigoAccent]; // JUST FOR DEBUGGING PURPOSES
  Widget build(BuildContext context) {
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
                                itemCount: pageContent.length,

                                cacheExtent: MediaQuery.of(context).size.height,

                                physics: ScrollPhysics(
                                    parent: BouncingScrollPhysics()),
                                controller: scrollController,
                                padding: EdgeInsets.only(left: 0, top: 10),
                                itemBuilder: (context, index) {
                                  return pageContent[index];
                                },
                                // children: <Widget>[
                                //   Center(child: headerWidget ?? SheetHeader()),

                                //   title != null
                                //       ? Container(
                                //           color: Theme.of(context)
                                //               .colorScheme
                                //               .surface,
                                //           alignment: Alignment.center,
                                //           padding: const EdgeInsets.symmetric(
                                //               horizontal: 25, vertical: 65),
                                //           child: Text(
                                //             title,
                                //             style: TextStyle(
                                //                 fontSize: 21,
                                //                 fontWeight: FontWeight.w300,
                                //                 color: Theme.of(context)
                                //                     .colorScheme
                                //                     .onSurface),
                                //             textAlign: TextAlign.center,
                                //           ),
                                //         )
                                //       : SizedBox(),

                                //   ...pageContent.map((e) => e)

                                //   /// THIS IS WHERE THE CONTENT IT LOADED
                                // ],
                              ),
                              // USED TO BE THE CODE FOR TO SUPPORT A SLIVER HEADER BUT CAUSED PERFORMANCE ISSUES. NOW NO MORE HEADER

                              // CustomScrollView(
                              //     controller: scrollController,
                              //     physics: ScrollPhysics(parent: BouncingScrollPhysics()),
                              //     slivers: [
                              //       SheetHeader(),
                              //       SliverFillRemaining(
                              //         hasScrollBody: true,
                              //         child: ListView(
                              //           physics:
                              //               ScrollPhysics(parent: BouncingScrollPhysics()),
                              //           controller: scrollController,
                              //           padding: EdgeInsets.only(left: 15),
                              //           children: <Widget>[
                              //             if (title != null)
                              //               Container(
                              //                 alignment: Alignment.center,
                              //                 padding: const EdgeInsets.symmetric(
                              //                     horizontal: 25, vertical: 65),
                              //                 child: Text(
                              //                   title,
                              //                   style: TextStyle(
                              //                       fontSize: 21,
                              //                       fontWeight: FontWeight.w300,
                              //                       color: Theme.of(context)
                              //                           .colorScheme
                              //                           .onSurface),
                              //                   textAlign: TextAlign.center,
                              //                 ),
                              //               ),
                              //             ...pageContent.map((e) => e)

                              //             /// THIS IS WHERE THE CONTENT IT LOADED
                              //           ],
                              //         ),
                              //       )
                              //     ])
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

class SearchHeader extends StatelessWidget {
  const SearchHeader();
  @override
  Widget build(BuildContext context) {
    return
        // SliverAppBar(
        //   backgroundColor: Colors.transparent,
        //   forceElevated: false,
        //   pinned: true,
        //   floating: false,
        //   elevation: 0,
        //   titleSpacing: 0,
        //   title:

        Center(
      child: Container(
          decoration: BoxDecoration(),
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5),
              child: Center(child: SearchButton()))),
    );
    // );
  }
}

// List headingItems(context) => [
//       Spacer(),
//       SearchButton(),
//       Spacer(),
//     ];

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
