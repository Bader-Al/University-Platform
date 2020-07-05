import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class AbsenceViewer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0, bottom: 0),
      child: ListView.builder(
        itemCount: _absences.length,
        scrollDirection: Axis.horizontal,
        reverse: true,
        physics: BouncingScrollPhysics(),
        itemExtent: MediaQuery.of(context).size.height / 6.5,
        padding: EdgeInsets.only(right: 15),
        itemBuilder: (BuildContext context, int index) {
          return _absences[index];
        },
      ),
    );
  }
}

List _absences = [
  AbsenceContainer(
    title: "ENG 201",
    currentCount: 7,
    maxCount: 12,
    isSeen: false,
  ),
  AbsenceContainer(),
  AbsenceContainer(),
  AbsenceContainer(),
  AbsenceContainer(),
];

class AbsenceContainer extends StatelessWidget {
  AbsenceContainer(
      {this.title = "CS 420",
      this.currentCount = 7,
      this.maxCount = 16,
      this.isSeen = true});
  final String title;
  final double currentCount, maxCount;
  final bool isSeen;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CircularPercentIndicator(
          radius: MediaQuery.of(context).size.height / 7,
          lineWidth: 3,
          animation: true,
          animationDuration: 1,
          circularStrokeCap: CircularStrokeCap.round,
          backgroundColor: Theme.of(context).colorScheme.background,
          percent: currentCount / maxCount,
          progressColor: currentCount / maxCount > 0.6
              ? Colors.redAccent
              : (isSeen
                  ? Theme.of(context).colorScheme.secondaryVariant
                  : Theme.of(context).colorScheme.secondary),
          center: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                currentCount.toInt().toString(),
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              Text(
                title,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 12,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
