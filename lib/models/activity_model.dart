import 'package:meta/meta.dart';
import 'package:psu_platform/models/constants.dart';

class ActivityModel {
  final String courseId;
  final String activityId;
  final String activityTitle;
  final String activityDeadline;
  final String activityType;
  final String submissionStatus;
  final String activityGrade;

  ActivityModel({
    @required this.courseId,
    @required this.activityId,
    @required this.activityTitle,
    @required this.activityDeadline,
    @required this.submissionStatus,
    this.activityGrade = 'n/a',
    this.activityType = 'unknown',
  });

  factory ActivityModel.fromMap(Map<String, String> activityMap) =>
      ActivityModel(
          courseId: activityMap[COURSE_ID],
          activityId: activityMap[COURSE_ACTIVITY_ID],
          activityTitle: activityMap[COURSE_ACTIVITY_TITLE],
          activityDeadline: activityMap[COURSE_ACTIVITY_DEADLINE],
          activityGrade: activityMap[COURSE_ACTIVITY_GRADE],
          activityType: activityMap[COURSE_ACTIVITY_TYPE],
          submissionStatus: activityMap[COURSE_ACTIVITY_STATUS]);

  Map<String, String> toMap() => {
        COURSE_ID: this.courseId,
        COURSE_ACTIVITY_ID: this.activityId,
        COURSE_ACTIVITY_TITLE: this.activityTitle,
        COURSE_ACTIVITY_DEADLINE: this.activityDeadline,
        COURSE_ACTIVITY_STATUS: this.submissionStatus,
        COURSE_ACTIVITY_GRADE: this.activityGrade,
        COURSE_ACTIVITY_TYPE: this.activityType,
      };
}
