import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:psu_platform/theme_constants.dart';

class Billboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text("Billboard",
                style: kDashboardHeading.copyWith(
                    color: Theme.of(context).colorScheme.onSurface)),
          ),
          SizedBox(
            height: 15,
          ),
          Body()
        ],
      ),
    );
  }
}

class Body extends StatelessWidget {
  double boxHeight = 450.0, boxWidth = 350.0;
  double cardPadding = 24, boxPadding = 50;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      height: boxHeight + boxPadding,
      child: Swiper(
        // change to pageview builder
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(offset: Offset(-2, 8), color: Colors.black26)
              ],
              borderRadius: BorderRadius.circular(25),
            ),
            child: Stack(
              alignment: AlignmentDirectional.topStart,
              children: <Widget>[
                Positioned.fill(
                    // flex: 5,
                    child: Container(
                  alignment: AlignmentDirectional.topStart,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  width: double.infinity,
                  child: Container(
                      alignment: AlignmentDirectional.center,
                      child: Image(
                        image: NetworkImage(
                            "http://wallpapersqq.net/wp-content/uploads/2016/01/Trafalgar-Square-8.jpg"),
                        fit: BoxFit.contain,
                      )),
                )),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  // flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26, offset: Offset(0, -2))
                        ],
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(25),
                            top: Radius.circular(3))),
                    child: Padding(
                      padding: EdgeInsets.all(cardPadding),
                      child: Text("dataaaaaaaaaaaaaaaaaaaaaaaaa"),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: 10,
        itemWidth: boxWidth,
        itemHeight: boxHeight,
        layout: SwiperLayout.STACK,
      ),
    );
  }
}
