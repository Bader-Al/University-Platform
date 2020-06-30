import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psu_platform/pages/StudentHome/academicsPage.dart';

class BodyInTheBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final academicPageState = Provider.of<AcademicPageState>(context);

    return AnimatedPositioned(
      duration: Duration(milliseconds: 300),
      curve: Curves.decelerate,
      height: MediaQuery.of(context).size.height -
          MediaQuery.of(context).size.height * academicPageState.currentExtent,
      // bottom:
      //     MediaQuery.of(context).size.height * academicPageState.currentExtent,
      child: Container(
        // duration: Duration(seconds: 3),
        color: Colors.yellow,
        width: MediaQuery.of(context).size.width,
        child: FlatButton(
            onPressed: () {
              academicPageState.incrementPageIndex();
            },
            child: Text("Change page yay")),
      ),
      top: 0,
    );
  }
}
// TODO :: probably gona need a layout builder to make responsive grid over horizontal list layout
