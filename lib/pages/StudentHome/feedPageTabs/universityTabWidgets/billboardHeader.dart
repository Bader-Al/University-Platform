import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

class BillBoardHeader extends StatelessWidget {
  BillBoardHeader(this.flexFactor);
  final int flexFactor;
  double boxWidth;
  @override
  Widget build(BuildContext context) {
    boxWidth = MediaQuery.of(context).size.width;
    return Expanded(
      flex: flexFactor,
      child: Padding(
        padding: const EdgeInsets.only(right:15.0, left: 15),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
                child: Stack(children: [
            Container(
              height: 150,
              width: boxWidth - 30,
              child: Image(
                image: CachedNetworkImageProvider(
                    "https://cdn1.tnwcdn.com/wp-content/blogs.dir/1/files/2014/07/drone.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              child: ClipRect(
                            child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaY: 3, sigmaX: 3),
                              child: Container(
                    height: 65,
                    width: boxWidth-30,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    color: Theme.of(context).colorScheme.onSurface.withAlpha(135),
                    child: Text(
                      "Our Univerisity joins drone racing and cinematography..",
                      softWrap: true,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: Theme.of(context).colorScheme.background),
                    ),
                  ),
                ),
              ),
              bottom: 0,
            )
          ]),
        ),
      ),
    );
  }
}
