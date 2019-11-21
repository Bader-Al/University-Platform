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
          height: 200,
          color: Theme.of(context).accentColor,
          child: ListView.builder(
            itemCount: 25,
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),color: Colors.white),
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Club number $index",
                              style: kBannerMediumText.copyWith(color: Colors.black),
                            ),
                            Row(
                              children: <Widget>[
                                Icon(Icons.person_outline),
                                Text("${100 - index}"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(Icons.add),
                                SizedBox(width: 5,),
                                Icon(Icons.star),
                                SizedBox(width: 5,),
                                Icon(Icons.info)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Divider(thickness: 1, height: 1, endIndent: 25, indent: 25,),
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
