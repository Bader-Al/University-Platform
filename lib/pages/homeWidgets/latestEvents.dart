import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:psu_platform/constants.dart';

class LatestEventsBox extends StatelessWidget {
  final double boxHeight = 450.0, boxWidth = 350.0;
  final double cardPadding = 24, boxPadding = 50;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      height: boxHeight + boxPadding,
      child: Swiper(
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
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  width: double.infinity,
                  child: Container(
                    alignment: AlignmentDirectional.center,
                      child: Image(
                    image: NetworkImage(
                        "https://www.unicef.org.uk/babyfriendly/wp-content/uploads/sites/2/2018/03/2000x1000-Conference-2016.jpg"),
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