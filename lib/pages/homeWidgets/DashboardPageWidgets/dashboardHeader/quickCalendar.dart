import 'package:flutter/material.dart';
import 'package:psu_platform/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';

class QuickCalendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, bottom: 55),
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: QuickCalendarSlider(),
        ),
      ),
    );
  }
}

class QuickCalendarSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    return Container(
      height: queryData.size.height*0.64,
      width: double.infinity,
      child: PageView.builder(itemBuilder: (context, index){
        return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: _quickCalendarItems[index],
              );
      }),
    );
   
   // OLD CODE BELOW ::: TODO ::: Just get rid of it....
    // return CarouselSlider(
    //   height: queryData.size.height*0.64,
    //   initialPage: 0,
    //   enlargeCenterPage: false,
    //   viewportFraction: 0.90,
    //   enableInfiniteScroll: false,
    //   items: [1, 2, 3, 4, 5].map((i) {
    //     return Builder(
    //       builder: (BuildContext context) {
    //         return Padding(
    //           padding: const EdgeInsets.only(right: 20.0, top: 0, bottom: 5),
    //           child: DayBlock(),
    //         );
    //       },
    //     );
    //   }).toList(),
    // );
  }
}

List _quickCalendarItems = [
  DayBlock(),
  DayBlock(),
  DayBlock(),
  DayBlock(),
  DayBlock(),
  DayBlock(),
  
];

class DayBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Colors.black12, offset: Offset(0, 1)),
                ],
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    DayBlockHeader(),
                    Expanded(
                      child: ListView.builder(
                        itemCount: timeStamps.length,
                        itemBuilder: (BuildContext context, int index) {
                          return timeStamps[index];
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

List<ClassTimeBlock> timeStamps = [
  ClassTimeBlock(
    title: "CS285\nDiscrete Math",
  ),
  ClassTimeBlock(
    title: "CS285\nDiscrete Math",
    isUpcoming: true,
    isHighlighted: true,
  ),
  ClassTimeBlock(),
  ClassTimeBlock(),
  ClassTimeBlock(),
  ClassTimeBlock(
    title: "CS285\nDiscrete Math",
  ),
  ClassTimeBlock(
    title: "CS285\nDiscrete Math",
  ),
  ClassTimeBlock(),
  ClassTimeBlock(),
  ClassTimeBlock(),
];

class ClassTimeBlock extends StatelessWidget {
  ClassTimeBlock(
      {this.title,
      this.isHighlighted = false,
      this.isUpcoming = false,
      this.isImportant = false});

  final String title;
  final bool isUpcoming;
  final bool isImportant;
  bool isHighlighted;

  @override
  Widget build(BuildContext context) {
    if (isUpcoming || isImportant) {
      isHighlighted = true;
    }
    return Container(
      height: 65,
      decoration: BoxDecoration(color: isUpcoming ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.background),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                width: 120,
                child: Text(
                  title == null
                      ? "CS101\nIntro To Software Engineeringrfwergwrgwrgwrgw"
                      : title,
                  style: kQuickCalendarHeader.copyWith(
                      color:
                          isHighlighted ? Theme.of(context).colorScheme.background : Theme.of(context).colorScheme.onBackground,
                      fontWeight: FontWeight.w300,
                      fontSize: 14),
                      softWrap: true,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                )),
            TimeFrame(
              isHighlighted: isHighlighted,
              textStyle: TextStyle(
                  color: isHighlighted ? Theme.of(context).colorScheme.background : Theme.of(context).colorScheme.onBackground,
                  fontWeight: FontWeight.w300),
              timeStart: DateTime(2019, 9, 9, 10, 00),
              timeEnd: DateTime(2019, 9, 9, 11, 30),
            ),
            Text(
              "Major Exam",
              style: TextStyle(
                  color: isHighlighted ? Theme.of(context).colorScheme.background : Theme.of(context).colorScheme.onBackground,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }
}

class TimeFrame extends StatelessWidget {
  TimeFrame({this.timeStart, this.timeEnd, this.textStyle, this.isHighlighted});
  final DateTime timeStart;
  final DateTime timeEnd;
  final bool isHighlighted;
  final TextStyle textStyle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        StartToEndIndicator(isHighlighted: isHighlighted),
        SizedBox(
          width: 5,
        ),
        Text(
          "8:00 AM\n9:00 PM",
          style: this.textStyle.copyWith(fontSize: 14),
        ),
      ],
    );
  }
}

class StartToEndIndicator extends StatelessWidget {
  StartToEndIndicator({this.isHighlighted = false});
  final bool isHighlighted;

  @override
  Widget build(BuildContext context) {
    Color indicatorBorderColor =
        isHighlighted ? Theme.of(context).colorScheme.onPrimary: Theme.of(context).colorScheme.onBackground;
    Color indicatorSurfaceColor = isHighlighted ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.background;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CircleAvatar(
            radius: 5,
            backgroundColor: indicatorBorderColor,
            child: CircleAvatar(
              backgroundColor: indicatorSurfaceColor,
              radius: 4,
            ),
          ),
          Container(height: 10, width: 1, color: isHighlighted?Theme.of(context).colorScheme.background:Theme.of(context).colorScheme.onBackground,),
          CircleAvatar(
            radius: 5,
            backgroundColor: indicatorBorderColor,
            child: CircleAvatar(
              backgroundColor: indicatorSurfaceColor,
              radius: 4,
              child: CircleAvatar(radius: 3, backgroundColor: Theme.of(context).colorScheme.background,),
            ),
          ),
        ],
      ),
    );
  }
}

class DayBlockHeader extends StatelessWidget {
  const DayBlockHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "Today",
                style: kQuickCalendarHeader.copyWith(color:Theme.of(context).colorScheme.onBackground),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Monday ",
                    style: kQuickCalendarHeader.copyWith(fontSize: 14, letterSpacing: 1.15 ,color:Theme.of(context).colorScheme.onBackground),
                  ),
                  SizedBox(width:5),
                  Text(
                    "2nd January 2019",
                    style: kQuickCalendarHeader.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w300, letterSpacing: 1.25,color:Theme.of(context).colorScheme.onBackground),
                  ),
                ],
              ),
            ],
          )),
          Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.primary,
          )
        ],
      ),
    );
  }
}
