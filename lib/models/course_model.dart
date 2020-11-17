import 'package:meta/meta.dart';

import 'constants.dart';

class CourseModel {
  final String courseId;
  final String courseTitle;
  final String courseCode;

  CourseModel(
      {@required this.courseId,
      @required this.courseTitle,
      @required this.courseCode});

  factory CourseModel.fromMap(Map courseMap) => CourseModel(
      courseId: courseMap[COURSE_ID],
      courseTitle: courseMap[COURSE_TITLE],
      courseCode: courseMap[COURSE_CODE]);

  Map<String, String> toMap() => {
        COURSE_ID: this.courseId,
        COURSE_TITLE: this.courseTitle,
        COURSE_CODE: this.courseCode
      };
}
