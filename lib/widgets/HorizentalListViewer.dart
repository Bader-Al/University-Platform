import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:provider/provider.dart';
import 'CourseContent/grades.dart';
import 'CourseContent/material.dart';
import 'customExpansionTile.dart';

class HorizentalDataListViewer extends StatelessWidget {
  HorizentalDataListViewer({
    @required this.dataBlocksList,
    @required this.title,
  });

  final List dataBlocksList;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ExpansionData>(
      builder: (context) => ExpansionData(),
      child: Center(
        child: Container(
          padding: EdgeInsets.only(left: 0, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "$title",
                        style: TextStyle(fontSize: 26),
                      ),
                      Icon(Icons.add),
                    ]),
              ),
              SizedBox(height: 15),
              Container(
                child: Stack(
                  children: <Widget>[
                    CustomExpansionTile(
                      title: Container(
                        // Contains the background

                        height: 100,
                        decoration: BoxDecoration(
                          gradient: kMainLinear,
                          //      color: kSecondColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                          ),
                        ),
                      ),
                      children: <Widget>[CourseTile()],
                    ),
                    Container(
                      // Contains the listView
                      height: 100,
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(
                            start: 3, top: 3, bottom: 3),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: dataBlocksList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return dataBlocksList[index];
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DataBlock extends StatefulWidget {
  const DataBlock({this.title, this.code, this.section, this.index});
  final int code;
  final String title, section;
  final int index;

  @override
  _DataBlockState createState() => _DataBlockState();
}

class _DataBlockState extends State<DataBlock> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    isSelected =
        widget.index == Provider.of<ExpansionData>(context).selectedIndex;
    String courseTitle = "${widget.title}";
    widget.code != null ? courseTitle += " ${widget.code}" : null;

    Color buttonColor = Theme.of(context).primaryColor;
 
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 100,
          child: FlatButton(
              padding: EdgeInsets.all(15),
              splashColor: Theme.of(context).accentColor,
              highlightColor: Theme.of(context).accentColor,
              color: buttonColor,
              shape: CircleBorder(side: isSelected? BorderSide(width: 2, color: Colors.white): BorderSide(width: 4, color: Theme.of(context).primaryColor) ),
              child: Center(
                child: widget.section != null
                    ? Column(
                        //Checks to see if section is inputted. this determines wether the table is for courses or for chats etc
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            widget.title == null
                                ? "Err Fetching title"
                                : "$courseTitle",
                            style: kHorizentalListObjectMedium,
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            "Sec. ${widget.section}",
                            style: kHorizentalListObjectSmall.copyWith(
                                color: kSecondColor.withOpacity(0.75)),
                          ),
                        ],
                      )
                    : Text(
                        widget.title == null
                            ? "Error fetching"
                            : "${widget.title}",
                        textAlign: TextAlign.center,
                        style: kHorizentalListObjectMedium,
                      ),
              ),
              onPressed: widget.title==null? (){} : () {
                if (Provider.of<ExpansionData>(context).selectedIndex == null) {
                  setState(() {
                    print("object1");
                    Provider.of<ExpansionData>(context)
                        .setSelectedIndex(widget.index);
                    Provider.of<ExpansionData>(context).switchExpansion();
                  });
                } else if (widget.index ==
                    Provider.of<ExpansionData>(context).selectedIndex) {
                  setState(() {
                    print("object2");
                    Provider.of<ExpansionData>(context).setSelectedIndex(null);
                    Provider.of<ExpansionData>(context).switchExpansion();
                  });
                } else {
                  setState(
                    () {
                      print("object3");
                      Provider.of<ExpansionData>(context)
                          .setSelectedIndex(widget.index);
                    },
                  );
                }
                // isSelected=!isSelected;
              }),
        ),
        SizedBox(
          width: 3,
        )
      ],
    );
  }
}

///
class ExpansionData extends ChangeNotifier {
  bool expanded = false;

  int selectedIndex;

  void switchExpansion() {
    expanded = !expanded;
    notifyListeners();
  }

  void setSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}

///

class CourseTile extends StatefulWidget {
  @override
  _CourseTileState createState() => _CourseTileState();
}

class _CourseTileState extends State<CourseTile> with TickerProviderStateMixin {
  TabController _tabController;

  final courseContentPages = [CourseGrades(), CourseMaterial()];

  List<Widget> _tabBarTitles = [Text("Grades"), Text("Material")];

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    _tabController = new TabController(vsync: this, length: 6);
    return DefaultTabController(
      length: 6,
      initialIndex: 0,
      child: Container(
        width: double.infinity,
        height: 350,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(appBarBorderRadius))),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Stack(alignment: Alignment.center, children: [
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.white,
                    Colors.white70,
                    Colors.white54
                  ])),
                  height: 30,
                ),
                TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  tabs: [
                    Text("Material"),
                    Text("Grades"),
                    Text("Deadlines"),
                    Text("Deadlines"),
                    Text("Deadlines"),
                    Text("Deadlines")
                  ],
                  labelStyle:
                      TextStyle(fontSize: 21, fontWeight: FontWeight.w400),
                  labelColor: Theme.of(context).primaryColor,
                  unselectedLabelColor: Colors.black45,
                  indicatorColor: Theme.of(context).primaryColor,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 2.0,
                  // indicator: BoxDecoration(
                  //   color: Theme.of(context).accentColor,

                  //   borderRadius: BorderRadius.only(bottomRight: Radius.circular(10) , topLeft: Radius.circular(10)),
                  // ),
                ),
              ]),
            ),
            // Container(child: Text("data"),),
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("Deadlines"),
                  Text("Deadlines"),
                  Text("Deadlines")
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
