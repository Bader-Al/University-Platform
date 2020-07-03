import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:bezier_chart/bezier_chart.dart';

class GradeChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: BezierChart(
          bezierChartScale: BezierChartScale.CUSTOM,
          selectedValue: 70,

          onValueSelected: (value) => print(value),

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
              label: "My Average",
              dataPointFillColor: Theme.of(context).colorScheme.primary,
              dataPointStrokeColor: Theme.of(context).colorScheme.primary,
              lineColor: Theme.of(context).colorScheme.primary,
              data: const [
                DataPoint<double>(value: 10, xAxis: 0),
                DataPoint<double>(value: 75, xAxis: 5),
                DataPoint<double>(value: 50, xAxis: 10),
                DataPoint<double>(value: 95, xAxis: 15),
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
              label: "Class Average",
              dataPointFillColor:
                  Theme.of(context).colorScheme.secondary.withAlpha(100),
              dataPointStrokeColor: Colors.transparent,
              //  Theme.of(context).colorScheme.onBackground.withAlpha(100),
              lineColor: Theme.of(context).colorScheme.secondary.withAlpha(100),
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
              bubbleIndicatorTitleStyle: TextStyle(fontWeight: FontWeight.w400),
              verticalIndicatorStrokeWidth: 1.0,
              backgroundColor: Theme.of(context).colorScheme.background,
              verticalIndicatorColor: Theme.of(context).colorScheme.primary,
              verticalLineFullHeight: true,
              showDataPoints: true,
              pinchZoom: true,
              footerHeight: 20,
              // updatePositionOnTap: true,
              // startYAxisFromNonZeroValue: true,
              bubbleIndicatorColor: Theme.of(context).colorScheme.surface,
              xLinesColor: Colors.green,
              displayDataPointWhenNoValue: true,
              bubbleIndicatorLabelStyle:
                  TextStyle(color: Theme.of(context).colorScheme.onBackground),
              bubbleIndicatorValueStyle:
                  TextStyle(color: Theme.of(context).colorScheme.onBackground),
              xAxisTextStyle:
                  TextStyle(color: Theme.of(context).colorScheme.primary),

              // backgroundColor: Theme.of(context).colorScheme.primary,
              snap: false,
              displayYAxis: true,
              stepsYAxis: 10,
              yAxisTextStyle:
                  TextStyle(color: Theme.of(context).colorScheme.primary),
              physics: ScrollPhysics(parent: BouncingScrollPhysics()),
              contentWidth: MediaQuery.of(context).size.width * 2),
        ),
      ),
    );
  }
}
