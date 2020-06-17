import 'package:flutter/material.dart';

class DraggableBottomSheet extends StatelessWidget {
  DraggableBottomSheet({this.pageContent, this.pageIndex , this.screenHeight, this.screenWidth});
  final double screenHeight, screenWidth;
  final List pageContent;
  final int pageIndex;
  @override
  //  List colors = [Colors.red, Colors.green, Colors.yellow, Colors.cyan, Colors.indigoAccent]; // JUST FOR DEBUGGING PURPOSES
  Widget build(BuildContext context ) {
    print(pageIndex);
    return Container(
      key: ValueKey(pageIndex),
      //height: screenHeight, width: screenWidth,
          child: 
          DraggableScrollableActuator(
     // key: ValueKey(1),
                child: DraggableScrollableSheet(
              initialChildSize: 0.3,
              minChildSize: 0.3,
              maxChildSize: 1,
              builder: (context, scrollController) {
                return ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                  child: 
                  Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(color: Colors.red),
                      child: CustomScrollView(
                        controller: scrollController,
                        slivers: <Widget>[
                          SliverAppBar(
                            //pinned: true,
                            floating: true,
                            flexibleSpace: FlexibleSpaceBar(
                              titlePadding: EdgeInsets.only(left:0, right: 0, bottom: 5,),
                              title: Container(
                                width: MediaQuery.of(context).size.width, height: 50, color: Colors.red,
                                child: GestureDetector(
                                  
                                  //onTap: (){},
                                  onVerticalDragUpdate: (details){
                                   // print(details.delta);
                                    print(details.delta.direction);
                                    if(details.delta.direction > 0.0){
                                  DraggableScrollableActuator.reset(context);}
                                }, child: null),
                              ),

                            ),
                          ),
                          SliverList(delegate:
                              SliverChildBuilderDelegate((context, index) {
                            return pageContent[index];
                          }))
                        ],
                      )),
                );
              }),
        ),
    );
  }
}