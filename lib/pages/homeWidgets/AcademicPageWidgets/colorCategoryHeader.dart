import 'package:flutter/material.dart';

import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'package:psu_platform/constants.dart';

class ColorBasedTabs extends StatefulWidget {
  @override
  _ColorBasedTabsState createState() => _ColorBasedTabsState();
}

class _ColorBasedTabsState extends State<ColorBasedTabs> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          // foregroundColor: Colors.red,
          backgroundColor: Theme.of(context).colorScheme.primary,
          radius:
              7, // TODO TODO TODO TODO resize to fit number when user picks up the card after certain extent
        ),
        SizedBox(
          width: 13,
        ),
        CircleAvatar(
          // foregroundColor: Colors.yellow,
          backgroundColor: kMainRed,
          radius: 7,
        ),
        SizedBox(
          width: 13,
        ),
        CircleAvatar(
          // foregroundColor: Colors.green,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          radius: 7,
        ),
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
