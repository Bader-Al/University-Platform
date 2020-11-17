import 'package:psu_platform/models/course_model.dart';

final List<Map<String, String>> mockCourses = [
  CourseModel(
          courseId: '1',
          courseTitle: 'Introduction to Artificial Intelligence',
          courseCode: 'CS410')
      .toMap(),
  CourseModel(
          courseId: '2',
          courseTitle: 'Software Construction',
          courseCode: 'SE211')
      .toMap(),
  CourseModel(
          courseId: '3',
          courseTitle: 'Secure Software Development',
          courseCode: 'CYS402')
      .toMap(),
  CourseModel(
          courseId: '4',
          courseTitle: 'Introduction To Psychology',
          courseCode: 'PSY101')
      .toMap(),
  CourseModel(
          courseId: '5',
          courseTitle: 'Introduction to Robotics',
          courseCode: 'CS460')
      .toMap(),
  CourseModel(
          courseId: '6',
          courseTitle: 'Human Computer Interaction',
          courseCode: 'CS201')
      .toMap(),
  CourseModel(
          courseId: '7',
          courseTitle: 'Intermediate Weight Training',
          courseCode: 'PE211')
      .toMap(),
  CourseModel(
          courseId: '8',
          courseTitle: 'Data Structures and Algorithms',
          courseCode: 'CS210')
      .toMap(),
  CourseModel(courseId: '9', courseTitle: 'Discrete Math', courseCode: 'CS285')
      .toMap(),
];
