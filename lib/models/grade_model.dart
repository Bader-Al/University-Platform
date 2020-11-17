import 'package:meta/meta.dart';
import 'package:psu_platform/models/constants.dart';

class GradeModel {
  final String courseId;
  final String earnedGrade;
  final String gradePossible;
  final String gradeType;
  final String gradeDate;

  GradeModel({
    @required this.courseId,
    @required this.earnedGrade,
    @required this.gradePossible,
    @required this.gradeType,
    @required this.gradeDate,
  });

  factory GradeModel.fromMap(Map<String, String> gradeMap) => GradeModel(
      courseId: gradeMap[COURSE_ID],
      earnedGrade: gradeMap[GRADE_OBTAINED],
      gradePossible: gradeMap[GRADE_MAX],
      gradeType: gradeMap[GRADE_TYPE],
      gradeDate: gradeMap[GRADE_DATE]);

  Map<String, String> toMap() => {
        COURSE_ID: this.courseId,
        GRADE_OBTAINED: this.earnedGrade,
        GRADE_MAX: this.gradePossible,
        GRADE_TYPE: this.gradeType,
        GRADE_DATE: this.gradeDate
      };
}
