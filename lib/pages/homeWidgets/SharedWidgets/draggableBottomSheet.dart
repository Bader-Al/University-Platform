import 'package:flutter/material.dart';
import 'searchBarForSheetHeader.dart';

Widget headerButton({context, bool hideShadow = false, Function onPressed}) {
  return Container(
    decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 1),
              blurRadius: 0.25,
              spreadRadius: 0.1,
              color:
                  hideShadow ? Colors.transparent : Colors.black.withAlpha(25)),
        ],
        borderRadius: BorderRadius.circular(50),
        color: Theme.of(context).colorScheme.background),
    height: 32,
    width: 53,
    child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: FlatButton(
            onPressed: onPressed,
            child: Icon(
              Icons.calendar_today,
              size: 18,
              color: Theme.of(context).colorScheme.primary,
            ))),
  );
}

///////////////////////////////////// above is not in a class because it's used by two classes that are not linked

class DraggableBottomSheet extends StatelessWidget {
  DraggableBottomSheet({this.pageContent, this.pageIndex});
  final List pageContent;
  final int pageIndex;
  @override
  //  List colors = [Colors.red, Colors.green, Colors.yellow, Colors.cyan, Colors.indigoAccent]; // JUST FOR DEBUGGING PURPOSES
  Widget build(BuildContext context) {
    print(pageIndex);
    return DraggableScrollableSheet(
        key: ValueKey(pageIndex),
        initialChildSize: 0.4,
        minChildSize: 0.2,
        maxChildSize: 1,
        builder: (context, scrollController) {
          return Transform.translate(
            offset: Offset(0,
                -8), // this is done to hide the missing border radius when the sheet is expanded.

            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  child: CustomScrollView(
                    controller: scrollController,
                    slivers: <Widget>[
                      SheetHeader(
                        pageIndex: pageIndex,
                      ),
                      SliverFillRemaining(
                        child: ListView.builder(
                          itemBuilder: (context, index) => pageContent[index],
                          itemCount: pageContent.length,
                          controller: scrollController,
                        ),
                      )
                    ],
                  )),
            ),
          );
        });
  }
}

class SheetHeader extends StatelessWidget {
  SheetHeader({this.pageIndex});
  final int pageIndex;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      titleSpacing: 0,
      title: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
          ),
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  PositionedDirectional(
                    child: headerButton(
                        context: context, onPressed: () => print("AH!!!!")),
                    end: 15,
                  ),
                  PositionedDirectional(
                    child: headerButton(context: context),
                    start: 15,
                  ),
                  SearchButton(),
                ],
              ))),
    );
  }
}

List headingItems(context) => [
      Spacer(flex: 3),
      headerButton(context: context),
      Spacer(),
      SearchButton(),
      Spacer(),
      headerButton(context: context),
      Spacer(
        flex: 3,
      )
    ];
