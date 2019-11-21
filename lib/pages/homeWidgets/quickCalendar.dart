import 'package:flutter/material.dart';
import 'package:psu_platform/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';

class QuickCalendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 55,bottom: 45),
      child: Container(
        color: Colors.white24,
          child: QuickCalendarSlider(),
        ),
    );
  }
}

class QuickCalendarSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      aspectRatio: 7 / 9,
      initialPage: 0,
      enlargeCenterPage: false,
      
      enableInfiniteScroll: false,
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return DayBlock();
          },
        );
      }).toList(),
    );
  }
}

class DayBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15 , vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(4, 8))
                  ],
                  color: Theme.of(context).primaryColor,
                  borderRadius: kCustomCardBorderRadius),
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 5,right: 5,bottom: 5),
                child: Container(
                  decoration: BoxDecoration(borderRadius: kCustomCardBorderRadius, color: kMainRed),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 70,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Today",
                                style: kQuickCalendarHeader,
                              ),
                              Text("2nd January 2019", style: kBannerMediumText.copyWith(color: Colors.white60),),
                            ],
                          ),
                        ),
                      ),
                      ClassTimeBlock(),
                      ClassTimeBlock(
                        title: "SE365",
                        isUpcoming: true,
                      ),
                      ClassTimeBlock(
                        title: "ISC 120",
                        isQuiz: false,
                      ),
                      ClassTimeBlock(
                        title: "PSY 420",
                        isPresentation: false,
                      ),
                      ClassTimeBlock(
                        title: "PSY 420",
                        isExam: true,
                      ),
                      ClassTimeBlock(
                        title: "PSY 420",
                        isOther: false,
                      ),
                      ClassTimeBlock(
                        title: "PSY 420",
                        isOther: false,
                      ),
                      Container(height: 25,)
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ClassTimeBlock extends StatelessWidget {
  ClassTimeBlock(
      {this.title,
      this.isUpcoming = false,
      this.isQuiz = false,
      this.isExam = false,
      this.isPresentation = false,
      this.isOther = false});

  final String title;
  final bool isUpcoming;
  final bool isQuiz;
  final bool isExam;
  final bool isPresentation;
  final bool isOther;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: isExam
                ? kMainRed
                : isQuiz
                    ? Colors.yellow
                    : isPresentation
                        ? Colors.blue
                        : isOther ? Colors.orange : Colors.white,
            border: isUpcoming
                ? Border.all(
                    width: 2,
                    color: Colors.white,
                  )
                : Border.all(width: 0, color: Colors.white)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(title == null ? "CS285" : title),
              TimeFrame(
                timeStart: DateTime(2019, 9, 9, 10, 00),
                timeEnd: DateTime(2019, 9, 9, 11, 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TimeFrame extends StatelessWidget {
  TimeFrame({this.timeStart, this.timeEnd});

  final DateTime timeStart;
  final DateTime timeEnd;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(timeStart.hour.toString()),
        SizedBox(
          width: 25,
        ),
        Icon(Icons.arrow_right),
        SizedBox(
          width: 25,
        ),
        Text(timeEnd.hour.toString()),
      ],
    );
  }
}
