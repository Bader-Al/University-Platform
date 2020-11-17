import 'package:meta/meta.dart';
import 'package:psu_platform/models/constants.dart';

class GradeModel {
  final String courseId;
  final String earnedGrade;
  final String gradePossible;

  GradeModel({this.courseId, this.earnedGrade, this.gradePossible});

  factory GradeModel.fromMap(Map<String, String> gradeMap) => GradeModel(
      courseId: gradeMap[COURSE_ID],
      earnedGrade: gradeMap[GRADE_OBTAINED],
      gradePossible: gradeMap[GRADE_MAX]);

  Map<String, String> toMap() => {
        COURSE_ID: this.courseId,
        GRADE_OBTAINED: this.earnedGrade,
        GRADE_MAX: this.gradePossible
      };
}
