import 'package:dio/dio.dart';
import 'package:flutter_jobs_app/Model/user_model.dart';

import 'package:flutter_jobs_app/Model/user_taq_model.dart';
import 'package:flutter_jobs_app/contents.dart';

Future<dynamic> getUser(String userId) async {
  Dio dio = Dio();

  try {
    Response response = await dio.get(
      "$kBaseUrl/user/$userId",
    );

    if (response.statusCode == 200) {
    User usermodel= User.fromMap(response.data);
    return usermodel;
    } else {
      print('Error Response: ${response.statusCode} - ${response.data}');
      return {};
    }
  } catch (e) {
    if (e is DioError) {
      print("DioError: ${e.message}");
      if (e.response != null) {
        print("DioError response data: ${e.response?.data}");
      }
    } else {
      print("Error: $e");
    }
    return {};
  }
}
