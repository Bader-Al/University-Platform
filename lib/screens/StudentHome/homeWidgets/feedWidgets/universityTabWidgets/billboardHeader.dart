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
        padding: const EdgeInsets.only(right: 15.0, left: 15),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(9),
          child: Stack(children: [
            Positioned(
              bottom: 0,
              top: 0,
              child: Container(
                width: boxWidth - 30,
                child: Image(
                  image: CachedNetworkImageProvider(
                      "https://cdn1.tnwcdn.com/wp-content/blogs.dir/1/files/2014/07/drone.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              child: Container(
                height: 65,
                width: boxWidth - 30,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                color: Theme.of(context).colorScheme.surface.withAlpha(200),
                child: Text(
                  "Our Univerisity joins drone racing and cinematography..",
                  softWrap: true,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).colorScheme.onSurface),
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
