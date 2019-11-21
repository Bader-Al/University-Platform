import 'package:flutter/material.dart';
import 'package:psu_platform/constants.dart';


class HorizontalClubView extends StatelessWidget {
  HorizontalClubView({@required this.items,@required this.title});
  String title;
  List<Widget> items;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
         Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Favorites",
                          style: kBannerGiantText,
                        ),
                        Icon(Icons.unfold_more, color: Colors.white,)
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 125,
                    color: Theme.of(context).accentColor,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: items.length,
                      padding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          child: items[index],
                          padding: EdgeInsets.symmetric(horizontal: 2),
                        );
                      },
                    ),
                  ),
      ],
    );
  }
}