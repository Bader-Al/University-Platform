import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psu_platform/constants.dart';

//IMPORTANT~!!!!!
// sticky.remove(); WHEN NAVIGATING AWAY FROM HOME SCREEN
// CALL sticky.remove();

class QuickDeadlines extends StatelessWidget {
  double _spaceBetweenTitleAndBody = 15.0;
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    double phoneHeight = queryData.size.height;
    double height = phoneHeight * 0.45;

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
          Text("Deadlines", style: kDashboardHeading),
          SizedBox(
            height: _spaceBetweenTitleAndBody,
          ),
          Body()
        ],
      ),
    );
  }
}

class Body extends StatelessWidget {
  ScrollController _scrollController = new ScrollController();

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
    mainFrameScrollController = _scrollController;

    return Expanded(
        key: _mainFrameKey,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Stack(
              fit: StackFit.passthrough,
              children: <Widget>[
                DateSelector(
                  scrollController: this._scrollController,
                ),
                DeadLinesContentViewer(
                  scrollController: this._scrollController,
                ),
              ],
            ),
          ),
        ));
  }
}

var mainFrameHeight;
ScrollController mainFrameScrollController;

class DateTab extends StatelessWidget {
  DateTab(this.index);
  bool isSelected;
  int index;
  @override
  Widget build(BuildContext context) {
    isSelected =
        index == Provider.of<DateSelectionData>(context).selectedIndex;
    return Material(
      color: kSurfaceColor.withAlpha(0),
          child: InkWell(
        highlightColor: kAccentColor,
        splashColor: kAccentColor,
        onTap: () {Provider.of<DateSelectionData>(context).setSelectedIndex(index);},
        child: Container(
          color: isSelected ? kSurfaceColor.withAlpha(50) : kMainColor,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Due 5 days",
                style: TextStyle(
                    fontSize: 15,
                    color: kSurfaceFirstShade,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                "September 21",
                style: TextStyle(
                    fontSize: 12,
                    color: kSurfaceColor.withAlpha(150),
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
        width: 100,
        color: kMainColor,
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
  // TODO :: NEEDS TO BE STAEFUL FOR CHANGES IN LIST TO HAPPEN
  DeadLinesContentViewer({this.scrollController});
  final scrollController;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 100,
        ), // DEADSPACE IN BG
        Expanded(
          child: Container(
              color: kSurfaceFirstShade,
              child: Padding(
                padding: EdgeInsets.only(top: 5, right: 5, bottom: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                  child: ExpandingDeadlineListView(),
                ),
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
      padding: EdgeInsets.only(top: isDownloaded ? 0 : 10, bottom: 5),
      width: 150,
      child: FlatButton(
        color: isDownloaded ? kMainColor : kSurfaceFirstShade,
        onPressed: (() {}),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(
                isDownloaded ? Icons.delete : Icons.file_download,
                color: isDownloaded ? kSurfaceColor : kMainColor,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "A_very_loooong_assignment_description.pdf",
                style: TextStyle(
                  color: isDownloaded ? kSurfaceColor : kMainColor,
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

class CompactFileViewer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        SizedBox(width: 15),
        CompactFileItem(
          isDownloaded: true,
        ),
        SizedBox(width: 15),
        CompactFileItem(),
        SizedBox(width: 15),
        CompactFileItem(),
        SizedBox(width: 15),
        CompactFileItem(),
        SizedBox(width: 15),
        CompactFileItem(),
        SizedBox(width: 25),
      ],
    );
  }
}

////////////////////////////////// ExpandingDeadlines[ Right Side

class ExpandingDeadline {
  ExpandingDeadline(
      {this.isExpanded = false, this.header = "HEADER", this.body = "BOODY"});

  bool isExpanded;
  final String header;
  final String body;
}

List<ExpandingDeadline> _items = <ExpandingDeadline>[
  ExpandingDeadline(),
  ExpandingDeadline(),
  ExpandingDeadline(),
  ExpandingDeadline(),
  ExpandingDeadline(),
  ExpandingDeadline(),
];

class ExpandingDeadlineListView extends StatefulWidget {
  ExpandingDeadlineListView({Key key}) : super(key: key);

  @override
  _ExpandingDeadlineListViewState createState() =>
      _ExpandingDeadlineListViewState();
}

class _ExpandingDeadlineListViewState extends State<ExpandingDeadlineListView> {
  int selectedIndex;
  ScrollController scrollController = new ScrollController();
  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      children: <Widget>[
        ExpansionPanelList(
          expandedHeaderPadding: EdgeInsets.all(0),
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              _items[index].isExpanded = !_items[index].isExpanded;
              _items[index].isExpanded
                  ? selectedIndex = index
                  : selectedIndex = null;
              //print("Selected is $selectedIndex"); //
              //scrollController.animateTo(index*mainFrameHeight-(125*2) , duration: new Duration(seconds: 2), curve: Curves.ease);
              // _items[index].isExpanded?scrollController.jumpTo(index.toDouble()*(mainFrameHeight-(180+index+20))):null; //180 = header 85 + body 95 +++ padding 20
              // scrollController.attach(ScrollPosition(physics: ScrollPhysics(parent: ()), context: null));
            });
          },
          children: _items.map((ExpandingDeadline item) {
            return ExpansionPanel(
                canTapOnHeader: true,
                headerBuilder: (BuildContext ctx, bool isExpanded) {
                  return deadlineCardHeader();
                },
                isExpanded: item.isExpanded,
                body: deadlineCardBody());
          }).toList(),
        )
      ],
    );
  }

  Widget deadlineCardBody() {
    return Container(
      height: mainFrameHeight != null ? mainFrameHeight - 95 : 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: CompactFileViewer(),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: Container(
                height: 45,
                child: FlatButton(
                  color: kSurfaceFirstShade,
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
                        color: kCounterSurfaceColor),
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
                  color: kMainColor,
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
                        color: kSurfaceColor),
                  ),
                ),
              ))
            ],
          )
        ],
      ),
    );
  }

  Widget deadlineCardHeader() {
    return Container(
      height: 85,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 2.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Introduction To Software Engineering",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: kCounterSurfaceColor,
                        fontSize: 12)),
                Text(
                  "Assignment Submission",
                  style: TextStyle(
                      fontWeight: FontWeight.w300, color: kCounterSurfaceColor),
                ),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
              decoration: BoxDecoration(
                  color: kYellowIndication.withAlpha(100),
                  borderRadius: BorderRadius.circular(25)),
              child: Text(
                "Due 21 September",
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: kCounterSurfaceColor,
                    fontSize: 12),
              ))
        ],
      ),
    );
  }
}
//////////////////////////////////////////////
