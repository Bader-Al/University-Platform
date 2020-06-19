import 'package:flutter/material.dart';

class AcademicItem extends StatelessWidget {

  

  @override
  Widget build(BuildContext context) {
    return 
  Padding(
    padding: const EdgeInsets.only(bottom: 30),
    child: Container(
     // color: Colors.red,
     height: 75,
      padding: EdgeInsets.all(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start ,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image(image: AssetImage('lib/assets/icons/assignmentPdf.png')),
         // Icon(Icons.assignment, size: 75, color: Theme.of(context).colorScheme.primary, ), // the color thing is temporary.. 
          SizedBox(width: 15,),
          Container(
            width: 225,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: Text("Assignmnet", style: TextStyle(fontWeight: FontWeight.w300, color: Theme.of(context).colorScheme.primary),),
                ),
              Text("Lorem Ipsum dolor sit ametr consectetu.pdf", style:TextStyle(fontWeight: FontWeight.w400, color: Theme.of(context).colorScheme.primary) , maxLines: 3, softWrap: true, ),
              
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
            Text("15.3 MB", style: TextStyle(fontWeight: FontWeight.w300, color: Color(0xff5E7CE2), fontSize: 12),)
            ,Image(image: AssetImage('lib/assets/icons/downloadCourseContent.png'), height: 24,),
          ],)
        ],
      ),
    ),
  );
  }
}