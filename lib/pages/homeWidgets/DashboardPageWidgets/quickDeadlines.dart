import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psu_platform/constants.dart';
import 'package:psu_platform/pages/StudentHome/dashboardPage.dart';

//IMPORTANT~!!!!!
// sticky.remove(); WHEN NAVIGATING AWAY FROM HOME SCREEN
// CALL sticky.remove();

class QuickDeadlines extends StatelessWidget {
  const QuickDeadlines({this.deadLines});
  final List deadLines;
  //double _spaceBetweenTitleAndBody = 15.0;
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    double phoneHeight = queryData.size.height;
    double height = phoneHeight * 0.5;

    if (phoneHeight < 600) {
      // nexus 4 is 592
      height = 0.66 * phoneHeight;
      //mainFrameHeight=height;
    }
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Deadlines",
              style: kDashboardHeading.copyWith(
                  color: Theme.of(context).colorScheme.onSurface)),
          SizedBox(
            height: 15,
          ),
          Body(this.deadLines)
        ],
      ),
    );
  }
}

class Body extends StatelessWidget {
  Body(this.deadLines);

  List deadLines;


  GlobalKey _mainFrameKey = GlobalKey();

  Size boxSize;
  getSize() {
    RenderBox _frameBox = _mainFrameKey.currentContext.findRenderObject();
    boxSize = _frameBox.size;
    mainFrameHeight = boxSize.height;
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => getSize());
    // getSize();


