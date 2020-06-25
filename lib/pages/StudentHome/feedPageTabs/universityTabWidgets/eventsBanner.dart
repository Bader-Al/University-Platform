import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

class UniversityEventsHighlightsBanner extends StatelessWidget {
  const UniversityEventsHighlightsBanner(this.flexFactor) ;
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
                  Text("Events", style: TextStyle(color: Theme.of(context).colorScheme.onPrimary , fontSize: 24, fontWeight: FontWeight.w300 , letterSpacing: 1) ,  ),
                  
                  
                  
                  Padding(
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
      padding: const EdgeInsets.only(bottom:0.0),
      child: ClipRRect(
        borderRadius: BorderRadius.horizontal(left: Radius.circular(15), right: Radius.circular(7)),
              child: ListView.builder(
                physics: ScrollPhysics(parent: BouncingScrollPhysics()),
          itemCount: eventItems.length,
          itemExtent: 175,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index){
            return eventItems[index];
          },
        ),
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
        padding: const EdgeInsets.only(right:7.0,),
        child: ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: Stack(children: [
            Container(
    color: Theme.of(context).colorScheme.surface,
      child: 
        Image(
          height: double.infinity,
          image: CachedNetworkImageProvider(
              "https://images.unsplash.com/1/type-away.jpg?q=80&fm=jpg&w=400&fit=max"),
          fit: BoxFit.fitHeight,
        ),
    ),
            Positioned(
    child: Container(
        height: 65,
        width: 175,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        color: Theme.of(context).colorScheme.onSurface.withAlpha(155),
        child: Center(
          child: Text(
            "$title",
            softWrap: true,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: Theme.of(context).colorScheme.background, ),overflow: TextOverflow.ellipsis, maxLines: 3,
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