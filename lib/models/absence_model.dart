import 'package:meta/meta.dart';

class AbsenceModel {
  final String courseId;
  final String absenceDate;
  final String warningLevel;

  AbsenceModel(
      {@required this.courseId, this.absenceDate, @required this.warningLevel});
}
