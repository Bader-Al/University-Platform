import 'package:flutter/material.dart';
import 'package:psu_platform/pages/homeWidgets/SharedWidgets/draggableBottomSheet.dart';
import 'universityTabWidgets/eventsBanner.dart';
import 'universityTabWidgets/billboardHeader.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:psu_platform/pages/homeWidgets/feedWidgets/feedPageContentItems.dart';

class UniversityTab extends StatelessWidget {
  const UniversityTab();

  @override
  Widget build(BuildContext context) {
    double distanceFromBottom = MediaQuery.of(context).size.height * 0.2 + 40;

    return Stack(
      children: <Widget>[
        //  Positioned(child: BillBoardHeader() , top: 50,),
        Positioned(
          child: Container(
            //  height: MediaQuery.of(context).size.height-distanceFromBottom,
            // color:Colors.red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                BillBoardHeader(5),
                SizedBox(height: 13),
                UniversityEventsHighlightsBanner(
                    8), // the Ints passed in are the FLEX FACTOR FOR EXPANDED!!!
              ],
            ),
          ),
          bottom: distanceFromBottom + 70,
          top: 15,
          left: 0,
          right: 0,
        ), // value added to the right is like padding between this and tabselector

        Positioned(
          child: Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Text(
              "University".toUpperCase(),
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
          bottom: MediaQuery.of(context).size.height * 0.2 + 5,
        ),

        DraggableBottomSheet(
          pageIndex: 0,
          pageContent: [
            SearchHeader(),
            GenericPost(
                postImage: PostImage(
              imageUrl:
                  "https://lenadealmeida.files.wordpress.com/2013/02/dsc_0117.jpg",
              imageDescription: "HELLOOOOOOOOOOOOOOOOOOO",
            )),
            GenericPost(
              postText: "THIS IS GENEERRIIIICCCC YYYAYYY",
            ),
            GenericPost(),
            GenericPost(
              postImage: PostImage(
                imageUrl: "https://source.unsplash.com/random",
                imageDescription: "HELLOOOOOOOOOOOOOOOOOOO",
              ),
            ),
            GenericPost(),
            GenericPost(),
            GenericPost(),
            GenericPost(),
            GenericPost(),
            GenericPost(),
            GenericPost(),
          ],
          horizontalPadding: 2,
        ),
      ],
    );
  }
}
