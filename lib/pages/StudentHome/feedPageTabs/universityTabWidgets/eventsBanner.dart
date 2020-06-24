import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

class UniversityEventsHighlightsBanner extends StatelessWidget {
  UniversityEventsHighlightsBanner(this.flexFactor);
  final int flexFactor;

  @override
  Widget build(BuildContext context) {
    double boxWidth = MediaQuery.of(context).size.width;
    return Expanded(
      flex: flexFactor,
      child: Padding(
        padding: const EdgeInsets.only(left:15.0),
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
                        color: Theme.of(context).colorScheme.background,
                        fontSize: 24,
                        fontWeight: FontWeight.w300),
                  ), Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(Icons.add_alert , color: Theme.of(context).colorScheme.background.withAlpha(150),),
                  )
                ],
              ),
              SizedBox(height: 15),
              Expanded(
                  child: EventsListView()
              
              )
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
      padding: const EdgeInsets.only(bottom:5.0),
      child: ListView.builder(
        itemCount: eventItems.length,
        itemExtent: 150,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index){
          return eventItems[index];
        },
      ),
    );
  }
}

List<EventCard> eventItems = [
EventCard(title: "Robotics and IOT",),
EventCard(title: "Robotics and IOT",),
EventCard(title: "Robotics and IOT",),
EventCard(title: "Only Load 4 at first... then load more when user scrolls",),

];





class EventCard extends StatelessWidget {
  EventCard({this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right:5.0,),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(children: [
              Container(
                color: Theme.of(context).colorScheme.surface,
                  child: 
                  Image(
                    height: double.infinity,
                    image: CachedNetworkImageProvider(
                        "https://images.techhive.com/images/article/2016/09/data_science_classes-100682563-large.jpg"),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              Positioned(
                child: ClipRect(
                              child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaY: 3, sigmaX: 3),
                                child: Container(
                      height: 65,
                      width: 150,
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      color: Theme.of(context).colorScheme.onSurface.withAlpha(135),
                      child: Text(
                        "$title",
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
    );
  }
}