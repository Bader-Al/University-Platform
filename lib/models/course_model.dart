import 'package:meta/meta.dart';

import 'constants.dart';

class CourseModel {
  final String courseId;
  final String courseTitle;
  final String courseCode;
  final String dnLimit;
  final String courseInstructorName;

  CourseModel({
    @required this.courseId,
    @required this.courseTitle,
    @required this.courseCode,
    this.dnLimit = 'nan',
    this.courseInstructorName = 'unavailable',
  });

/* DN LIMIT DEFAULTS TO 0... In Bus. Logic, if 
   count == 0 .. we know we haven't fetched DN limit yet so we
   don't calculate %  
*/

  factory CourseModel.fromMap(Map courseMap) => CourseModel(
      courseId: courseMap[COURSE_ID],
      courseTitle: courseMap[COURSE_TITLE],
      courseCode: courseMap[COURSE_CODE],
      dnLimit: courseMap[COURSE_DN_LIMIT],
      courseInstructorName: courseMap[COURSE_INSTRUCTOR_NAME]);

  Map<String, String> toMap() => {
        COURSE_ID: this.courseId,
        COURSE_TITLE: this.courseTitle,
        COURSE_CODE: this.courseCode,
        COURSE_DN_LIMIT: this.dnLimit,
        COURSE_INSTRUCTOR_NAME: this.courseInstructorName
      };
}
