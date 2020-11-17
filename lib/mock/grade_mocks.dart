import 'package:psu_platform/models/grade_model.dart';

final List mockGrades = [
  GradeModel(
          courseId: '3',
          earnedGrade: '5',
          gradePossible: '5',
          gradeType: 'quiz',
          gradeDate: "19 Jan 2021")
      .toMap(),
  GradeModel(
          courseId: '3',
          earnedGrade: '8',
          gradePossible: '10',
          gradeType: 'major',
          gradeDate: "19 Jan 2021")
      .toMap(),
  GradeModel(
          courseId: '1',
          earnedGrade: '8',
          gradePossible: '15',
          gradeType: 'project',
          gradeDate: "19 Jan 2021")
      .toMap(),
  GradeModel(
          courseId: '1',
          earnedGrade: '6',
          gradePossible: '10',
          gradeType: 'major',
          gradeDate: "19 Jan 2021")
      .toMap(),
  GradeModel(
          courseId: '2',
          earnedGrade: '3',
          gradePossible: '5',
          gradeType: 'assignment',
          gradeDate: "19 Jan 2021")
      .toMap(),
  GradeModel(
          courseId: '3',
          earnedGrade: '2',
          gradePossible: '5',
          gradeType: 'activity',
          gradeDate: "19 Jan 2021")
      .toMap(),
  GradeModel(
          courseId: '5',
          earnedGrade: '10',
          gradePossible: '15',
          gradeType: 'project',
          gradeDate: "19 Jan 2021")
      .toMap(),
  GradeModel(
          courseId: '4',
          earnedGrade: '3',
          gradePossible: '5',
          gradeType: 'activity',
          gradeDate: "19 Jan 2021")
      .toMap(),
];
