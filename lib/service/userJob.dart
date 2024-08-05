import 'package:dio/dio.dart';
import 'package:flutter_jobs_app/Model/Job.dart';
import 'package:flutter_jobs_app/Model/owner_job.dart';

import 'package:flutter_jobs_app/contents.dart';

Future<List<Job>> getUserJobs(String token) async {
  Dio dio = Dio();

  try {
    // إرسال الطلب
    Response response = await dio.get(
      "$kBaseUrl/api/job/user/jobs",
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    // تحقق من حالة الاستجابة
    if (response.statusCode == 200) {
      // تحويل البيانات إلى قائمة من الكائنات Job
      print('Response data: ${response.data}');
      List<Job> jobs = (response.data as List)
          .map((json) => Job.fromMap(json as Map<String, dynamic>))
          .toList();
      return jobs;
    } else {
      // إذا كانت حالة الاستجابة غير 200، يمكنك التعامل مع الخطأ هنا
      print('Error Response: ${response.statusCode} - ${response.data}');
      return [];
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
    return [];
  }
}
