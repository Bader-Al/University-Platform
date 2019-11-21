import 'package:flutter/material.dart';
import 'package:psu_platform/constants.dart';

class VerticalClubView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
          child: Text(
            "All",
            style: kBannerGiantText,
          ),
        ),
        Container(
          height: 195,
          child: ListView.builder(
            itemCount: 25,
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Club number $index",
                            style: kBannerMediumText,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Icon(Icons.person_outline),
                            Text("${100 - index}"),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.add),
                              Icon(Icons.star),
                              Icon(Icons.info)
                            ],
                          ),
                        )
                      ],
                    ),
                    Divider(color: Theme.of(context).accentColor,),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
