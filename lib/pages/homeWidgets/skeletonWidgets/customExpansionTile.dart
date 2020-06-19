import 'package:flutter/material.dart';
import 'HorizentalListViewer.dart';
import 'package:psu_platform/constants.dart';
import 'package:provider/provider.dart';

Duration _kExpand = Duration(milliseconds: 400);

class CustomExpansionTile extends StatefulWidget {
  CustomExpansionTile({
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

class _ExpansionTileState extends State<CustomExpansionTile>
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
    Provider.of<ExpansionData>(context).expanded ? expand() : collapse();
    final bool closed = !_isExpanded && _controller.isDismissed;
    return AnimatedBuilder(
      animation: _controller.view,
      builder: _buildChildren,
      child: closed ? null : Column(children: widget.children),
    );
  }
}

