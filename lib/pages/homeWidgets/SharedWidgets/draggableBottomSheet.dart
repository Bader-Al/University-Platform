import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DraggableBottomSheet extends StatelessWidget {
  DraggableBottomSheet({this.pageContent, this.pageIndex});
  final List pageContent;
  final int pageIndex;
  @override
  //  List colors = [Colors.red, Colors.green, Colors.yellow, Colors.cyan, Colors.indigoAccent]; // JUST FOR DEBUGGING PURPOSES
  Widget build(BuildContext context) {
    print(pageIndex);
    return DraggableScrollableSheet(
        key: ValueKey(pageIndex),
        initialChildSize: 0.4,
        minChildSize: 0.2,
        maxChildSize: 1,
        builder: (context, scrollController) {
          return Transform.translate(
            offset: Offset(0,
                -8), // this is done to hide the missing border radius when the sheet is expanded.

            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  child: CustomScrollView(
                    controller: scrollController,
                    slivers: <Widget>[
                      SheetHeader(
                        pageIndex: pageIndex,
                      ),
                      SliverFillRemaining(
                        child: ListView.builder(
                          itemBuilder: (context, index) => pageContent[index],
                          itemCount: pageContent.length,
                          controller: scrollController,
                        ),
                      )
                    ],
                  )),
            ),
          );
        });
  }
}

class SheetHeader extends StatelessWidget {
  SheetHeader({this.pageIndex});
  final int pageIndex;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      titleSpacing: 0,
      title: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
          ),
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(top:5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Spacer(flex:3),
                headerButton(context: context), Spacer(),
                searchButton(context),Spacer(),
                headerButton(context: context), Spacer(flex: 3,)
              ],
            ),
          )
          
          ),
    );
  }

  Widget headerButton({context, bool hideShadow=false}) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 1),
                blurRadius: 0.25,
                spreadRadius: 0.1,
                color: hideShadow?Colors.transparent: Colors.black.withAlpha(25)),
          ],
          borderRadius: BorderRadius.circular(50),
          color: Theme.of(context).colorScheme.background),
      height: 32,
      width: 53,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
          child:
              FlatButton(onPressed: () {}, child: Icon(Icons.calendar_today, size: 18, color: Theme.of(context).colorScheme.primary,))),
    );
  }

  Widget searchButton(context){
    return InnerShadow(
  child: headerButton(context: context, hideShadow: true),
  shadows: [
            BoxShadow(
                offset: Offset(0, 1),
                blurRadius: 0.25,
                spreadRadius: 0.1,
                color:  Colors.black.withAlpha(25)),
          ], 
);
  }
}




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
  void updateRenderObject(BuildContext context, _RenderInnerShadow renderObject) {
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
        ..imageFilter = ImageFilter.blur(sigmaX: shadow.blurSigma, sigmaY: shadow.blurSigma);
      canvas
        ..saveLayer(shadowRect, shadowPaint)
        ..translate(shadow.offset.dx, shadow.offset.dy);
      context.paintChild(child, offset);
      canvas.restore();
    }

    canvas.restore();
  }
}