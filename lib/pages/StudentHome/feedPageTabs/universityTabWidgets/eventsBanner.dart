import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

class UniversityEventsHighlightsBanner extends StatelessWidget {
  const UniversityEventsHighlightsBanner(this.flexFactor);
  final int flexFactor;

  @override
  Widget build(BuildContext context) {
    double boxWidth = MediaQuery.of(context).size.width;
    return Expanded(
      flex: flexFactor,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Container(
          width: boxWidth - 30,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Events",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground,
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 25, bottom: 5),
                    child: Icon(
                      Icons.add_alert,
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(0.5),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Expanded(child: EventsListView())
            ],
          ),
        ),
      ),
    );
  }
}

class EventsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0.0),
      child: ClipRRect(
        borderRadius: BorderRadius.horizontal(
            left: Radius.circular(7), right: Radius.circular(7)),
        child: ListView.builder(
          physics: ScrollPhysics(parent: BouncingScrollPhysics()),
          itemCount: eventItems.length,
          itemExtent: MediaQuery.of(context).size.width < 760
              ? MediaQuery.of(context).size.width / 2.5
              : MediaQuery.of(context).size.width / 3.5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return eventItems[index];
          },
        ),
      ),
    );
  }
}

List<EventCard> eventItems = [
  EventCard(
    description:
        "Come learn directily from the most influencial financial investors in the Kingdom",
    imageUrl:
        "https://unsplash.com/photos/ZzOa5G8hSPI/download?force=true&w=640",
  ),
  EventCard(
    description:
        "Something about football and inspriation for our team cz life and shi",
    imageUrl:
        "https://unsplash.com/photos/OgqWLzWRSaI/download?force=true&w=640",
    posterTitle: "Football Club",
  ),
  EventCard(
    description: "What does it take?",
    imageUrl:
        "https://unsplash.com/photos/qAjJk-un3BI/download?force=true&w=640",
  ),
  EventCard(
    description: "Only Load 4 at first... then load more when user scrolls",
  ),
];

class EventCard extends StatelessWidget {
  EventCard({
    this.description,
    this.imageUrl,
    this.posterTitle = "",
  });
  final String description;
  final String imageUrl;
  final String posterTitle;

  final double innerPaddingHor = 15;
  final double innerPaddingVer = 10;
  final TextStyle textStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 5.0,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7),
        child: Stack(children: [
          returnImageContainer(),
          Positioned(
            child: returnDescription(context),
            bottom: 0,
            right: 0,
            left: 0,
          )
        ]),
      ),
    );
  }

  Widget returnImageContainer() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(),
      child: Image(
        height: double.infinity,
        image: CachedNetworkImageProvider(imageUrl ??
            "https://images.unsplash.com/1/type-away.jpg?q=80&fm=jpg&w=400&fit=max"),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget returnDescription(context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.black.withAlpha(120), Colors.transparent],
              stops: [0.7, 1],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter)),
      child: Container(
        // height: 85,
        padding: EdgeInsets.symmetric(
            horizontal: innerPaddingHor, vertical: innerPaddingVer),
        child: Container(
            alignment: Alignment.centerLeft,
            height: 85,
            child: RichText(
                textAlign: TextAlign.left,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                text: TextSpan(style: textStyle, children: [
                  posterTitle != null
                      ? TextSpan(
                          text: "${posterTitle}\n",
                          style: textStyle.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.secondary))
                      : null,
                  TextSpan(
                    text: "$description",
                  ),
                ]))),
      ),
    );
  }
}
