import 'package:flutter/material.dart';
import 'quickCalendar.dart';
import '../../constants.dart';

class ScheduleBanner extends StatelessWidget {
  ScheduleBanner(this.boxIsScrolled);
  final bool boxIsScrolled;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).primaryColor,
      expandedHeight: kBannerHeight,
      floating: false,
      pinned: true,
      snap: false,
      title: SecondaryAppBarRow(),
      bottom: AppBar(title: PrimaryAppBarRow(), shape:kAppBarShape,),
      flexibleSpace: FlexibleSpaceBar(
        background: QuickCalendar(),
      ),
      shape: kAppBarShape,
    );
  }
}

class PrimaryAppBarRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: <Widget>[
        BannerColumn(topTitle: "Upcoming",bottomTitle: "CS285"), //TODO
        
        BannerColumn(
          topTitle: "location",
          bottomTitle: "New Building", // TODO ONCLICK FLIP NAMING CONVENTION
        ),
        //add option in settings to choose which building convention they want highlighted
        
        BannerColumn(
          topTitle: "At",
          bottomTitle: "1:50 pm",
        ), //TODO
       
        BannerColumn(
          topTitle: "room",
          bottomTitle: "A-12",
        )
      ],
    );
  }
}

class SecondaryAppBarRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        BannerColumn(
          topTitle: "Absences",
          bottomTitle: "2",
          color: Theme.of(context).accentColor,
        ),
        VerticalDivider(
          thickness: 1,
        ),
        BannerColumn(
          topTitle: "Section",
          bottomTitle: "201",
          color: Colors.white,
        ),
        SizedBox(
          width: 5,
        )
      ],
    );
  }
}

class BannerColumn extends StatelessWidget {
  final String topTitle;
  final String bottomTitle;
  final Color color;
  BannerColumn(
      {@required this.bottomTitle, @required this.topTitle, this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "$topTitle",
          style: this.color != null
              ? kBannerSmallText.copyWith(color: this.color)
              : kBannerSmallText,
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "$bottomTitle",
          style: this.color != null
              ? kBannerBigText.copyWith(color: this.color)
              : kBannerBigText,
        )
      ],
    );
  }
}
