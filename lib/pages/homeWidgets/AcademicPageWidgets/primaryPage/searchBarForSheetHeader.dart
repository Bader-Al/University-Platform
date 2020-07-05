import 'package:flutter/material.dart';

import 'dart:ui';
import 'package:flutter/rendering.dart';



// TODO: TRY USING THE HEADER AS A PART OF THE BODY RATHER THAN A SLIVERAPPBAR OR APPBAR... 
// THERE'S NO NEED TO SEARCH ONCE SCROLLED DOWN AND THERE'S NO NEED TO SEE CALENDAR/ANNOUNCEMENTS


class SearchButton extends StatefulWidget {
  @override
  _SearchButtonState createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  double _width = 53;
  bool _searchButtonIsExpanded = false;
  BuildContext _context;

  void expandSearchBar() {
    setState(() {
      _searchButtonIsExpanded = true;
      _width = (MediaQuery.of(context).size.width - 30);
    });
  }

  void collapseSearchBar() {
    print("object!!!!");
    setState(() {
      _searchButtonIsExpanded = false;
      _width = 53;
    });
  }

  @override
  Widget build(BuildContext context) {
    _context =
        context; // workaround to fix passing context outside cz (context)=>expand... didnt work
    return InnerShadow(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 350),
        curve: Curves.decelerate,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Theme.of(context).colorScheme.background),
        height: 32,
        width: _width,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Stack(
                alignment: Alignment.center,
                fit: StackFit.expand,
                children: searchBar(context)
                
                )),
      ),
      shadows: [
        BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 0.25,
            spreadRadius: 0.1,
            color: Colors.black.withAlpha(25)),
      ],
    );
  }

/////////////////////////////////////////////////////////////////////////////////////////////////
  List<Widget> searchBar(context) => [
        Visibility(
          visible: _searchButtonIsExpanded,
          child: PositionedDirectional(
            start: -15,
            child: FlatButton(
                onPressed: collapseSearchBar,
                child: Icon(
                  Icons.close,
                  size: 18,
                  color: Theme.of(context).colorScheme.primary,
                )),
          ),
        ),
        PositionedDirectional(
          end: -17,
          child: FlatButton(
            padding: EdgeInsets.only(top:3),
              onPressed: expandSearchBar,
              child: 
              Image(image:  AssetImage('lib/assets/icons/search.png', ), fit: BoxFit.contain, height: 16,)
              
              
              ),
        )
      ];

// List<Widget> collapsedSearchBar(context, Function expand) => [
//       FlatButton(
//           onPressed: expand,
//           child: Icon(
//             Icons.search,
//             size: 18,
//             color: Theme.of(context).colorScheme.primary,
//           )),
//     ];

}

/////////////////////////////////////////////////////////////// BELLOW IS A COPIED CODE USED AS A LIBRARY FROM INTERWEBS
//////////////////////////////////////////////////////////////
class InnerShadow extends SingleChildRenderObjectWidget {
  const InnerShadow({
    Key key,
    this.shadows = const <Shadow>[],
    Widget child,
  }) : super(key: key, child: child);

  final List<Shadow> shadows;

  @override
  RenderObject createRenderObject(BuildContext context) {
    final renderObject = _RenderInnerShadow();
    updateRenderObject(context, renderObject);
    return renderObject;
  }

  @override
  void updateRenderObject(
      BuildContext context, _RenderInnerShadow renderObject) {
    renderObject.shadows = shadows;
  }
}

class _RenderInnerShadow extends RenderProxyBox {
  List<Shadow> shadows;

  @override
  void paint(PaintingContext context, Offset offset) {
    if (child == null) return;
    final bounds = offset & size;
    final canvas = context.canvas;

    canvas.saveLayer(bounds, Paint());
    context.paintChild(child, offset);

    for (final shadow in shadows) {
      final shadowRect = bounds.inflate(shadow.blurSigma);
      final shadowPaint = Paint()
        ..blendMode = BlendMode.srcATop
        ..colorFilter = ColorFilter.mode(shadow.color, BlendMode.srcOut)
        ..imageFilter = ImageFilter.blur(
            sigmaX: shadow.blurSigma, sigmaY: shadow.blurSigma);
      canvas
        ..saveLayer(shadowRect, shadowPaint)
        ..translate(shadow.offset.dx, shadow.offset.dy);
      context.paintChild(child, offset);
      canvas.restore();
    }

    canvas.restore();
  }
}
