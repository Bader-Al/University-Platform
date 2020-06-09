import 'package:flutter/material.dart';
import '../../constants.dart';
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
      create: (context) => ExpansionData(),
      child: Container(
        padding: EdgeInsets.only(
            left: 15,
            top: 10), // there is a previous 10px idk where so this makes 15 PX
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "$title",
                      style: kDashboardHeading,
                    ),
                    Icon(Icons.add),
                  ]),
            ),
            SizedBox(height: 10),
            Stack(
              children: <Widget>[
                CustomExpansionTile(
                  title: Container(
                    // Contains the background
                    height: 150,
                    decoration: BoxDecoration(
                      color: kMainColor,
                      //      color: kSecondColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          bottomLeft: Radius.circular(25)),
                    ),
                  ),
                  children: <Widget>[CourseTile()],
                ),
                Container(
                  // Contains the listView
                  height: 150,
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: 10,
                      top: 10,
                      bottom: 10,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15)),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: dataBlocksList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return dataBlocksList[index];
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
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

    Color buttonColor = kSurfaceColor;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(right: 3),
          width: 154,
          child: FlatButton(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8.5),
              highlightColor: Theme.of(context).primaryColor,
              color: buttonColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: widget.section != null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(child: Icon(Icons.delete, size: 46,)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              //Checks to see if section is inputted. this determines wether the table is for courses or for chats etc
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  widget.title == null
                                      ? "Err Fetching title"
                                      : "$courseTitle",
                                  style: TextStyle(fontSize:14, fontWeight: FontWeight.w300, color: kCounterSurfaceColor),
                                ),
                                Text(
                                  "18 Jan 2018",
                                  style: TextStyle(fontSize:12, fontWeight: FontWeight.w300, color: kCounterSurfaceColor.withAlpha(150)),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 3),
                              child: Text(
                                "Quiz",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: kSurfaceColor),
                              ),
                              decoration:
                                  BoxDecoration(color: kGreenIndication, borderRadius: BorderRadius.circular(50)),

                            )
                          ],
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
              onPressed: widget.title == null
                  ? () {}
                  : () {
                      if (Provider.of<ExpansionData>(context).selectedIndex ==
                          null) {
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
                          Provider.of<ExpansionData>(context)
                              .setSelectedIndex(null);
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
