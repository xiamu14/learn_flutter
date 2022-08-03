import 'package:dio/dio.dart';

import '../model/course.dart';

Future<Course> getCourse(String studentId) async {
  var response = await Dio().get('http://localhost:4000/api/hello');
  // String dataStr = response.data;
  // dynamic jsonList = jsonEncode(dataStr);
  Course result = Course.fromJson(response.data);
  return result;
}
