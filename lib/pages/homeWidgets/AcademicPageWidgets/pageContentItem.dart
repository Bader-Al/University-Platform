import 'package:flutter/material.dart';
import 'package:psu_platform/pages/homeWidgets/AbstractWidgets/sheetItem.dart';

class AcademicItem extends StatelessWidget implements SheetItem{

  double padding = 15;
  Color backGroundColor;

  @override
  Widget build(BuildContext context) {
    backGroundColor = Theme.of(context).colorScheme.surface;
    return 
  Container(
    color: backGroundColor,
    padding: const EdgeInsets.only(bottom: 30),
    child: Container(
      //width: double.infinity,
     //color: Colors.red,
     height: 75,
      padding: EdgeInsets.only(left:padding, right: padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start ,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image(image: AssetImage('lib/assets/icons/assignmentPdf.png'),),


          SizedBox(width: 15,),
          Container(
            // color: Colors.red,
            width: MediaQuery.of(context).size.width-170,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top:5.0),
                  child: Text("Assignment", style: TextStyle(fontWeight: FontWeight.w400, color: Theme.of(context).colorScheme.primary, letterSpacing: 1.5), ),
                ),
              Padding(
                padding: const EdgeInsets.only(bottom:3.0),
                child: Text("Lorem Ipsum dolor sit ametr consectetu.pdf", style:TextStyle(fontWeight: FontWeight.w300, color: Theme.of(context).colorScheme.onSurface) , maxLines: 3, softWrap: true, ),
              ),
              
              ],
            ),
          ), Spacer(),
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
            Text("15.3 MB", style: TextStyle(fontWeight: FontWeight.w300, color: Color(0xff5E7CE2), fontSize: 12),)
            ,Image(image: AssetImage('lib/assets/icons/downloadCourseContent.png'), height: 24,),
          ],), SizedBox(width: 15,),
          
        ],
      ),
    ),
  );
  }
}