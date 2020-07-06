import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:psu_platform/pages/homeWidgets/AcademicPageWidgets/announcementsPage/absenceViewer.dart';

class AnnouncementsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 45.0,
        ),
        child: ListView.builder(
          itemCount: _announcements.length,
          physics: BouncingScrollPhysics(),
          reverse: false,
          padding: EdgeInsets.only(bottom: 350, top: 0),
          // itemExtent: 200,
          itemBuilder: (BuildContext context, int index) {
            return _announcements[index];
          },
        ),
      ),
    );
  }
}

final List _announcements = [
  AnnouncementContainer(
    isSeen: false,
  ),
  AnnouncementContainer(),
  AnnouncementContainer(),
  AnnouncementContainer(),
  AnnouncementContainer(),
];

class AnnouncementContainer extends StatelessWidget {
  AnnouncementContainer({this.isSeen = true});
  final bool isSeen;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(3),
        child: Container(
          padding: EdgeInsets.only(
            left: 5,
            right: 15,
          ),
          color: Theme.of(context).colorScheme.background,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              returnAnnouncementPosterDetails(context, isSeen),
              SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(8),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget returnAnnouncementPosterDetails(context, isSeen) {
    return Container(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: CachedNetworkImageProvider(
                            "http://southparkstudios.mtvnimages.com/shared/characters/kids/eric-cartman.png"))),
              ),
              SizedBox(
                width: 10,
              ),
              returnPosterNameAndCourse(context, isSeen)
            ],
          ),
          Container(
            padding: EdgeInsets.only(bottom: 7),
            height: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "12 min ago",
                  style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.onBackground,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "12/32/1997",
                  style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.onBackground,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget returnPosterNameAndCourse(context, isSeen) {
    return Container(
      padding: EdgeInsets.only(bottom: 7),
      // color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 100,
            child: Text(
              "Dr Gregory Hashem Khan",
              softWrap: true,
              style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.onBackground,
                  fontWeight: FontWeight.w300),
            ),
          ),
          Text(
            "LAW 111",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }
}
