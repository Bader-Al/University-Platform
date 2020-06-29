import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:psu_platform/pages/homeWidgets/AbstractWidgets/sheetItem.dart';
import 'charts.dart';

class Grade {
  Grade({
    @required this.examType,
    @required this.earnedGrade,
    @required this.gradePossible,
    this.date,
    this.isSeen = true,
  });
  String examType;
  int earnedGrade, gradePossible;
  String date = "19 Jan 2021"; // TODO ":" change this later to be functional
  bool isSeen;
}

class GradeViewer extends StatelessWidget implements SheetItem {
  GradeViewer({
    @required this.gradesList,
    this.scrollController,
  });

  final List<Grade> gradesList;
  final scrollController;

  double padding = 15;
  Color backGroundColor;

  /// TODO:::: NEEDS CONSUMER?
  @override
  Widget build(BuildContext context) {
    backGroundColor = Theme.of(context).colorScheme.surface;

    return ChangeNotifierProvider<GradeSelectionData>(
        create: (context) => GradeSelectionData(),
        child: Consumer<GradeSelectionData>(
          builder: (context, gradeSelectionData, child) {
            return Container(
              color: backGroundColor,
              padding: EdgeInsets.only(left: padding, bottom: padding * 7),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      bottomLeft: Radius.circular(25)),
                ),
                padding: EdgeInsets.only(
                    left:
                        0), // there is a previous 10px idk where so this makes 15 PX
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        GradeExpansionTile(
                          title: Container(
                            // Contains the background
                            height: 155,
                          ),
                          children: [
                            Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.6,
                              color: Theme.of(context).colorScheme.background,
                              child: GradeChart(),
                            )
                          ],
                        ),
                        Container(
                          // Contains the listView
                          height: 155,
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
                                physics: ScrollPhysics(
                                    parent: BouncingScrollPhysics()),
                                itemCount: gradesList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return FlatButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      Provider.of<GradeSelectionData>(context)
                                          .setSelectedIndex(
                                              index, gradesList[index]);
                                    },
                                    child: GradeCard(
                                      gradeAttained:
                                          gradesList[index].earnedGrade,
                                      gradePossible:
                                          gradesList[index].gradePossible,
                                      examType: gradesList[index].examType,
                                      isWeaklyHighlighted:
                                          !gradesList[index].isSeen,
                                      isHighlighted:
                                          Provider.of<GradeSelectionData>(
                                                      context)
                                                  .selectedIndex ==
                                              index,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      // padding: EdgeInsets.zero,
                      onTap: () {
                        gradeSelectionData.switchExpansion();
                        // scrollController.jumpTo(100.0);
                      },
                      child: Container(
                        padding: EdgeInsets.only(bottom: 5),
                        color: Colors.transparent,
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text("Grade Overview",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}

///gradesList[index]

///
class GradeSelectionData extends ChangeNotifier {
  bool isExpanded = false;

  int selectedIndex = 0;

  void switchExpansion() {
    isExpanded = !isExpanded;
    notifyListeners();
  }

  void setSelectedIndex(int index, Grade gradeItem) {
    selectedIndex = index;
    if (index == selectedIndex) {
      //switchExpansion();
      gradeItem.isSeen = true;
    } else
      selectedIndex = index;

    notifyListeners();

    print(
        "index: $index\nselectedIndex: $selectedIndex\nexpanded: $isExpanded");
  }
}

class GradeCard extends StatelessWidget {
  GradeCard({
    @required this.gradeAttained,
    @required this.gradePossible,
    @required this.examType,
    this.isHighlighted = false,
    this.isWeaklyHighlighted = false,
  });

  final int gradeAttained, gradePossible;
  final examType;
  final bool isHighlighted;
  final bool isWeaklyHighlighted;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.only(right: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: isHighlighted
          ? Theme.of(context).colorScheme.primary
          : isWeaklyHighlighted
              ? Theme.of(context).colorScheme.primaryVariant
              : Theme.of(context).colorScheme.surface,
      clipBehavior: Clip.hardEdge,
      child: Container(
          width: 151,
          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              circleIndicator(context, gradeAttained, gradePossible,
                  isHighlighted, isWeaklyHighlighted),
              SizedBox(height: 5),
              bottomDetails(
                  context, examType, isHighlighted || isWeaklyHighlighted)
            ],
          )),
    );
  }

  Widget circleIndicator(context, gradeAttained, gradePossible, isHighlighted,
      isWeaklyHighlighted) {
    return Expanded(
        child: CircularPercentIndicator(
      radius: 75,
      lineWidth: isHighlighted ? 2.5 : 2,
      backgroundColor: isHighlighted
          ? Theme.of(context).colorScheme.primary
          : isWeaklyHighlighted
              ? Theme.of(context).colorScheme.primaryVariant
              : Theme.of(context).colorScheme.background,
      percent: gradeAttained / gradePossible,
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: isHighlighted
          ? Theme.of(context).colorScheme.surface
          : isWeaklyHighlighted
              ? Theme.of(context).colorScheme.background
              : Theme.of(context).colorScheme.primary,
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "$gradeAttained",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: isHighlighted || isWeaklyHighlighted
                    ? Theme.of(context).colorScheme.surface
                    : Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.w300,
                fontSize: 18),
          ),
          SizedBox(height: 4),
          Container(
            height: 1,
            width: 25,
            color: isHighlighted || isWeaklyHighlighted
                ? Theme.of(context).colorScheme.surface.withAlpha(50)
                : Theme.of(context).colorScheme.primary.withAlpha(50),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            "$gradePossible",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: isHighlighted || isWeaklyHighlighted
                    ? Theme.of(context).colorScheme.surface
                    : Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.w300,
                fontSize: 18),
          ),
          SizedBox(height: 7)
        ],
      ),
    ));
  }

  Widget bottomDetails(context, examType, isHighlighted) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            //Checks to see if section is inputted. this determines wether the table is for courses or for chats etc
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "18 Jan 2018",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight:
                        isHighlighted ? FontWeight.w400 : FontWeight.w300,
                    color: isHighlighted
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context)
                            .colorScheme
                            .onBackground
                            .withAlpha(150)),
              ),
            ],
          ),
          Text(
            "$examType",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 13,
              color: isHighlighted
                  ? Theme.of(context).colorScheme.surface
                  : Theme.of(context).colorScheme.onSurface,
            ),
          )
        ],
      ),
    );
  }
}

