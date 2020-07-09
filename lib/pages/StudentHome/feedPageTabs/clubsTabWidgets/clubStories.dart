import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psu_platform/appState.dart';
import 'package:flutter_stories/flutter_stories.dart';

class ClubsStories extends StatelessWidget {
  ClubsStories({@required this.flexFactor = 3});
  final flexFactor;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flexFactor,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 15.0,
        ),
        child: Container(
          // color: Theme.of(context).colorScheme.primary,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 24,

            // itemExtent: 85,
            itemBuilder: (BuildContext context, int index) {
              return StoryCircle(
                index: index,
                imageUrl: "https://picsum.photos/10$index/20$index",
              );
            },
          ),
        ),
      ),
    );
  }
}

// List stories = [

// ];

class StoryCircle extends StatelessWidget {
  StoryCircle({
    this.index = 0,
    @required this.imageUrl,
  });
  final int index;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    AppState _appState = Provider.of<AppState>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Color(0xFFa05dce), width: 2),
        ),
        child: ClipOval(
          child: Image(
            image: CachedNetworkImageProvider(
              imageUrl,
            ),
            fit: BoxFit.cover,
            width: 75,
            height: 75,
          ),
        ),
      ),
    );
  }
}
