import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:bezier_chart/bezier_chart.dart';

class GradeChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        BezierChart(
          bezierChartScale: BezierChartScale.CUSTOM,

          xAxisCustomValues: const [
            0,
            5,
            10,
            15,
            20,
            25,
            30,
            35,
            40,
            45,
            50,
            55,
            60,
            65,
            70
          ], // TODO:: Make those Dates

          series: [
            BezierLine(
              dataPointFillColor: Theme.of(context).colorScheme.primary,
              dataPointStrokeColor: Theme.of(context).colorScheme.secondary,
              lineColor: Theme.of(context).colorScheme.primary,
              data: const [
                DataPoint<double>(value: 10, xAxis: 0),
                DataPoint<double>(value: 75, xAxis: 5),
                DataPoint<double>(value: 50, xAxis: 10),
                DataPoint<double>(value: 100, xAxis: 15),
                DataPoint<double>(value: 75, xAxis: 20),
                DataPoint<double>(value: 0, xAxis: 25),
                DataPoint<double>(value: 5, xAxis: 30),
                DataPoint<double>(value: 45, xAxis: 35),
                DataPoint<double>(value: 90, xAxis: 40),
                DataPoint<double>(value: 50, xAxis: 45),
                DataPoint<double>(value: 36, xAxis: 50),
                DataPoint<double>(value: 75, xAxis: 55),
                DataPoint<double>(value: 0, xAxis: 60),
                DataPoint<double>(value: 5, xAxis: 65),
                DataPoint<double>(value: 45, xAxis: 70),
              ],
            ),
            BezierLine(
              dataPointFillColor: Theme.of(context).colorScheme.onBackground,
              dataPointStrokeColor: Colors.transparent,
              //  Theme.of(context).colorScheme.onBackground.withAlpha(100),
              lineColor:
                  Theme.of(context).colorScheme.onBackground.withAlpha(100),
              data: const [
                DataPoint<double>(value: 20, xAxis: 0),
                DataPoint<double>(value: 40, xAxis: 5),
                DataPoint<double>(value: 50, xAxis: 10),
                DataPoint<double>(value: 60, xAxis: 15),
                DataPoint<double>(value: 75, xAxis: 20),
                DataPoint<double>(value: 22, xAxis: 25),
                DataPoint<double>(value: 33, xAxis: 30),
                DataPoint<double>(value: 12, xAxis: 35),
                DataPoint<double>(value: 40, xAxis: 40),
                DataPoint<double>(value: 50, xAxis: 45),
                DataPoint<double>(value: 60, xAxis: 50),
                DataPoint<double>(value: 75, xAxis: 55),
                DataPoint<double>(value: 22, xAxis: 60),
                DataPoint<double>(value: 33, xAxis: 65),
                DataPoint<double>(value: 12, xAxis: 70),
              ],
            ),
          ],
          config: BezierChartConfig(
              verticalIndicatorStrokeWidth: 1.0,
              // backgroundGradient: LinearGradient(colors: [
              //   Theme.of(context).colorScheme.primary,
              //   Theme.of(context).colorScheme.primaryVariant
              // ], begin: Alignment.topCenter, end: Alignment.bottomLeft),
              backgroundColor: Theme.of(context).colorScheme.background,
              verticalIndicatorColor: Theme.of(context).colorScheme.secondary,
              showVerticalIndicator: true,
              pinchZoom: true,
              footerHeight: 20,
              bubbleIndicatorColor: Theme.of(context).colorScheme.background,
              bubbleIndicatorLabelStyle:
                  TextStyle(color: Theme.of(context).colorScheme.onBackground),
              bubbleIndicatorValueStyle:
                  TextStyle(color: Theme.of(context).colorScheme.onBackground),
              xAxisTextStyle:
                  TextStyle(color: Theme.of(context).colorScheme.onBackground),

              // backgroundColor: Theme.of(context).colorScheme.primary,
              snap: false,
              displayYAxis: true,
              stepsYAxis: 15,
              yAxisTextStyle:
                  TextStyle(color: Theme.of(context).colorScheme.primary),
              physics: ScrollPhysics(parent: BouncingScrollPhysics()),
              contentWidth: MediaQuery.of(context).size.width * 2),
        ),
        Positioned(
          child: Container(
            width: 120,
            child: Text(
              "Cummilative grades out of 100%",
              style: TextStyle(
                fontSize: 21,
                color: Theme.of(context).colorScheme.onBackground,
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.end,
            ),
          ),
          top: 25,
          right: 25,
        ),
      ],
    );
  }
}