    return Expanded(
        child: Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(2.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          // padding: EdgeInsets.all(2),

          child: Stack(
            key: _mainFrameKey,
            fit: StackFit.passthrough,
            children: <Widget>[
              DateSelector(
              ),
              DeadLinesContentViewer(
                this.deadLines
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

var mainFrameHeight;

class DateTab extends StatelessWidget {
  DateTab(this.index);
  bool isSelected;
  final int index;
  @override
  Widget build(BuildContext context) {
    isSelected = index == Provider.of<DateSelectionData>(context).selectedIndex;
    return Container(
      height: isSelected ? 100 : 80,
      color: Theme.of(context).colorScheme.background,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primary.withAlpha(180)
              : Theme.of(context).colorScheme.primary,
        ),
        child: FlatButton(
          padding:
              const EdgeInsets.only(top: 14, bottom: 10, left: 5, right: 30),
          highlightColor: Theme.of(context).colorScheme.secondary,
          splashColor: Theme.of(context).colorScheme.secondary,
          onPressed: () {
            Provider.of<DateSelectionData>(context).setSelectedIndex(index);
          },
          child: Column(
            mainAxisAlignment:
                isSelected ? MainAxisAlignment.center : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Due 5 days",
                style: TextStyle(
                    fontSize: 15,
                    color: isSelected
                        ? Colors.white
                        :Theme.of(context).colorScheme.background.withAlpha(150),
                    fontWeight: FontWeight.w400),
              ),
              Text(
                "September 21",
                style: TextStyle(
                    fontSize: 12,
                    color: isSelected
                        ? Colors.white
                        : Theme.of(context).colorScheme.background.withAlpha(150),
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List _dates = [
  DateTab(0),
  DateTab(1),
  DateTab(2),
  DateTab(3),
  DateTab(4),
  DateTab(5),
  DateTab(6),
  DateTab(7),
];

class DateSelector extends StatefulWidget {
  DateSelector({this.scrollController});
  final scrollController;

  @override
  _DateSelectorState createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DateSelectionData>(
      create: (context) => DateSelectionData(),
      child: Container(
        width: 115,
        // color: Theme.of(context).colorScheme.background,
        child: ListView.builder(
          itemCount: 7,
          itemBuilder: (BuildContext context, int index) {
            DateTab temp = DateTab(index);
            temp.isSelected = index == _selectedIndex;
            return temp;
          },
        ),
      ),
    );
  }
}

class DateSelectionData extends ChangeNotifier {
  int selectedIndex = 0;
  void setSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}

class DeadLinesContentViewer extends StatelessWidget {
  DeadLinesContentViewer(this.deadLines);
  final List deadLines;
  // TODO :: NEEDS TO BE STAEFUL FOR CHANGES IN LIST TO HAPPEN
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 115,
        ), // DEADSPACE IN BG
        Expanded(
          child: Container(
              color: Theme.of(context).colorScheme.surface,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
                child:
                ExpandingDeadlineListView(deadLines: this.deadLines,),
              )),
        )
      ],
    );
  }
}

class CompactFileItem extends StatelessWidget {
  CompactFileItem({this.isDownloaded = false});
  final bool isDownloaded;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: isDownloaded ? 10 : 10, bottom: 5),
      width: 150,
      child: FlatButton(
        color: isDownloaded
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.surface,
        onPressed: (() {}),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(
                isDownloaded ? Icons.delete : Icons.file_download,
                color: isDownloaded
                    ? Theme.of(context).colorScheme.background
                    : Theme.of(context).colorScheme.primary,
              ),
              Text(
                "A_very_loooong_assignment_description.pdf",
                style: TextStyle(
                  color: isDownloaded
                      ? Theme.of(context).colorScheme.surface
                      : Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w300,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}

class CompactFileViewer extends StatelessWidget { // major performance issues NOMORE
                                                  // ISSUES WHERE TRACED DOWN TO COMPACT FILE ITEM
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: _items.length, itemBuilder: (BuildContext context, int index) {
      return _deadlineContent[index];
    },);

//      ListView(
//      scrollDirection: Axis.horizontal,
//      children: <Widget>[
//        SizedBox(width: 15),
//        CompactFileItem(
//          isDownloaded: true,
//        ),
//        SizedBox(width: 15),
//        CompactFileItem(),
//        SizedBox(width: 15),
//        CompactFileItem(),
//        SizedBox(width: 15),
//        CompactFileItem(),
//        SizedBox(width: 15),
//        CompactFileItem(),
//        SizedBox(width: 25),
//      ],
//    );


  }

  List _deadlineContent = [

    SizedBox(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
//    SizedBox(width: 15),
//    CompactFileItem(
//      isDownloaded: true,
//    ),
//    SizedBox(width: 15),
//    CompactFileItem(),
//    SizedBox(width: 15),
//    CompactFileItem(),
//    SizedBox(width: 15),
//    CompactFileItem(),
//    SizedBox(width: 15),
//    CompactFileItem(),
//    SizedBox(width: 25),

  ];
}

////////////////////////////////// ExpandingDeadlines[ Right Side

class Deadline {
  Deadline(
      {this.isExpanded = false,this.deadlineType, this.deadlineCourseName, this.deadlineTitle, this.deadlineDueDate });

  bool isExpanded;
    final String deadlineType;
  final String deadlineTitle;
  final String deadlineCourseName;
  final String deadlineDueDate; 
}

List<Deadline> _items = <Deadline>[
  Deadline(),
];

class ExpandingDeadlineListView extends StatefulWidget {
  const ExpandingDeadlineListView({Key key, this.deadLines }) : super(key: key);
  final List deadLines;
  @override
  _ExpandingDeadlineListViewState createState() =>
      _ExpandingDeadlineListViewState();
}

class _ExpandingDeadlineListViewState extends State<ExpandingDeadlineListView> {
  int selectedIndex;
  ScrollController scrollController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController = new ScrollController();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

   

    return SingleChildScrollView(
      controller: scrollController,
      physics: ScrollPhysics(parent:BouncingScrollPhysics()),
      child: 
        ExpansionPanelList(
          expandedHeaderPadding: EdgeInsets.all(0),

          expansionCallback: (int index, bool isExpanded, ) {
            setState(() {
              widget.deadLines[index].isExpanded = !widget.deadLines[index].isExpanded;
              widget.deadLines[index].isExpanded
                  ? selectedIndex = index
                  : selectedIndex = null;
              //print("Selected is $selectedIndex"); //
              print(mainFrameHeight);
              double jumptoValue = (index.toDouble()*100) + 17*index;
              print("jumptoValue: $jumptoValue");
            });
          },
          children: 
          widget.deadLines.map(( deadline) {
            var expansionPanel = // did this split up so that i can deal with expansionPanel later in hopes to use something like a key to find its scroll poisition
            ExpansionPanel(
              

                canTapOnHeader: true,
                headerBuilder: (BuildContext ctx, bool isExpanded) {
                  return DeadLineHeader(
                    deadlineTitle: deadline.deadlineTitle,
                  deadlineCourseName: deadline.deadlineCourseName,
                  deadlineDueDate: deadline.deadlineDueDate,
                  deadlineType: deadline.deadlineType,
                  
                  );
                },
                isExpanded: deadline.isExpanded,
                body: DeadLineBody()


            );
            


            return expansionPanel;
          }).toList(),
        )
      
    );
  }

}

class DeadLineBody extends StatelessWidget {
   const DeadLineBody();
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: mainFrameHeight==null?150: mainFrameHeight - 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[Spacer(flex: 2, ), // you could completely replace spacer with Expanded... same exact thing but with a child
          Container( height: 200,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child:  CompactFileViewer(),
          ), Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: Container(
                    height:
                    45, // The expanded only expands horizontally.. leave this here
                    child: FlatButton(
                      color: Theme.of(context).colorScheme.surface,
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.only(topRight: Radius.circular(10)),
                      ),
                      child: Text(
                        "Description",
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                            color: Theme.of(context).colorScheme.onSurface),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  )),
              SizedBox(
                width: 15,
              ),
              Expanded(
                  child: Container(
                    height: 45,
                    child: FlatButton(
                      color: Theme.of(context).colorScheme.primary,
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(10)),
                      ),
                      child: Text(
                        "Attempt",
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                            color: Theme.of(context).colorScheme.background),
                      ),
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}


class DeadLineHeader extends StatelessWidget {
  const DeadLineHeader({this.deadlineType, this.deadlineTitle, this.deadlineCourseName, this.deadlineDueDate});
  final String deadlineType;
  final String deadlineTitle;
  final String deadlineCourseName;
  final String deadlineDueDate; 

  @override
  // RenderBox box;
  Widget build(BuildContext context) {

  //  box = context.findRenderObject();
  //  print(box.size);
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 2.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                 Text(deadlineTitle??
                  "Assignment Submission",
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 16),
                ),
                 Text(deadlineCourseName??"Introduction To Software Engineering",
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 12)),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
              decoration: BoxDecoration(
                  color: kYellowIndication.withAlpha(100),
                  borderRadius: BorderRadius.circular(25)),
              child: Text(deadlineDueDate??
                "Due 21 September",
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 12),
              ))
        ],
      ),
    );
  }
}