///
///
Duration _kExpand = Duration(milliseconds: 400);

class GradeExpansionTile extends StatefulWidget {
  GradeExpansionTile({
    Key key,
    this.leading,
    @required this.title,
    this.backgroundColor,
    this.onExpansionChanged,
    this.children = const <Widget>[],
    this.trailing,
    this.initiallyExpanded = false,
  })  : assert(initiallyExpanded != null),
        super(key: key);
  final Widget leading;

  final Widget title;

  final ValueChanged<bool> onExpansionChanged;

  final List<Widget> children;

  final Color backgroundColor;

  final Widget trailing;

  final bool initiallyExpanded;

  @override
  _ExpansionTileState createState() => _ExpansionTileState();
}

class _ExpansionTileState extends State<GradeExpansionTile>
    with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeOutTween =
      CurveTween(curve: Curves.easeOut);
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _elasticOutTween =
      CurveTween(curve: Curves.elasticOut);
  static final Animatable<double> _fastOutSlowInTween =
      CurveTween(curve: Curves.fastOutSlowIn);
  static final Animatable<double> _fastLinearToSlowEaseInTween =
      CurveTween(curve: Curves.fastLinearToSlowEaseIn);

  static final Animatable<double> _halfTween =
      Tween<double>(begin: 0.0, end: 0.5);

  final ColorTween _borderColorTween = ColorTween();
  final ColorTween _headerColorTween = ColorTween();
  final ColorTween _iconColorTween = ColorTween();
  final ColorTween _backgroundColorTween = ColorTween();

  AnimationController _controller;
  Animation<double> _iconTurns;
  Animation<double> _heightFactor;
  Animation<Color> _borderColor;
  Animation<Color> _headerColor;
  Animation<Color> _iconColor;
  Animation<Color> _backgroundColor;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: _kExpand, vsync: this);
    //_heightFactor = _controller.drive(_elasticOutTween);
    _iconTurns = _controller.drive(_halfTween.chain(_easeInTween));
    _borderColor = _controller.drive(_borderColorTween.chain(_easeOutTween));
    _headerColor = _controller.drive(_headerColorTween.chain(_easeInTween));
    _iconColor = _controller.drive(_iconColorTween.chain(_easeInTween));
    _backgroundColor =
        _controller.drive(_backgroundColorTween.chain(_easeOutTween));

    //_isExpanded = PageStorage.of(context)?.readState(context) ?? widget.initiallyExpanded;

    //testing githubbb2
    if (_isExpanded) _controller.value = 1.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void expand() {
    _heightFactor = _controller.drive(_fastLinearToSlowEaseInTween);
    setState(() {
      _controller.forward();
    });
  }

  void collapse() {
    _heightFactor = _controller.drive(_fastOutSlowInTween);
    _controller.reverse().then<void>((void value) {
      if (!mounted) return;
      setState(() {
        // Rebuild without widget.children.
      });
    });
  }

  Widget _buildChildren(BuildContext context, Widget child) {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0, top: 0),
      child: Container(
        decoration: BoxDecoration(
          color: _backgroundColor.value ?? Colors.transparent,
        ),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ListTileTheme.merge(
                iconColor: _iconColor.value,
                textColor: _headerColor.value,
                child: Container(
                  child: widget.title,
                ),
              ),
              ClipRRect(
                // borderRadius:
                //     BorderRadius.only(bottomLeft: Radius.circular(15), topLeft: Radius.circular(25)),
                child: Align(
                  heightFactor: _heightFactor.value,
                  child: child,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    final ThemeData theme = Theme.of(context);
    _borderColorTween..end = theme.dividerColor;
    _headerColorTween
      ..begin = theme.textTheme.subhead.color
      ..end = theme.accentColor;
    _iconColorTween
      ..begin = theme.unselectedWidgetColor
      ..end = theme.accentColor;
    _backgroundColorTween..end = widget.backgroundColor;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<GradeSelectionData>(context).isExpanded ? expand() : collapse();
    final bool closed = !_isExpanded && _controller.isDismissed;
    return AnimatedBuilder(
      animation: _controller.view,
      builder: _buildChildren,
      child: closed ? null : Column(children: widget.children),
    );
  }
}
