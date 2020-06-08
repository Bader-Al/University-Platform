import 'package:flutter/material.dart';
import 'package:psu_platform/constants.dart';


class VerticalClubView extends StatelessWidget {

  VerticalClubView({@required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Text(
            "$title",
          ),
        ),
        Container(
          height: 250,
          color: Theme.of(context).accentColor,
          child: ListView.builder(
            itemCount: 25,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "Club number $index",
                           // style: kBannerMediumText.copyWith(color: Colors.black),
                          ),
                        ),
                      //  SizedBox(width: 30,),
                        
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Icon(Icons.add),
                              SizedBox(width: 25,),
                              Icon(Icons.stars),
                              SizedBox(width: 25,),
                              Icon(Icons.info)
                            ],
                          ),
                        ),
                     //     SizedBox(width: 30,),


                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Icon(Icons.person_outline),
                              Text("${100 - index}" ,), // SUPPORTS UPTO 100000000000
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(thickness: 1, height: 0, color: Theme.of(context).accentColor,),
                ],
              
              );
            },
          ),
        ),
      ],
    );
  }
}
