import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ClubsGrid extends StatelessWidget {
  ClubsGrid({this.flexFactor = 13});
  final flexFactor;
  @override
  Widget build(BuildContext context) {
    final phoneHeight = MediaQuery.of(context).size.height;
    return Expanded(
        flex: flexFactor,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15.0,
            top: 15,
          ),
          child: Container(
            // color: Colors.red,
            child: Stack(
              children: <Widget>[
                returnSidePanel(),
                ClipRRect(
                  borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(4)),
                  child: StaggeredGridView.countBuilder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    crossAxisCount: phoneHeight < 800
                        ? 1
                        : phoneHeight < 1200
                            ? 2
                            : 3,
                    itemCount: 24,
                    itemBuilder: (BuildContext context, int index) => ClubCard(
                      index: index,
                    ),
                    staggeredTileBuilder: (int index) =>
                        StaggeredTile.extent(1, index.isEven ? 275 : 325),
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget returnSidePanel() {
    return Positioned(
        // TODO :: Filter options
        top: 0,
        left: 0,
        child: Opacity(
          opacity: 0,
          child: Text("data"),
        ));
  }
}

class ClubCard extends StatefulWidget {
  ClubCard({this.index = 0});
  final int index;

  @override
  _ClubCardState createState() => _ClubCardState();
}

class _ClubCardState extends State<ClubCard> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(3),
      clipBehavior: Clip.hardEdge,
      child: GestureDetector(
        child: Container(
          color: Theme.of(context).colorScheme.background,
          child: Stack(children: [
            _returnCardImage(
                "https://picsum.photos/20${widget.index}/30${widget.index}"),
            _returnClubText("Cyber Security Club ${widget.index}", context),
          ]),
        ),
      ),
    );
  }

  Widget _returnCardImage(imageUrl) {
    return Positioned(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: CachedNetworkImageProvider(
                  imageUrl,
                ),
                fit: BoxFit.cover)),
      ),
      top: 0,
      bottom: 0,
      right: 0,
      left: 0,
    );
  }

  Widget _returnClubText(clubTitle, context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              clubTitle,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 12),
            ),
          ),
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.25),
                  Colors.black.withOpacity(0.10),
                  Colors.transparent
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0.6, 0.90, 1])),
      ),
    );
  }
}
