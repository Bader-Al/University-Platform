import 'package:flutter/material.dart';
import 'package:psu_platform/constants.dart';

class FeedPage extends StatelessWidget {
  List<Widget> tabs = [
    UniversityTab(),
    ClubsTab(),
    CoursesTab(),
    CollabTab(),
  ];
  List<Widget> tabTitles = [
    
    CustomTab(
       text: "University",
      icon: Icon(Icons.school),
    ),
    CustomTab(
      text: "Clubs",
      icon: Icon(Icons.people),
    ),
    CustomTab(
      text: "Courses",
      icon: Icon(Icons.class_),
    ),
    CustomTab(
      text: "Collaborations",
      icon: Icon(Icons.forum), // icon should represent idea icon like lightbulb or handshake not search!
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          backgroundColor: Theme.of(context).accentColor,
          appBar: AppBar(
            elevation: 0,
            titleSpacing: 0.0,
            
            title: Column( // Tha Appbar is just wrapped in a column cz somehow tht automatically pads that mainaxis Start. Column could be removed but the top will be touched (Appbar edge top screen)
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TabBar(
                  isScrollable: true,
                  tabs: tabTitles,
                  labelColor: Theme.of(context).primaryColor,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                  unselectedLabelColor: Theme.of(context).accentColor,
                  labelPadding:
                      EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
                  indicator: BoxDecoration(
                    //boxShadow: [BoxShadow(color: kMainRed,offset: Offset(-5, 0)),BoxShadow(color: kMainRed,offset: Offset(5, 0))],
                    borderRadius: BorderRadius.vertical(top: Radius.circular(100)),
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(children: tabs),
        ),
      ),
    );
  }
}

////////////////////// CustomTab
class CustomTab extends StatelessWidget {
  CustomTab({@required this.text,@required this.icon, this.flipped=false});
  final String text;
  final Icon icon;
  final bool flipped;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: !flipped?
          [this.icon,Text(this.text)]
          :
          [Text(this.text), this.icon]
      ),
    );
  }
}

//////////////////////////////////////////// Widgets

class ImageWithTextBlock extends StatelessWidget {
  
  ImageWithTextBlock({this.title, this.paragraph});

  final String title, paragraph;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title!=null?"$title":"",
                style: TextStyle(fontSize: 26),
                textAlign: TextAlign.start,
              ),

              Row(children: <Widget>[
                Icon(Icons.report)
              ],)
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "ParagraprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIhprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIhprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIhprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIhprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIhprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIhprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIhprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIhprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIhprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIhprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIhprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIh",
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.start,
          ),
          Row(),
          SizedBox(height: 25,),
        ],
      ),
    );
  }
}

class SoloTextBlock extends StatelessWidget {
  SoloTextBlock({ this.title, this.paragraph});

  final String title, paragraph;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title!=null?"$title":"",
                style: TextStyle(fontSize: 26),
                textAlign: TextAlign.start,
              ),

              Row(children: <Widget>[
                Icon(Icons.report)
              ],)
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "ParagraprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIhprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIhprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIhprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIhprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIhprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIhprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIhprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIhprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIhprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIhprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIhprfgywrfpigupfigaERWUIFGA9[EWURFGHAPUIREGFIUPFGHAISRUYFGAPI;OUREGVA[PEIURGFPIh",
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.start,
          ),
          Row(),
          SizedBox(height: 25,),
        ],
      ),
    );
  }
}

////////////////////////////////////////////////  TABS
class UniversityTab extends StatelessWidget {
  final List<Widget> universityContent = [
    ImageWithTextBlock(title: "Imagee",),
    SoloTextBlock(title: "Header",),
    SoloTextBlock(),
    SoloTextBlock(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomListViewBuilder(
        items: universityContent,
      ),
    );
  }
}

class ClubsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Clubs Page"),
    );
  }
}

class CoursesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        
      ],
    ),);}
}

class CollabTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Collab Page"),
    );
  }
}

///////////////////////// Common ListView For All

class CustomListViewBuilder extends StatelessWidget {
  CustomListViewBuilder({@required this.items, this.reverse = true});
  final List<Widget> items;
  final bool reverse;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      //will be switched from StreamBuilder
      child: ListView.builder(
        reverse: this.reverse,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return items[index];
        },
      ),
    );
  }
}
