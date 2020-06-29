import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({this.posterDescription, this.posterName, this.timeStamp});
  final String posterName;
  final String posterDescription;
  final String timeStamp;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 115,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              PosterStamp(
                posterName: posterName,
                posterDescription: posterDescription,
              ),
              SizedBox(
                height: 2,
              ),
              PostTimeStamp(
                timeStamp: timeStamp,
              )
            ],
          ),
          Text(
            "20 min",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground.withAlpha(150),
              fontWeight: FontWeight.w300,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}

class PosterStamp extends StatelessWidget {
  const PosterStamp({this.posterName, this.posterDescription});
  final String posterName, posterDescription;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              posterName,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
            ),
            SizedBox(
              width: 5,
            ),
            //     posterDescription ??
            Text(
              posterDescription,
              style: TextStyle(
                color:
                    Theme.of(context).colorScheme.onBackground.withAlpha(150),
                fontWeight: FontWeight.w300,
                fontSize: 12,
              ),
            )
          ],
        ),
      ],
    );
  }
}

class PostTimeStamp extends StatelessWidget {
  PostTimeStamp({this.timeStamp});
  final String timeStamp;
  @override
  Widget build(BuildContext context) {
    return Text(
      "Posted $timeStamp",
      style: TextStyle(
          color: Theme.of(context).colorScheme.onBackground.withAlpha(150),
          fontWeight: FontWeight.w300,
          fontSize: 12),
    );
  }
}

class TextOnlyPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      width: double.infinity,
      // color: Colors.red,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            radius: 30,
            child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image: CachedNetworkImageProvider(
                            "http://southparkstudios.mtvnimages.com/shared/characters/kids/eric-cartman.png")))),
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              PostHeader(
                posterName: "PosterName",
                posterDescription: "Student Affairs",
                timeStamp: "21, December 2020",
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 115,
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mattis nunc morbi gravida et ante ornare scelerisque. Enim turpis duis integer iaculis quis sit volutpat. Urna suscipit nunc, quisque adipiscing amet interdum egestas arcu vel. Sit justo orci metus molestie.",
                  softWrap: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
