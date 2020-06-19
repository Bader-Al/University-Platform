import 'package:flutter/material.dart';
import 'searchBarForSheetHeader.dart';
import 'HorizontalExpandingGradeViewer.dart';

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
  DraggableBottomSheet({this.pageContent, this.pageIndex, this.title });
  final List pageContent;
  final int pageIndex;
  final String title;
  ScrollController insideContoller;
  @override
  //  List colors = [Colors.red, Colors.green, Colors.yellow, Colors.cyan, Colors.indigoAccent]; // JUST FOR DEBUGGING PURPOSES
  Widget build(BuildContext context) {
    insideContoller = ScrollController();
    print(pageIndex);
    return DraggableScrollableSheet(
        key: ValueKey(pageIndex),
        initialChildSize: 0.25,
        minChildSize: 0.15,
        maxChildSize: 1,
        builder: (context, scrollController) {
          return ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                ),
                child: CustomScrollView(
                  controller:scrollController,

                   slivers: [
                     
                     SheetHeader(
                     ),
                     
                     SliverFillRemaining(
                       
                       hasScrollBody: true,
                       child:  ListView(
                   controller: scrollController,
                   padding: EdgeInsets.only(left:15),
                  
                  children: <Widget>[
                         
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric( horizontal: 25, vertical: 65),
                            child: Text(title, style: TextStyle(fontSize: 21, fontWeight: FontWeight.w300, color: Theme.of(context).colorScheme.onSurface),textAlign: TextAlign.center,),
                          ),
                          GradeViewer(
                            scrollController: scrollController,
                            gradesList: [
                              Grade(
                                examType: "quiz",
                                earnedGrade: 4,
                                gradePossible: 5,
                                isSeen: false
                              ),
                              Grade(
                                examType: "quiz",
                                earnedGrade: 4,
                                gradePossible: 5,
                              ),
                              Grade(
                                examType: "quiz",
                                earnedGrade: 4,
                                gradePossible: 5,
                              ),
                              Grade(
                                examType: "quiz",
                                earnedGrade: 4,
                                gradePossible: 5,
                              ),
                            ],
                          ),
                          ...pageContent.map((e) => e)
                        ]
                        ,
                  
                  ),)




                    ]
                )),
          );
        });
  }
}


// SliverFillRemaining(
                        //   fillOverscroll: true,

                        //   child: ListView.builder(
                        //     itemBuilder: (context, index) {
                        //       // if(index==1){pageContent[index](scrollController=scrollController);}
                        //       return pageContent[index];},
                        //     itemCount: pageContent.length,
                        //     controller: scrollController,
                        //   ),
                        // ),



class SheetHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      forceElevated: false,
      pinned: true,
      floating: false,
      elevation: 0,
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